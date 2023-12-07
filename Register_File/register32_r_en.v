module register32_r_en(clk, reset_n, en, d, q);
	input clk, reset_n, en;
	input [31:0] d;
	output reg [31:0] q; //set input and output and reg
	
	always @(posedge clk or negedge reset_n)
	begin
		if(reset_n==0) q<=32'b0; //for reset signal
		else if(en) q<=d; //for enable signal
		else q<=q; //else
	end
	
endmodule
