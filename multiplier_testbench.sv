// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module multiplier_testbench(result);
	reg [7:0] num1;
	reg [7:0] num2;
	output [15:0] result;
	
	ALU_multiplier myMulti(.first(num1), .second(num2), .result(result));
	
	initial begin
		num1 = 8'b10000000;
		num2 = 8'b00000001;
		// should be 0000 0000 1000 0000
		#50;
		num1 = 8'b01000000;
		num2 = 8'b10000000;
		// should be 0010 0000 0000 0000
		#50;
		num1 = 8'b10000000;
		num2 = 8'b10000000;
		// should be 0100 0000 0000 0000
		#50;
		num1 = 8'b01000000;
		num2 = 8'b00100000;
		// should be 0000 1000 0000 0000
		#50;
	end

endmodule 