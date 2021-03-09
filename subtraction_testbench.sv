// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module subtraction_testbench(sout);
	reg [7:0] num1;
	reg [7:0] num2;
	output [8:0] sout;
	
	subtraction_design mySub(.num1(num1), .num2(num2), .sout(sout));
	
	initial begin
		num1 = 8'b10000000;
		num2 = 8'b00000001; // -1 = 1111 1111
		// should be 0111 1111 with cout = 1
		#50;
		num1 = 8'b01000000;
		num2 = 8'b10000000;
		// should be 1100 0000 with cout = 0
		#50;
		num1 = 8'b10000000;
		num2 = 8'b10000000;
		// should be 0000 0000 with cout = 1
		#50;
		num1 = 8'b01000000;
		num2 = 8'b00100000;
		// should be 0010 0000 with cout = 1
		#50;
	end
	
endmodule 