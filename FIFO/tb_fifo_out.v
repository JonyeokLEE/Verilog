`timescale 1ns/100ps
module tb_fifo_out;
	reg [2:0] tb_state;
	reg [3:0] tb_data_count;
	wire tb_full, tb_empty, tb_wr_ack, tb_wr_err, tb_rd_ack, tb_rd_err; //set reg and wire
	
	parameter INIT = 3'b000;
	parameter READ = 3'b001;
	parameter WRITE = 3'b010;
	parameter RD_ERROR = 3'b011;
	parameter WR_ERROR = 3'b100;
	parameter NO_OP = 3'b101; //set parameter
	
	fifo_out test_fifo_out(tb_state, tb_data_count, tb_full, tb_empty, tb_wr_ack, tb_wr_err, tb_rd_ack, tb_rd_err);
	//run module
	
	initial
	begin
		#0; tb_state = INIT; tb_data_count = 0;
		#10; tb_state = INIT; tb_data_count = 5;
		#10; tb_state = INIT; tb_data_count = 8;
		
		#10; tb_state = READ; tb_data_count = 0;
		#10; tb_state = READ; tb_data_count = 5;
		#10; tb_state = READ; tb_data_count = 8;
		
		#10; tb_state = WRITE; tb_data_count = 0;
		#10; tb_state = WRITE; tb_data_count = 5;
		#10; tb_state = WRITE; tb_data_count = 8;
		
		#10; tb_state = NO_OP; tb_data_count = 0;
		#10; tb_state = NO_OP; tb_data_count = 5;
		#10; tb_state = NO_OP; tb_data_count = 8;
		
		#10; tb_state = RD_ERROR; tb_data_count = 0;
		#10; tb_state = RD_ERROR; tb_data_count = 5;
		#10; tb_state = RD_ERROR; tb_data_count = 8;
		
		#10; tb_state = WR_ERROR; tb_data_count = 0;
		#10; tb_state = WR_ERROR; tb_data_count = 5;
		#10; tb_state = WR_ERROR; tb_data_count = 8;
		
		#10; $finish;
	end //end test
	
	
endmodule
