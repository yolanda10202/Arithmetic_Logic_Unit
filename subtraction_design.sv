// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module subtraction_design(num1, num2, sout);
	input [7:0] num1, num2;
	output [8:0] sout;

	addition_design myAdd(.num1(num1), .num2(~num2 + 1), .sout(sout));
	
endmodule 