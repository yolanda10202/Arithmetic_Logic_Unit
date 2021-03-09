// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module ALU_multiplier(first, second, result);
	input [7:0] first;
	input [7:0] second;
	output [15:0] result;
	wire w;
	
	wire [7:0] w0;
	wire [7:0] w1;
	wire [7:0] w2;
	wire [7:0] w3;
	wire [7:0] w4;
	wire [7:0] w5;
	wire [7:0] w6;
	wire [7:0] w7;
	
	wire [8:0] a1_result;
	wire [8:0] a2_result;
	wire [8:0] a3_result;
	wire [8:0] a4_result;
	wire [8:0] a5_result;
	wire [8:0] a6_result;
	wire [8:0] a7_result;

	//To Do: Partial Product Multiplication Step
	//Determine what value must be used to make the partial products
	assign w0 = first & ({8{second[0]}});
	assign w1 = first & ({8{second[1]}});
	assign w2 = first & ({8{second[2]}});
	assign w3 = first & ({8{second[3]}});
	assign w4 = first & ({8{second[4]}});
	assign w5 = first & ({8{second[5]}});
	assign w6 = first & ({8{second[6]}});
	assign w7 = first & ({8{second[7]}});
	
	
	//To Do: Summing Partial Products Step
	//Determine what should go in each 8-bit adder to create the sum of partial products
	//Hint: Part of the results of one adder get passed as the input to the next adder
	//Hint: Look at the slides
	assign w = 0;
	addition_design a1(.num1({w,w0[7:1]}), .num2(w1), .sout(a1_result));
	addition_design a2(.num1({a1_result[8],a1_result[7:1]}), .num2(w2), .sout(a2_result));
	addition_design a3(.num1({a2_result[8],a2_result[7:1]}), .num2(w3), .sout(a3_result));
	addition_design a4(.num1({a3_result[8],a3_result[7:1]}), .num2(w4), .sout(a4_result));
	addition_design a5(.num1({a4_result[8],a4_result[7:1]}), .num2(w5), .sout(a5_result));
	addition_design a6(.num1({a5_result[8],a5_result[7:1]}), .num2(w6), .sout(a6_result));
	addition_design a7(.num1({a6_result[8],a6_result[7:1]}), .num2(w7), .sout(a7_result));
	
	//To Do: Concatenate the correct result bits of partial product sums to make the result
	assign result = {a7_result, a6_result[0], a5_result[0], a4_result[0], 
					     a3_result[0], a2_result[0], a1_result[0],w0[0]};
	
endmodule 