module BUS(clk, reset_n, m_req, m_wr, m_addr, m_dout, s0_dout, s1_dout, m_grant, m_din, s0_sel, s1_sel, s_addr, s_wr, s_din);
				
	input clk, reset_n, m_req, m_wr;
	input [15:0] m_addr;
	input [63:0] m_dout, s0_dout, s1_dout;
	
	output s0_sel, s1_sel;
	output m_grant;
	output reg s_wr;
	output reg [15:0] s_addr;
	output [63:0] m_din;
	output reg [63:0] s_din;
	
	bus_arbit run_bus_arbit(.clk(clk), .reset_n(reset_n), .m_req(m_req), .m_grant(m_grant)); //for grant
	
	
	always @(*)
	begin
		case(m_grant)
			1'b0: begin
				s_addr <= 16'bx;
				s_wr <= 1'bx;
				s_din <= 64'bx;
			end
			1'b1: begin
				s_addr <= m_addr;
				s_wr <= m_wr;
				s_din <= m_dout;
			end
		endcase
	end //connect datas with m_grant signal
	
	bus_addr run_bus_addr(.s_addr(s_addr), .m_req(m_req), .s0_sel(s0_sel), .s1_sel(s1_sel));
	//for s0_sel, s1_sel
	
	reg [1:0] sel4Mux3;
	
	always @(posedge clk or negedge reset_n) //for select signal with clk
	begin
		if(~reset_n) sel4Mux3 <=2'b00;
		else sel4Mux3 <= {s1_sel,s0_sel};
	end
	
	mux3_64bit for_m_din(.d0(64'h0), .d1(s0_dout), .d2(s1_dout), .s(sel4Mux3), .y(m_din)); //connect slave's output to master's input
	

endmodule
