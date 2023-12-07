`timescale 1ns/100ps

module tb_fifo_cal_addr;
	reg [2:0] tb_state;
	reg [2:0] tb_head;
	reg [2:0] tb_tail;
	reg [3:0] tb_data_count;
	
	wire tb_we, tb_re;
	wire [2:0] tb_next_head;
	wire [2:0] tb_next_tail;
	wire [3:0] tb_next_data_count; //set reg and wire
	
	fifo_cal_addr test_fifo_cal_addr(.state(tb_state), .head(tb_head), .tail(tb_tail), .data_count(tb_data_count)
	, .we(tb_we), .re(tb_re), .next_head(tb_next_head), .next_tail(tb_next_tail), .next_data_count(tb_next_data_count));
	//run module
	
	parameter INIT = 3'b000;
	parameter READ = 3'b001;
	parameter WRITE = 3'b010;
	parameter RD_ERROR = 3'b011;
	parameter WR_ERROR = 3'b100;
	parameter NO_OP = 3'b101; //set parameter
	
	initial
	begin
		#0; tb_state = INIT; tb_head = 3'b001; tb_tail = 3'b010; tb_data_count = 4'd5;
		#10; tb_state = NO_OP; tb_head = 3'b001; tb_tail = 3'b010; tb_data_count = 4'd5;
		#10; tb_state = WRITE; tb_head = 3'b001; tb_tail = 3'b010; tb_data_count = 4'd5;
		#10; tb_state = READ; tb_head = 3'b001; tb_tail = 3'b010; tb_data_count = 4'd5;
		#10; tb_state = WR_ERROR; tb_head = 3'b001; tb_tail = 3'b010; tb_data_count = 4'd5;
		#10; tb_state = RD_ERROR; tb_head = 3'b001; tb_tail = 3'b010; tb_data_count = 4'd5;
		#10; $end;
	end //end test
	
endmodule
