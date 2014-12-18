package veritas
import kernels.{  
                  PrimaryFilter, RunLengthEncode, Threshold,
                  Mean, StdDev, BorderExt
               }

import scalapipe.kernels._
import scalapipe.dsl._
import scalapipe._
// extends App == scala boilerplate that may actually not be
//                helpful, anymore. But... tradition! *shrug*
object Main extends App
{
  // External units.
  val BorderExtInput = new BorderExt("BorderExtInput")
  val PrimaryUnit = new PrimaryFilter("PrimaryFilter")
  val RLEUnit = new RunLengthEncode("RunLengthEncode")
  val ThresholdUnit = new Threshold("Threshold")
  val BorderExtLoThreshold = new BorderExt("BorderExtLoThreshold")
  val BorderExtHiThreshold = new BorderExt("BorderExtHiThreshold")
  val MeanUnit = new Mean("Mean")
  val StdDevUnit = new StdDev("StdDev")


  // Constants
  val imgSize = 42 * 42



  // Internal units (subject to change)
  val Read = new Kernel("_input")
  {
    val iterations = config(UNSIGNED32, 'iterations, 0)
   
    val out = output(UNSIGNED16)
   
    out = stdio.rand()
   
    if (iterations > 0) 
      iterations -= 1
    else
      stop
  }



  val Print = new Kernel("_output")
  {
    val in = input(UNSIGNED16)
   
//    stdio.printf("yo %hu\n", in)		//	%hu stands for a 16bit number which would match up with the input(Unsigned16)

  }



  val Dup3 = new Kernel("Dup3")
  {
    val typ = UNSIGNED16
    val in = input(typ)
   
    val y0 = output(typ)
    val y1 = output(typ)
    val y2 = output(typ)
    
    val tmp = local(typ)
   
    tmp = in
   
    y0 = tmp
    y1 = tmp
    y2 = tmp
  }

  val Dup2 = new Kernel("Dup2")
  {
    val typ = FLOAT32
   
    val in = input(typ)
   
    val y0 = output(typ)
    val y1 = output(typ)
    
    val tmp = local(typ)
   
    tmp = in
   
    y0 = tmp
    y1 = tmp
  }

  val PrintSomething = new Kernel("PrintSomething")
  {
    stdio.printf("Print")
  }

  val app = new Application
  {

    val iterations = 1
    val outputCount = 1

    val in = Read('iterations -> iterations)	// Read in the file and give the Read function defined above the specified number of iterations
						// *At least that's what the commented code would do. Right now it just return random numbers
   
    val in3 = Dup3(in)				// Simply duplicate 3 times. 


    val be_in = BorderExtInput(in3(0))		// Immediately returns number input, then if number is on the beginning or end of row returns number again. When we are in on the top
						// or bottom, we begin forming a queue. We then empty that queue whenever we get to the end of the row, by outputting the entire row

    val mean = MeanUnit(in3(1))			// Finds the means of outputCount many numbers for each pixel position. *Note, complexity here is theta(outputCount * pixels)

    val mean2 = Dup2(mean)			// Just dupicate the mean twice

    val std_dev = StdDevUnit(mean2(0), in3(2))	// This is a simple solver of std deviation
   
    val threshold = ThresholdUnit(mean2(1), std_dev) // The function returns a low and high threshold in place (0) and (1)

    // be --> border extended

    val be_lo_threshold = BorderExtLoThreshold(threshold(0))

    val be_hi_threshold = BorderExtHiThreshold(threshold(1))

    val primary = PrimaryUnit(be_in, be_lo_threshold, be_hi_threshold,
                      'outputCount -> outputCount, 'width -> 40, 'height -> 40)	// replaced 1000 with outputCounti

    val runlength_encoded = RLEUnit(primary)

    Print(runlength_encoded(0))



    map(Read -> ANY_KERNEL, CPU2FPGA())
    map(ANY_KERNEL -> Print, FPGA2CPU())
  }
  app.emit("Veritas")
}
