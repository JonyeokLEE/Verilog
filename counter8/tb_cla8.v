`timescale 1ns/100ps

module tb_cla8;
	reg [7:0] a, b;
	reg ci;
	wire [7:0] s;
	wire co;
	wire [8:0] result; //set reg and wire
	
	assign result = {co, s}; //for total result with Cout
	
	cla8 cla8_test (.a(a), .b(b), .ci(ci), .s(s), .co(co)); //run module
	
	initial
	begin
		#0 a = 8'b00000000; b = 8'b00000000; ci = 1'b0;
		#10 a = 8'b11111111; b = 8'b00000001; ci = 1'b0;
		#10 a = 8'b11111111; b = 8'b11111111; ci = 1'b0;
		#10 a = 8'b01010101; b = 8'b00101011; ci = 1'b1;
		#10 $finish;
	end //end test
	
endmodule
