// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module ALU_testbench(result);
	reg [7:0] num1;
	reg [7:0] num2;
	reg reset;
	reg [1:0] sel;
	output [15:0] result;
	
	ALU_design myALU(.reset(reset), .num1(num1), .num2(num2), .result(result), .sel(sel));
	
	initial begin
		// test addition
		reset = 0;
		sel = 0;
		num1 = 8'b10000000;
		num2 = 8'b00000001;
		// should get 1111 1111 1000 0001
		#50;
		
		reset = 1;
		#50; 
		
		// test subtraction
		reset = 0;
		sel = 1;
		//
		#50;
		
		reset = 1;
		#50;
		
		// test multiplication
		reset = 0;
		sel = 2;
		// should be 0000 0000 1000 0000
		#50;
		
		reset = 1;
		#50;
		
		// test divider
		reset = 0;
		sel = 3;
		num2 = 8'b00000010;
		// should be 1111 1111 1110 0000
		#50;
	end

endmodule 