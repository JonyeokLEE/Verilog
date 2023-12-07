module bus_addr(s_address, s0_sel, s1_sel);
	input [7:0] s_address;
	output reg s0_sel, s1_sel;
	
	always@(s_address)
	begin
		if((s_address>=8'h00)&&(s_address<8'h20)) begin
			s0_sel<=1'b1;
			s1_sel<=1'b0;
		end
		else if((s_address>=8'h20)&&(s_address<8'h40)) begin
			s0_sel<=1'b0;
			s1_sel<=1'b1;
		end
		else begin
			s0_sel<=1'b0;
			s1_sel<=1'b0;
		end
	end //set slave selection
	
endmodule
