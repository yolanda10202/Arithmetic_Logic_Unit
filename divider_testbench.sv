// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module divider_testbench(result);
	reg [7:0] num1;
	reg [7:0] num2;
	output [15:0] result;
	
	divider_design myDiv(.num1(num1), .num2(num2), .result(result));
	
	initial begin
		num1 = 8'b10000000;
		num2 = 8'b00000010;
		// should be 1111 1111 1110 0000
		#50;
		num1 = 8'b01000000;
		num2 = 8'b00000111;
		// should be 0000 0000 0000 0000
		#50;
		num1 = 8'b10000000;
		num2 = 8'b00000111;
		// should be 1111 1111 1111 1111
		#50;
		num1 = 8'b01000000;
		num2 = 8'b00000101;
		// should be 0000 0000 0000 0010
		#50;
		num1 = 8'b11111001;
		num2 = 8'b00000010;
		// should be 1111 1111 1111 1101
		#50;
	end
	
endmodule 