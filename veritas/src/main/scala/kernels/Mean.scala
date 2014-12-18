package veritas.kernels

import scalapipe.dsl._

// Relies on the following config parameters:
//    outputCount   --    The number of frames across which the mean
//                        should be taken.

// Gives the mean for each individual pixel across an
// outputCount number of 'frames', not a mean for all of the pixels
// in one frame.
//
// It is worth noting that, as currently written, this hard-codes
// the magic number '1600' for frame size, rather than using
// config parameters. This is done because the mean module is expected
// to only be used to process 40x40 pixel images.

class Mean(_name:String) extends Kernel(_name:String)
{
	val typ = UNSIGNED16
	
	val pixelData = input(typ)

	val mean = output(FLOAT32)

	val outputCount = config(UNSIGNED32, 'outputCount, 1)

	val count = local(UNSIGNED32, 0)
	val state = local(UNSIGNED32, 0)

	val collectionOfMeans = local(Vector(FLOAT32, 1600))		// 	Store the pixel values at each slot
	val emptyCollectionOfMeans = local(Vector(FLOAT32, 1600))	//	This is just for the purpose of clearing the array in constant time, we might want to check
									//	the resource drain of this extra variable
	val pixels = local(UNSIGNED32, 1600)				//	Essentially the size of collectionOfMeans
	val temp = local(FLOAT32, 0)						
	val tempData = local(UNSIGNED16, 0)		 		//	Holds pixelData for cast

	val i = local(UNSIGNED32, 0)

	switch(state) {
		when(0) {				//	Array must be full, we need to clear it, but is this a necessary step.
							//	Optimization:: Does it just take up too much time. Maybe we can just set it equal to empty array
			count = 1
			i = 0
			while (i < pixels) {		//	Clear the whole 1600 size vector
				collectionOfMeans(i) = 0		//REPLACED WITH OPTIMIZATION
				i += 1
			}

//			collectionOfMeans = emptyCollectionOfMeans	// OPTIMIZATION MADE -- O(1) as opposed to O(n)
			state = 1			//	Done clearing, back to taking in new values
		}

		when(1) {
			if (count <= outputCount) {	//	This code will essentially keep the going mean of pixels that go through each slot.
							//	Important to note that this assumes a streaming hardware of 1600 pizels long input
				i = 0			//	Could be optimized if we use a more efficient protocol
				while (i < pixels) {

					tempData = pixelData

					temp = (collectionOfMeans(i) * count) +  cast(tempData, FLOAT32)	
					collectionOfMeans(i) = temp / count
					i += 1

				}
				count += 1
			} else {
				i = 0
				while (i < pixels) {		//	Output the whole vector of means
					mean = collectionOfMeans(i)
					i += 1
				}
				state = 0
			}
		}
	}
}
