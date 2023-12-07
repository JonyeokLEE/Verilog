module fifo(clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
	input clk, reset_n, rd_en, wr_en;
	input [31:0] d_in;
	output reg [31:0] d_out;
	output full, empty, wr_ack, wr_err, rd_ack, rd_err;
	output reg [3:0] data_count; //set input and output and reg
	
	wire [31:0] sel_d_out;
	
	reg [2:0] state;
	reg [2:0] head, tail;
	wire we, re;
	wire [2:0] next_state;
	wire [2:0] next_head, next_tail;
	wire [3:0] next_data_count; //set reg and wire
	
	parameter INIT = 3'b000;
	parameter READ = 3'b001;
	parameter WRITE = 3'b010;
	parameter RD_ERROR = 3'b011;
	parameter WR_ERROR = 3'b100;
	parameter NO_OP = 3'b101; //set state's parameter

	fifo_ns run_fifo_ns(.wr_en(wr_en), .rd_en(rd_en), .state(state), .data_count(data_count), .next_state(next_state));
	fifo_cal_addr run_fifo_cal_addr(.state(next_state), .head(head), .tail(tail), .data_count(data_count), 
	.we(we), .re(re), .next_head(next_head), .next_tail(next_tail), .next_data_count(next_data_count));
	//get next state and address
		
	always @(posedge clk or negedge reset_n)
	begin
		if(reset_n==0) begin //for active low reset
			state <= INIT;
			data_count <= 0;
			head <= 0;
			tail <= 0;
			d_out <= 0;
		end
		else begin
			state <= next_state;
			data_count <= next_data_count;
			head <= next_head;
			tail <= next_tail;
			d_out <= (~re) ? 32'h0 : sel_d_out;
		end //update each reg
	end
	
	fifo_out run_fifo_out(.state(state), .data_count(data_count), .full(full), .empty(empty), .wr_ack(wr_ack), .wr_err(wr_err)
	, .rd_ack(rd_ack), .rd_err(rd_err));
	Register_file run_Register_file(.clk(clk), .reset_n(reset_n), .wAddr(tail), .wData(d_in), .we(we), .rAddr(head), .rData(sel_d_out));
	//get output and run Register file
	
		
endmodule
