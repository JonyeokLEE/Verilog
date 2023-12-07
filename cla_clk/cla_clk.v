module cla_clk(clk, a, b, ci, s, co); //CLA module with CLK
	
	input clk;
	input [31:0] a, b;
	input ci; //set input
	
	output [31:0] s;
	output co; //set output
	
	reg [31:0] reg_a, reg_b;
	reg reg_ci;
	reg [31:0] reg_s;
	reg reg_co; //set register
	
	wire [31:0] wi_s;
	wire wi_co; //set wire
	
	always @ (posedge clk)
	begin
		reg_co <= wi_co;
		reg_a <= a;
		reg_b <= b;
		reg_s <= wi_s;
		reg_ci <= ci;
	end //if Clock is at the positive edge, substitute the values at once.
	
	cla32 cla32withclk(.a(reg_a), .b(reg_b), .ci(reg_ci), .s(wi_s), .co(wi_co));
	//run cla32
	
	assign s = reg_s;
	
	assign co = reg_co; //assign

endmodule
