ECE281_Lab2
===========

# Initial Design

I began this lab by designing the full adder that would be used to produce the four-bit adder.  To do so,
I formed the following truth table and Karnaugh maps to determine the equation needed for the desired outputs
of Sum and Cout from inputs A,B, and Cin 

![](https://github.com/C16erikthompson/ECE281_Lab2/blob/master/PreLab2Truth.JPG?raw=true)

Having developed an equation, I then created the following schematic that implemented the equation

![](https://github.com/C16erikthompson/ECE281_Lab2/blob/master/PreLab2Schem.JPG?raw=true)

This schematic was used to behaviorally create the full adder, which was then simulated, producing the following
waveform

![](https://github.com/C16erikthompson/ECE281_Lab2/blob/master/SingleBitWaveform.png?raw=true)

Because the waveform matched the truth table, I knew that my design was correct and I successfully created the full adder,
a major component of the four-bit adder.

#Four-Bit Adder

The Four-bit adder is a structural entity composed of four full adders strung together.  To achieve basic functionality, 
I linked four of the full-adders together in a manner similar to the following schematic

![](https://github.com/C16erikthompson/ECE281_Lab2/blob/master/FullSchem.JPG?raw=true)

and simulated the device, producing the following output

![](https://github.com/C16erikthompson/ECE281_Lab2/blob/master/Lab2Wave.png?raw=true)

The values were checked both manually and through automated means, and determined to be correct.  I then generated
a .ucf file to test the program on the hardware and was successful in both programing and demonstrating the necessary
functionality.  I then completed the "A level" material by making my device subtract as well.

#Subtractor And Overflow

- To convert the adder into a subtractor, I first had to recognize that a subtractor was merely an adder using the 
two's complement of the second number.  To implement this in my design, I made an if/when statement that would convert
the second input to two's complement when a value was "high," determined by the press of a button.
- To check for overflow, I used the concept that two's overflow occurs when the carry in and carry out to and from the
last bit are not the same.  To implement this behavior, I used an xor gate with the third and fourth carry outs as the
inputs.  When the gate output a 1, overflow had occured.
