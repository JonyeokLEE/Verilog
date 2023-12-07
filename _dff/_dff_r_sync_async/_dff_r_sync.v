module _dff_r_sync(clk, reset_n, d, q);
	input clk, reset_n, d;
	output q;
	reg q; //set input and output and reg
	
	always @(posedge clk) begin //only about clk
	if(reset_n==0) q<=1'b0;
	else q<=d;
	
	end

endmodule
