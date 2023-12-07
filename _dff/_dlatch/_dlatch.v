module _dlatch(clk, d, q, q_bar);
	input clk;
	input d;
	output q,q_bar; //assign input and output
	reg q; //assign reg
	
	always @(clk or d) begin //if clk or d are changed
		if(clk==1) q<=d; //if clk is 1 -> update d to q
	end
	
	assign q_bar = ~q; //assign q_bar
	
endmodule
