module _dff_r(clk, reset_n, d, q);
	input clk, reset_n, d;
	output q;
	reg q; //set input and reg and output
	
	always @(posedge clk or negedge reset_n) begin //about clk and reset
	if(reset_n==0) q<=1'b0;
	else q<=d;
	
	end

endmodule
