# Arithmetic_Logic_Unit
IEEE Student Branch at UCLA Digital Audio Visualizer (DAV) Project Lab 3 Part C

## About
This is module is a Arithmetic Logic Unit. It acts similar to a basic calculator.

There are four different arithmetic operations avaliable:
* [Addition](https://github.com/yolanda10202/Arithmetic_Logic_Unit/blob/main/addition_design.sv)
* [Subtraction](https://github.com/yolanda10202/Arithmetic_Logic_Unit/blob/main/subtraction_design.sv)
* [Multiplication](https://github.com/yolanda10202/Arithmetic_Logic_Unit/blob/main/ALU_multiplier.sv)
* [Division](https://github.com/yolanda10202/Arithmetic_Logic_Unit/blob/main/divider_design.sv)

The ALU module takes in 4 inputs:
* **reset:** Serves as the ON/OFF button *(0: Sets result to 0; 1: Does operation)*
* **num1:** The first number of the equation
* **num2:** The second number of the equation
* **sel:** The operation you want to use *(0: Addition; 1: Subtraction; 2: Multiplication; 3: Division)*

### Addition Design
[adder_design.sv](https://github.com/yolanda10202/Arithmetic_Logic_Unit/blob/main/adders_design.sv) contains the design for *half adder* and *full adder*. Using these two modules, I created 8-bit number adder by connecting the one half adder and 7 full adders in series. The carry out bit and the result bit will carry on to the next adder until it reaches the last adder. 

### Subtration Design
Subtraction is basically addition of a negative number. With this notion, we can utilize our addition design to complete the subtractor. In order to make *addition of a negative number* possible, we will need to use two's complement. The idea is if we want to find the result `a-b`, we are actually solving `a+(-b)` where `-b` is the two's complement of `b`. 

Here's how to convert a binary number to its two's complement:
1. Invert the 0s and 1s in the binary number (ex: `0101` will become `1010`)
2. Add 1 to the inverted number (ex: `1010 + 0001 = 1011`)
3. The resulting number is the two's complement of the original number (ex: `0101` is 5 in decimals and `1011` is -5 in decimals)

We can simply use bitwise operators to accomplish the logic above and pass the two numbers into our addition_design module. Note that, my subtractor module does not support equations written in `-a+b`; all input parameters need to be passed in in the form `a-b`.
```
// The two numbers in your equation
input [7:0] num1; // positive number
input [7:0] num2; // negative number

// instantiate the addition module
addition_design myAdd(.num1(num1), .num2(~num2 + 1), .sout(sout));
```

### Multiplication
This multiplication module is **unsigned**. It takes in two 8-bit numbers and returns a 16-bit product of the two number. 

When we do multiplication by hand, we find the partial product of the number and the multiplier first, and then we sum up all the partial products together to get the final result. In the multiplication design, it is doing the same thing but in binary. 

To find the partial product, we use the bit manipulation:
```
partialProduct0 = num1 & ({8{num2[0]}});
partialProduct1 = num1 & ({8{num2[1]}});
partialProduct2 = num1 & ({8{num2[2]}});
...
partialProductX = num1 & ({8{num2[X]}});
```

### Division
*This is a **special** type of divider, it does not cover all division cases.*

This is a *power of 2* divider that can only divide by powers of 2. For example, the divider can divide 5/2 but not 5/3. 

The good thing about dividing by powers of 2 (as well as multiplying by powers of 2) is that there is a unique bitwise trick to use, **bit shifting**. 
* Division: arithmetic right shift `>>>`
* Multiplication: arithmetic left shift `<<<`

However, one thing to note is that division of positive and negative numbers are slightly different because right shifting will cause approximation to the nearest integer less than that number. In reality, we want an approximation to 0. In order to deal with this situation, we need check if one of our numbers is a negative number. In that case, we will need to use the trick `(num1 >>> num2) - 1`. 

## Note
* Testbenches are only for testing purposes. You may change the testcases on you own. 
* Please do not copy/use the code if you are current a DAV member.
