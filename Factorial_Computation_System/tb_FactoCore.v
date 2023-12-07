`timescale 1ns/100ps

module tb_FactoCore;
	reg clk, reset_n, s_sel, s_wr;
	reg [15:0] s_addr;
	reg [63:0] s_din;
	wire [63:0] s_dout;
	wire interrupt;
	
	FactoCore run_FactoCore(.clk(clk), .reset_n(reset_n), .s_sel(s_sel), .s_wr(s_wr), .s_addr(s_addr), .s_din(s_din)
	, .s_dout(s_dout), .interrupt(interrupt));
	
	always
	begin
		#5; clk=~clk;
	end
	
	initial
	begin
		#0; clk=0; reset_n=0; s_sel=1; s_wr=0; s_addr = 16'h0000; s_din = 1'b0;
		#3; reset_n = 1; s_wr = 1;
		
		#10; s_addr = 16'h7020; s_din = 64'd3; //operand = 3
		#10; s_addr = 16'h7018; s_din = 64'd1; //intrEn = 1
		#10; s_addr = 16'h7000; s_din = 64'd1; // opstart = 1
		#2000; s_addr= 16'h7030; s_wr = 0; // result_l / read mode
		#1000; s_addr = 16'h7028; //result_h
		
		#500; s_addr = 16'h7008; s_din = 64'd1; s_wr = 1; //opclear = 1 -> clear
		#50; s_addr = 16'h7008; s_din = 64'd0; //opclear = 0
		
		#10; s_addr = 16'h7020; s_din = 64'd5; //operand = 5
		#10; s_addr = 16'h7018; s_din = 64'd1; //intrEn = 1
		#10; s_addr = 16'h7000; s_din = 64'd1; // opstart = 1
		#2000; s_addr= 16'h7030; s_wr = 0; // result_l / read mode
		#1000; s_addr = 16'h7028; //result_h
		
		#500; s_addr = 16'h7008; s_din = 64'd1; s_wr = 1; //opclear = 1 -> clear
		#50; s_addr = 16'h7008; s_din = 64'd0; //opclear = 0
		
		#10; s_addr = 16'h7020; s_din = 64'd10; //operand = 10
		#10; s_addr = 16'h7018; s_din = 64'd1; //intrEn = 1
		#10; s_addr = 16'h7000; s_din = 64'd1; // opstart = 1
		#5000; s_addr= 16'h7030; s_wr = 0; // result_l / read mode
		#1000; s_addr = 16'h7028; //result_h
		
		#500; s_addr = 16'h7008; s_din = 64'd1; s_wr = 1; //opclear = 1 -> clear
		#50; s_addr = 16'h7008; s_din = 64'd0; //opclear = 0
		
		#10; s_addr = 16'h7020; s_din = 64'd20; //operand = 20
		#10; s_addr = 16'h7018; s_din = 64'd1; //intrEn = 1
		#10; s_addr = 16'h7000; s_din = 64'd1; // opstart = 1
		#30000; s_addr= 16'h7030; s_wr = 0; // result_l / read mode
		#1000; s_addr = 16'h7028; //result_h
		
		#500; s_addr = 16'h7008; s_din = 64'd1; s_wr = 1; //opclear = 1 -> clear
		#50; s_addr = 16'h7008; s_din = 64'd0; //opclear = 0
		
		#10; s_addr = 16'h7020; s_din = 64'd1; //operand = 1
		#10; s_addr = 16'h7018; s_din = 64'd1; //intrEn = 1
		#10; s_addr = 16'h7000; s_din = 64'd1; // opstart = 1
		#500; s_addr= 16'h7030; s_wr = 0; // result_l / read mode
		#1000; s_addr = 16'h7028; //result_h
		
		#500; s_addr = 16'h7008; s_din = 64'd1; s_wr = 1; //opclear = 1 -> clear
		#50; s_addr = 16'h7008; s_din = 64'd0; //opclear = 0
		
		#10; s_addr = 16'h7020; s_din = 64'd0; //operand = 0
		#10; s_addr = 16'h7018; s_din = 64'd1; //intrEn = 1
		#10; s_addr = 16'h7000; s_din = 64'd1; // opstart = 1
		#500; s_addr= 16'h7030; s_wr = 0; // result_l / read mode
		#1000; s_addr = 16'h7028; //result_h
		
		#500; s_addr = 16'h7008; s_din = 64'd1; s_wr = 1; //opclear = 1 -> clear
		#50; s_addr = 16'h7008; s_din = 64'd0; //opclear = 0
		
		#500; $stop;
	end
	
endmodule
