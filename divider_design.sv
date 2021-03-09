// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module divider_design(num1, num2, result);
	input signed [7:0] num1;
	input [7:0] num2;
	output [15:0] result;
	wire [7:0] msb1, lsb, temp1, temp2, test;
	assign lsb = {8{num1[0]}};
	assign msb1 = {8{num1[7]}};
	assign test = msb1 & lsb;
	assign temp1 = num1 >>> num2;
	assign temp2 = (num1 >>> num2) - 1;
	assign result[7:0] = (~test & temp1) | (test & temp2);
	assign result [15:8] = msb1;
	
	
endmodule 