`timescale 1ns/100ps

module tb_ram;
	reg tb_clk, tb_cen, tb_wen;
	reg [7:0] tb_s_addr;
	reg [63:0] tb_s_din;
	wire [63:0] tb_s_dout;
   
   ram run_ram(.clk(tb_clk), .cen(tb_cen), .wen(tb_wen), .s_addr(tb_s_addr), .s_din(tb_s_din), .s_dout(tb_s_dout));
	//run module
      
   always
	begin
      #5; tb_clk = ~tb_clk;
   end //set clk period
	
	//cen == 1 && wen == 1 -> write data at addr, dout = 0
	//cen == 1 && wen == 0 -> write addr's data to dout
	//cen == 0 -> dout = 0
	
	initial
	begin //test start
		#0; tb_clk = 1'b0; tb_cen=1'b1; tb_wen=1'b1;
		#50; tb_s_addr = 8'd0; tb_s_din = 64'h1111111111111111;
		#50; tb_s_addr = 8'd100; tb_s_din = 64'h2222222222222222;
		#50; tb_s_addr = 8'd234; tb_s_din = 64'h1234567812345678;
		#50; tb_s_addr = 8'd255; tb_s_din = 64'hFFFFFFFFFFFFFFFF;
		#50; tb_s_addr = 8'd0; tb_cen=1'b1; tb_wen=1'b0;
		#50; tb_s_addr = 8'd100;
		#50; tb_s_addr = 8'd234;
		#50; tb_s_addr = 8'd255;
		#50; tb_cen = 1'b0; tb_wen = 1'b1; tb_s_addr = 8'd0; tb_s_din = 64'h8888888888888888;
		#50; tb_wen = 1'b0;
		#50; $finish;
	end //test end
	
endmodule
