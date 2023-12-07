`timescale 1ns/100ps

	module tb_cla4;
	reg [3:0] a, b;
	reg ci;
	wire [3:0] s;
	wire co;
	wire [4:0] result;
	
	assign result = {co, s};
	
	cla4 cla4_test (.a(a), .b(b), .ci(ci), .s(s), .co(co));
	
	initial
	begin
		#0 a = 4'b0000; b = 4'b0000; ci = 1'b0;
		#10 a = 4'b0010; b = 4'b0100; ci = 1'b0;
		#10 a = 4'b1111; b = 4'b1111; ci = 1'b0; //overflow
		#10 a = 4'b1000; b = 4'b1000; ci = 1'b0; //overflow
		#10 a = 4'b0100; b = 4'b0100; ci = 1'b0;
		#10 a = 4'b0110; b = 4'b1001; ci = 1'b0;
		#10 a = 4'b1010; b = 4'b0001; ci = 1'b1;
		#10 a = 4'b0011; b = 4'b1010; ci = 1'b1;
		#10 a = 4'b0001; b = 4'b1011; ci = 1'b1;
		#10 a = 4'b1111; b = 4'b1000; ci = 1'b1; //overflow
		#10 $finish;
	end
endmodule
