`timescale 1ns/100ps

module tb_Top;
   reg tb_clk, tb_reset_n, tb_m_req, tb_m_wr;
   reg [15:0] tb_m_addr;
   reg [63:0] tb_m_dout;
   wire tb_m_grant, tb_interrupt;
   wire [63:0] tb_m_din;
   
   Top run_Top(.clk(tb_clk), .reset_n(tb_reset_n), .m_req(tb_m_req), .m_wr(tb_m_wr), .m_addr(tb_m_addr),
      .m_dout(tb_m_dout), .m_grant(tb_m_grant), .interrupt(tb_interrupt), .m_din(tb_m_din));
      
   always
	begin
      #5; tb_clk = ~tb_clk;
   end
	
	//wr = 1 -> write / wr = 0 -> read
	//64bit -> 16 hexadecimal
	
	initial
	begin
		#0; tb_clk = 1'b0; tb_reset_n = 1'b0; tb_m_req = 1'b0; tb_m_wr = 1'b1; 
		#3; tb_reset_n = 1'b1; tb_m_req = 1;
		#50; tb_m_addr = 16'h0000; tb_m_dout = 64'h1111111111111111;
		#50; tb_m_addr = 16'h1111; tb_m_dout = 64'h2222222222222222;
		#50; tb_m_addr = 16'h0234; tb_m_dout = 64'h1234567812345678;
		#50; tb_m_addr = 16'h07FF; tb_m_dout = 64'hFFFFFFFFFFFFFFFF;
		#50; tb_m_addr = 16'h0700; tb_m_dout = 64'hAAAAAAAAAAAAAAAA; tb_m_wr = 1'b0;
		#50; tb_m_addr = 16'h0000;
		#50; tb_m_addr = 16'h1111;
		#50; tb_m_addr = 16'h0234;
		#50; tb_m_addr = 16'h07FF;
		#50; tb_m_addr = 16'h0700;
		#50; tb_m_wr = 1'b1; //for next write operation
		
		#10; tb_m_addr = 16'h7020; tb_m_dout = 64'd3; //operand = 3
		#10; tb_m_addr = 16'h7018; tb_m_dout = 64'd1; //intrEn = 1
		#10; tb_m_addr = 16'h7000; tb_m_dout = 64'd1; // opstart = 1
		#2000; tb_m_addr = 16'h7030; tb_m_wr = 0; // result_l / read mode
		#500; tb_m_addr = 16'h7028; // result_h / read mode
		
		#500; tb_m_addr = 16'h7008; tb_m_dout = 64'd1; tb_m_wr = 1; //opclear = 1 -> clear
		#50; tb_m_addr = 16'h7008; tb_m_dout = 64'd0; //opclear = 0
		
		#10; tb_m_addr = 16'h7020; tb_m_dout = 64'd7; //operand = 7
		#10; tb_m_addr = 16'h7018; tb_m_dout = 64'd1; //intrEn = 1
		#10; tb_m_addr = 16'h7000; tb_m_dout = 64'd1; // opstart = 1
		#2000; tb_m_addr = 16'h7030; tb_m_wr = 0; // result_l / read mode
		#500; tb_m_addr = 16'h7028; // result_h / read mode
		
		#500; tb_m_addr = 16'h7008; tb_m_dout = 64'd1; tb_m_wr = 1; //opclear = 1 -> clear
		#50; tb_m_addr = 16'h7008; tb_m_dout = 64'd0; //opclear = 0
		
		#10; tb_m_addr = 16'h7020; tb_m_dout = 64'd6; //operand = 6
		#10; tb_m_addr = 16'h7018; tb_m_dout = 64'd1; //intrEn = 1
		#10; tb_m_addr = 16'h7000; tb_m_dout = 64'd1; // opstart = 1
		#2000; tb_m_addr = 16'h7030; tb_m_wr = 0; // result_l / read mode
		#500; tb_m_addr = 16'h7028; // result_h / read mode
		
		#500; tb_m_addr = 16'h7008; tb_m_dout = 64'd1; tb_m_wr = 1; //opclear = 1 -> clear
		#50; tb_m_addr = 16'h7008; tb_m_dout = 64'd0; //opclear = 0
		
		#10; tb_m_addr = 16'h7020; tb_m_dout = 64'd1; //operand = 1
		#10; tb_m_addr = 16'h7018; tb_m_dout = 64'd1; //intrEn = 1
		#10; tb_m_addr = 16'h7000; tb_m_dout = 64'd1; // opstart = 1
		#2000; tb_m_addr = 16'h7030; tb_m_wr = 0; // result_l / read mode
		#500; tb_m_addr = 16'h7028; // result_h / read mode
		
		#500; tb_m_addr = 16'h7008; tb_m_dout = 64'd1; tb_m_wr = 1; //opclear = 1 -> clear
		#50; tb_m_addr = 16'h7008; tb_m_dout = 64'd0; //opclear = 0
		
		#10; tb_m_addr = 16'h7020; tb_m_dout = 64'd0; //operand = 0
		#10; tb_m_addr = 16'h7018; tb_m_dout = 64'd1; //intrEn = 1
		#10; tb_m_addr = 16'h7000; tb_m_dout = 64'd1; // opstart = 1
		#2000; tb_m_addr = 16'h7030; tb_m_wr = 0; // result_l / read mode
		#500; tb_m_addr = 16'h7028; // result_h / read mode
		
		#500; tb_m_addr = 16'h7008; tb_m_dout = 64'd1; tb_m_wr = 1; //opclear = 1 -> clear
		#50; tb_m_addr = 16'h7008; tb_m_dout = 64'd0; //opclear = 0
		#50; tb_m_req = 1'b0;
		#500; $stop;
	end
endmodule
