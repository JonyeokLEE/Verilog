module fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);
	input [2:0] state;
	input [3:0] data_count;
	output reg full, empty, wr_ack, wr_err, rd_ack, rd_err; //set input and output and reg
	
	parameter INIT = 3'b000;
	parameter READ = 3'b001;
	parameter WRITE = 3'b010;
	parameter RD_ERROR = 3'b011;
	parameter WR_ERROR = 3'b100;
	parameter NO_OP = 3'b101; //set parameter
	
	
	always @(state, data_count)
	begin
		case(state)
		INIT: begin //INIT state
			if(data_count==0) empty <= 1;
			else empty<=0;
			if(data_count==8) full <= 1;
			else full <= 0;
			rd_ack<=1'b0; rd_err<=1'b0;
			wr_err<=1'b0; wr_ack<=1'b0;
		end
		READ: begin //READ state
			if(data_count==0) empty <= 1;
			else empty<=0;
			if(data_count==8) full <= 1;
			else full <= 0;
			rd_ack<=1'b1; rd_err<=1'b0;
			wr_err<=1'b0; wr_ack<=1'b0;
		end
		WRITE: begin //WRITE state
			if(data_count==0) empty <= 1;
			else empty<=0;
			if(data_count==8) full <= 1;
			else full <= 0;
			rd_ack<=1'b0; rd_err<=1'b0;
			wr_err<=1'b0; wr_ack<=1'b1;
		end
		RD_ERROR: begin //RD_ERROR state
			if(data_count==0) empty <= 1;
			else empty<=0;
			if(data_count==8) full <= 1;
			else full <= 0;
			rd_ack<=1'b0; rd_err<=1'b1;
			wr_err<=1'b0; wr_ack<=1'b0;
		end
		WR_ERROR: begin //WR_ERROR state
			if(data_count==0) empty <= 1;
			else empty<=0;
			if(data_count==8) full <= 1;
			else full <= 0;
			rd_ack<=1'b0; rd_err<=1'b0;
			wr_err<=1'b1; wr_ack<=1'b0;
		end
		NO_OP: begin //NO_OP state
			if(data_count==0) empty <= 1;
			else empty<=0;
			if(data_count==8) full <= 1;
			else full <= 0;
			rd_ack<=1'b0; rd_err<=1'b0;
			wr_err<=1'b0; wr_ack<=1'b0;
		end
		default: begin //default state
			empty<=1'bx ; full <= 1'bx;
			rd_ack<=1'bx; rd_err<=1'bx;
			wr_err<=1'bx; wr_ack<=1'bx;	
		end
	endcase
	end
	

endmodule
