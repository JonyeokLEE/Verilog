`timescale 1ns/100ps

module tb_bus;
	reg clk, reset_n, m0_req, m0_wr, m1_req, m1_wr;
	reg [7:0] m0_address, m1_address;
	reg [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	
	wire m0_grant, m1_grant, s0_sel, s1_sel, s_wr;
	wire [7:0] s_address;
	wire [31:0] m_din, s_din; //set reg and wire
	
	bus test_bus(.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m0_wr(m0_wr), .m0_address(m0_address), .m0_dout(m0_dout)
	, .m1_req(m1_req), .m1_wr(m1_wr), .m1_address(m1_address), .m1_dout(m1_dout), .s0_dout(s0_dout), .s1_dout(s1_dout)
	, .m0_grant(m0_grant), .m1_grant(m1_grant), .m_din(m_din), .s0_sel(s0_sel), .s1_sel(s1_sel), .s_address(s_address)
	, .s_wr(s_wr), .s_din(s_din)); //run module
	
	always
	begin
		#5; clk = ~clk;
	end
	//wr = 0 -> write, wr = 1 -> read
	initial
	begin //test begin
		#0; clk = 0; reset_n = 0; m0_req = 1; m1_req = 0; m0_wr = 0; m1_wr = 0; m0_address= 8'h00; m1_address=8'h00; 
		s0_dout = 32'h11111111; s1_dout = 32'h22222222; m0_dout = 32'h33333333; m1_dout = 32'h44444444;
		#2; reset_n = 1;
		#10; m0_address = 8'h01; s0_dout = 32'h12341111; m0_dout = 32'h34443333;
		#10; m0_address = 8'h02; s0_dout = 32'hDDDD1111; m0_dout = 32'hDEF43333;
		#10; m0_address = 8'h03; s0_dout = 32'h12455111; m0_dout = 32'h86543245;
		#10; m0_address = 8'h04; s0_dout = 32'hAD233111; m0_dout = 32'hCEF53233;
		#10; m0_address = 8'h21; s1_dout = 32'h23231111; m0_dout = 32'hDCCCCCCC;
		#10; m0_address = 8'h22; s1_dout = 32'h10340011; m0_dout = 32'h31233433;
		#10; m0_address = 8'h23; s1_dout = 32'hA2AA1111; m0_dout = 32'h89898989;
		#10; m0_address = 8'h24; s1_dout = 32'hBBBB1111; m0_dout = 32'hFFFFFFFF;
		#10; m1_req = 1;
		#30; m0_req = 0; m1_address = 8'h01; s0_dout = 32'h43211111; m1_dout = 32'h34443333;
		#10; m1_address = 8'h02; s0_dout = 32'hDDDD1111; m1_dout = 32'hDEF43333;
		#10; m1_address = 8'h03; s0_dout = 32'h12455111; m1_dout = 32'h86543245;
		#10; m1_address = 8'h04; s0_dout = 32'hAD233111; m1_dout = 32'hCEF53233;
		#10; m1_address = 8'h21; s1_dout = 32'hDCDCDCDC; m1_dout = 32'hDDDDDDDD;
		#10; m1_address = 8'h22; s1_dout = 32'hBABABABA; m1_dout = 32'h31111111;
		#10; m1_address = 8'h23; s1_dout = 32'h78787878; m1_dout = 32'h24443333;
		#10; m1_address = 8'h24; s1_dout = 32'h196ABCDD; m1_dout = 32'h34443333;
		#10; m0_req = 1;
		#30; m1_req = 0;
		#10; $finish;
	end //test end
endmodule
