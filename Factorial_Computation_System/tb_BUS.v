`timescale 1ns/100ps

module tb_BUS;
	reg clk, reset_n, m_req, m_wr;
	reg [15:0] m_addr;
	reg [63:0] m_dout, s0_dout, s1_dout;
	
	wire m_grant, s0_sel, s1_sel;
	wire s_wr;
	wire [15:0] s_addr;
	wire [63:0] m_din;
	wire [63:0] s_din;
	
	BUS test_BUS(.clk(clk), .reset_n(reset_n), .m_req(m_req), .m_wr(m_wr), .m_addr(m_addr), .m_dout(m_dout), .s0_dout(s0_dout)
	, .s1_dout(s1_dout), .m_grant(m_grant), .m_din(m_din), .s0_sel(s0_sel), .s1_sel(s1_sel), .s_addr(s_addr), .s_wr(s_wr), .s_din(s_din));
	//run module
	
	always
	begin
		#5; clk = ~clk;
	end //set clk period
	
	initial
	begin //test begin
		#0; clk = 0; reset_n = 0; m_req = 0; m_wr = 0; m_addr = 16'h0000; m_dout = 64'hFFFFFFFFFFFFFFFF; s0_dout=64'h1111111111111111; s1_dout=64'h7777777777777777;
		#2; reset_n=1; m_req = 1;
		#10; m_req = 1;
		#10; m_addr = 16'h0666;
		#10; m_addr = 16'h07FF;
		#10; m_addr = 16'h3000;
		#10; m_addr = 16'h7000;
		#10; m_addr = 16'h70DD;
		#10; m_addr = 16'h71FF;
		#10; m_addr = 16'h7FFF;
		#10; m_req = 0;
		#10; m_req = 1;
		#10; m_req = 0;
		#10; m_req = 1;
		#30; $stop;
	end //test end
endmodule