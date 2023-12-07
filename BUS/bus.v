module bus(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr, m1_address, m1_dout,
				s0_dout, s1_dout, m0_grant, m1_grant, m_din, s0_sel, s1_sel, s_address, s_wr, s_din);
				
	input clk, reset_n, m0_req, m0_wr, m1_req, m1_wr;
	input [7:0] m0_address, m1_address;
	input [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	
	output m0_grant, m1_grant, s0_sel, s1_sel, s_wr;
	output [7:0] s_address;
	output [31:0] m_din, s_din;
	
	wire m_sel;
	reg [2:0]sel4Mux3; //set input and output and reg and wire
	
	bus_arbit Arbiter(.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m1_req(m1_req), .m0_grant(m0_grant), .m1_grant(m1_grant), .m_sel(m_sel));
	mux2 for_wr(.d0(m0_wr), .d1(m1_wr), .s(m_sel), .y(s_wr));
	mux2_8bits for_addr(.d0(m0_address), .d1(m1_address), .s(m_sel), .y(s_address));
	mux2_32bits for_s_din(.d0(m0_dout), .d1(m1_dout), .s(m_sel), .y(s_din));
	bus_addr Address_decoder(.s_address(s_address), .s0_sel(s0_sel), .s1_sel(s1_sel)); //run module for selection
	
	always @(posedge clk or negedge reset_n)
	begin
		if(~reset_n) sel4Mux3 <=2'b00;
		else sel4Mux3 <= {s1_sel,s0_sel};
	end //set selection signal for MUX3
	
	mux3_32bit for_m_din(.d0(32'h0), .d1(s0_dout), .d2(s1_dout), .s(sel4Mux3), .y(m_din)); //run module for selection
	

endmodule
