module rca_clk(clk,a,b,ci,s,co); 
	input clk; 
	input [31:0] a,b; 
	input ci; //set input
	output [31:0] s; 
	output co; //set output
	reg [31:0] reg_a, reg_b; 
	reg reg_ci;
	reg [31:0] reg_s;
	reg reg_co; //set reg
	wire [31:0] wire_s; 
	wire wire_co; //set wire
	always@(posedge clk) 
	begin 
	reg_a <= a; 
	reg_b <= b;
	reg_ci <= ci;
	reg_s <= wire_s;
	reg_co <= wire_co; //input the value when posedge
	end
rca32 test_rca32(.a(reg_a), .b(reg_b), .ci(reg_ci),
.s(wire_s), .co(wire_co)); //run module
assign s = reg_s; 
assign co = reg_co; //assign
endmodule
