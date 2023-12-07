`timescale 1ns/100ps

module tb_ram;
	reg tb_clk, tb_cen, tb_wen;
	reg [4:0] tb_addr;
	reg [31:0] tb_din;
	wire [31:0] tb_dout;
	
	ram test_ram(.clk(tb_clk), .cen(tb_cen), .wen(tb_wen), .addr(tb_addr), .din(tb_din), .dout(tb_dout)); //run module
	
	always
	begin
		#5; tb_clk = ~tb_clk;
	end //set clk period
	
	initial
	begin
		#0; tb_clk = 0; tb_cen=0; tb_wen=0;tb_addr=5'b0; tb_din = 32'bx;
		#10; tb_cen = 1; tb_wen = 1; tb_din = 32'd0;
		#10; tb_addr=5'd1; tb_din=32'd1;
		#10; tb_addr=5'd2; tb_din=32'd2;
		#10; tb_addr=5'd3; tb_din=32'd3;
		#10; tb_addr=5'd4; tb_din=32'd4;
		#10; tb_addr=5'd5; tb_din=32'd5;
		#10; tb_addr=5'd6; tb_din=32'd6;
		#10; tb_addr=5'd7; tb_din=32'd7;
		#10; tb_addr=5'd8; tb_din=32'd8;
		#10; tb_addr=5'd9; tb_din=32'dx; //input x for test and skip 10th address
		#10; tb_addr=5'd11; tb_din=32'd11;
		#10; tb_addr=5'd12; tb_din=32'd12;
		#10; tb_addr=5'd13; tb_din=32'd13;
		#10; tb_addr=5'd14; tb_din=32'd14;
		#10; tb_addr=5'd15; tb_din=32'd15;
		#10; tb_addr=5'd16; tb_din=32'd16;
		#10; tb_addr=5'd17; tb_din=32'd17;
		#10; tb_addr=5'd18; tb_din=32'd18;
		#10; tb_addr=5'd32; tb_din=32'd32; //wrong memory
		#10; tb_wen = 0; tb_addr= 5'd0; tb_din=32'd0;
		#10; tb_addr=5'd1;
		#10; tb_addr=5'd2;
		#10; tb_addr=5'd3;
		#10; tb_addr=5'd4;
		#10; tb_addr=5'd5;
		#10; tb_addr=5'd6;
		#10; tb_addr=5'd7;
		#10; tb_addr=5'd8;
		#10; tb_addr=5'd9;
		#10; tb_addr=5'd10;
		#10; tb_addr=5'd11;
		#10; tb_addr=5'd12;
		#10; tb_addr=5'd13;
		#10; tb_addr=5'd14;
		#10; tb_addr=5'd15;
		#10; tb_addr=5'd16;
		#10; tb_addr=5'd17;
		#10; tb_addr=5'd18;
		#10; tb_addr=5'd33;
		#10; tb_cen=0;
		#10; tb_addr=5'd8;
		#10; tb_addr=5'd9;
		#10; tb_addr=5'd10;
		#10; tb_addr=5'd11;
		#10; tb_addr=5'd12;
		#10; $finish;
		#10;
	end //end test
	
	
endmodule
