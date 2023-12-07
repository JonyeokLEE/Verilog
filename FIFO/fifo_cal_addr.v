module fifo_cal_addr(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);
	input [2:0] state;
	input [2:0] head;
	input [2:0] tail;
	input [3:0] data_count;
	
	output reg we, re;
	output reg [2:0] next_head;
	output reg [2:0] next_tail;
	output reg [3:0] next_data_count; //set input and reg and output
	
	parameter INIT = 3'b000;
	parameter READ = 3'b001;
	parameter WRITE = 3'b010;
	parameter RD_ERROR = 3'b011;
	parameter WR_ERROR = 3'b100;
	parameter NO_OP = 3'b101; //set parameter
	
	always @(state, head, tail, data_count)
	begin
		case(state)
		INIT: begin //INIT state
			next_head <= 3'b0;
			next_tail <= 3'b0;
			next_data_count <= 4'b0;
			re <= 1'b0;
			we <= 1'b0;
		end
		WRITE: begin //WRITE state
			next_head <= head;
			next_tail <= tail + 1;
			next_data_count <= data_count + 1;
			we <= 1'b1;
			re <= 1'b0;
		end
		WR_ERROR: begin //WR_ERROR state
			next_head <= head;
			next_tail <= tail;
			next_data_count <= data_count;
			re <= 1'b0;
			we <= 1'b0;
		end
		READ: begin //READ state
			next_head <= head + 1;
			next_tail <= tail;
			next_data_count <= data_count - 1;
			re <= 1'b1;
			we <= 1'b0;
		end
		RD_ERROR: begin //RD_ERROR state
			next_head <= head;
			next_tail <= tail;
			next_data_count <= data_count;
			re <= 1'b0;
			we <= 1'b0;
		end
		NO_OP: begin //NO_OP state
			next_head <= head;
			next_tail <= tail;
			next_data_count <= data_count;
			re <= 1'b0;
			we <= 1'b0;
		end
		default: begin //set default
			next_head <= 3'bx;
			next_tail <= 3'bx;
			next_data_count <= 4'bx;
			re <= 1'bx;
			we <= 1'bx;
		end
		endcase
	end
	
endmodule
