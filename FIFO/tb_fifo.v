`timescale 1ns/100ps

module tb_fifo;
   reg tb_clk, tb_reset_n, tb_rd_en, tb_wr_en;
   reg [31:0] tb_d_in;

   wire [31:0] tb_d_out;
   wire tb_full, tb_empty, tb_wr_ack, tb_wr_err, tb_rd_ack, tb_rd_err;
   wire [3:0] tb_data_count;

   fifo test_fifo(.clk(tb_clk), .reset_n(tb_reset_n),.wr_en(tb_wr_en),.rd_en(tb_rd_en),.d_in(tb_d_in),.d_out(tb_d_out),.full(tb_full)
	,.empty(tb_empty), .wr_ack(tb_wr_ack), .wr_err(tb_wr_err), .rd_ack(tb_rd_ack), .rd_err(tb_rd_err), .data_count(tb_data_count));
		//run module

   //set clock period
   always
	begin
      #5; tb_clk = ~tb_clk;
   end
	
	initial
	begin
		#0; tb_clk = 0; tb_reset_n = 0; tb_rd_en = 0; tb_wr_en = 0; tb_d_in = 32'h00000000;
		#3; tb_reset_n = 1;
		#20; tb_wr_en = 1;
		#10; tb_d_in = 32'h11111111;
		#10; tb_d_in = 32'h22222222;
		#10; tb_d_in = 32'h33333333;
		#10; tb_d_in = 32'h44444444;
		#10; tb_d_in = 32'h55555555;
		#10; tb_d_in = 32'h66666666;
		#10; tb_d_in = 32'h77777777;
		#10; tb_d_in = 32'h88888888;
		#10; tb_d_in = 32'h99999999;
		#10; tb_rd_en = 1; tb_wr_en = 0;
		#80; tb_wr_en = 1; tb_rd_en = 0;
		#30; tb_rd_en = 1; tb_wr_en = 0;
		#10; $finish;
	end

endmodule
