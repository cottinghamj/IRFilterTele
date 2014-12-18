package veritas.kernels

import scalapipe._
import scalapipe.dsl._

class IndStreamMean(_name:String) extends Kernel(_name:String){

	val typ = UNSIGNED16	//	might not be the right type...check
	
	val inputValue = input(typ)
	
	val outputCount = config(UNSIGNED32, 'outputCount, 1)	// Choose how many value to take before
								// outputting a mean
	val mean = output(typ)

	val inputNumber = local(typ, 0)
	val sum = local(typ, 0)
	val tempPixelValue = local(typ, 0)

	
	while(inputNumber < outputCount){		// Please note that I chose to an implicit while
		tempPixelValue = inputValue;		// loop. It could also be implemented the way
		sum += cast(tempPixelValue, FLOAT32)	// the previous mean was, but this way is
		inputNumber++				// simpler to understand
	}
	if(inputNumber == outputCount){			// Output and clear
		sum /= outputCount
		mean = sum

		sum = 0
		inputNumber = 0
	}

}
