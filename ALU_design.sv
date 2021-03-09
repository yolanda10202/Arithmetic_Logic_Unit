// DAV Lab3 Arithmetic
`timescale 1 ns/1 ns

module ALU_design(reset, num1, num2, result, sel);
	input reset;
	input [7:0] num1, num2;
	input [1:0] sel;
	output reg [15:0] result; 
	wire [15:0] add, sub, multi, div;
	
	addition_design my_add(.num1(num1), .num2(num2), .sout(add[8:0]));
	assign add[15:9] = {7{add[8]}};
	subtraction_design my_sub(.num1(num1), .num2(num2), .sout(sub[8:0]));
	assign sub[15:9] = {7{sub[8]}};
	ALU_multiplier my_mult(.first(num1), .second(num2), .result(multi));
	divider_design my_div(.num1(num1), .num2(num2), .result(div));
	
	always @ (*) begin
		if (reset == 0) begin
			if (sel == 0) begin
				result = add;
			end
			else if (sel == 1) begin
				result = sub;
			end
			else if (sel == 2) begin
				result = multi;
			end
			else begin
				result = div;
			end
		end
		else begin 
			result = 0;
		end
	end
	

endmodule 