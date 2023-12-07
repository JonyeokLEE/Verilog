`timescale 1ns/100ps

module tb_fifo_ns;
	reg tb_wr_en, tb_rd_en;
	reg [2:0] tb_state;
	reg [3:0] tb_data_count;
	wire [2:0] tb_next_state; //set reg and wire
	
	parameter INIT = 3'b000;
	parameter READ = 3'b001;
	parameter WRITE = 3'b010;
	parameter RD_ERROR = 3'b011;
	parameter WR_ERROR = 3'b100;
	parameter NO_OP = 3'b101; //set parameter
	
	fifo_ns test_fifo_ns(.wr_en(tb_wr_en), .rd_en(tb_rd_en), .state(tb_state), .data_count(tb_data_count), .next_state(tb_next_state));
	//run module
	
	initial
	begin
		#0; tb_rd_en=0; tb_wr_en=0; tb_data_count=3; tb_state=INIT;
		#10; tb_rd_en=1; tb_wr_en=1; tb_data_count=3; tb_state=INIT;
		#10; tb_rd_en=0; tb_wr_en=1; tb_data_count=5; tb_state=INIT;
		#10; tb_rd_en=1; tb_wr_en=0; tb_data_count=0; tb_state=INIT;
		
		#10; tb_rd_en=0; tb_wr_en=0; tb_data_count=3; tb_state=READ;
		#10; tb_rd_en=1; tb_wr_en=1; tb_data_count=3; tb_state=READ;
		#10; tb_rd_en=0; tb_wr_en=1; tb_data_count=5; tb_state=READ;
		#10; tb_rd_en=1; tb_wr_en=0; tb_data_count=3; tb_state=READ;
		#10; tb_rd_en=1; tb_wr_en=0; tb_data_count=0; tb_state=READ;
		
		#10; tb_rd_en=0; tb_wr_en=0; tb_data_count=3; tb_state=WRITE;
		#10; tb_rd_en=1; tb_wr_en=1; tb_data_count=3; tb_state=WRITE;
		#10; tb_rd_en=0; tb_wr_en=1; tb_data_count=5; tb_state=WRITE;
		#10; tb_rd_en=0; tb_wr_en=1; tb_data_count=8; tb_state=WRITE;
		#10; tb_rd_en=1; tb_wr_en=0; tb_data_count=5; tb_state=WRITE;
		
		#10; tb_rd_en=0; tb_wr_en=1; tb_data_count=8; tb_state=NO_OP;
		#10; tb_rd_en=1; tb_wr_en=0; tb_data_count=0; tb_state=NO_OP;
		
		#10; tb_rd_en=1; tb_wr_en=1; tb_data_count=5; tb_state=RD_ERROR;
		#10; tb_rd_en=0; tb_wr_en=0; tb_data_count=5; tb_state=RD_ERROR;
		#10; tb_rd_en=0; tb_wr_en=1; tb_data_count=5; tb_state=RD_ERROR;
		#10; tb_rd_en=1; tb_wr_en=0; tb_data_count=0; tb_state=RD_ERROR;
		
		#10; tb_rd_en=1; tb_wr_en=1; tb_data_count=5; tb_state=WR_ERROR;
		#10; tb_rd_en=0; tb_wr_en=0; tb_data_count=5; tb_state=WR_ERROR;
		#10; tb_rd_en=0; tb_wr_en=1; tb_data_count=8; tb_state=WR_ERROR;
		#10; tb_rd_en=1; tb_wr_en=0; tb_data_count=3; tb_state=WR_ERROR;
		#20; $end;
	end //end test
	
endmodule
