module fifo_ns(wr_en, rd_en, state, data_count, next_state);
	input wr_en, rd_en;
	input [2:0] state;
	input [3:0] data_count;
	output reg [2:0]next_state; //set input and output and reg
	
	parameter INIT = 3'b000;
	parameter READ = 3'b001;
	parameter WRITE = 3'b010;
	parameter RD_ERROR = 3'b011;
	parameter WR_ERROR = 3'b100;
	parameter NO_OP = 3'b101; //set parameter about states
	
	always @(state, data_count, wr_en, rd_en)
	begin
		casex({state, rd_en, wr_en, data_count})
		{READ, 1'b0, 1'b1, 4'bx} : begin //READ state
			if(data_count < 4'd8) begin
				next_state <= WRITE;
			end
		end
		{READ, 1'b1, 1'b0, 4'bx} : begin
			if(data_count > 4'd0) begin
				next_state <= READ;
			end
			else begin
				next_state <= RD_ERROR; 
			end
		end
		{READ, 1'b0, 1'b0, 4'bx} : next_state <= NO_OP;
		{READ, 1'b1, 1'b1, 4'bx} : next_state <= NO_OP;
		
		{WRITE, 1'b1, 1'b0, 4'bx} : begin //WRITE state
			if(data_count > 4'd0) begin
				next_state <= READ;
			end
		end
		{WRITE, 1'b0, 1'b1, 4'bx} : begin
			if(data_count < 4'd8) begin
				next_state <= WRITE;
			end
			else begin
				next_state <= WR_ERROR; 
			end
		end
		{WRITE, 1'b0, 1'b0, 4'bx} : next_state <= NO_OP;
		{WRITE, 1'b1, 1'b1, 4'bx} : next_state <= NO_OP;
		
		{INIT, 1'b0, 1'b0, 4'bx} : next_state <= NO_OP; //INIT state
		{INIT, 1'b1, 1'b1, 4'bx} : next_state <= NO_OP;
		{INIT, 1'b1, 1'b0, 4'b0} : next_state <= RD_ERROR;
		{INIT, 1'b0, 1'b1, 4'bx} : begin
			if(data_count < 4'd8) begin
				next_state <= WRITE;
			end
		end
		
		{NO_OP, 1'b0, 1'b1, 4'bx} : begin //NO_OP state
			if(data_count < 4'd8) begin
				next_state <= WRITE;
			end
			else begin
				next_state <= WR_ERROR; 
			end
		end
		{NO_OP, 1'b1, 1'b0, 4'bx} : begin
			if(data_count > 4'd0) begin
				next_state <= READ;
			end
			else begin
				next_state <= RD_ERROR; 
			end
		end
		{NO_OP, 1'b0, 1'b0, 4'bx} : next_state <= NO_OP;
		{NO_OP, 1'b1, 1'b1, 4'bx} : next_state <= NO_OP;
		
		{RD_ERROR, 1'b0, 1'b1, 4'bx} : begin //RD_ERROR state
			if(data_count < 4'd8) begin
				next_state <= WRITE;
			end
		end
		{RD_ERROR, 1'b0, 1'b0, 4'bx} : next_state <= NO_OP;
		{RD_ERROR, 1'b1, 1'b1, 4'bx} : next_state <= NO_OP;
		{RD_ERROR, 1'b1, 1'b0, 4'b0} : next_state <= RD_ERROR;
		{RD_ERROR, 1'b0, 1'b1, 4'bx} : begin
			if(data_count < 4'd8) begin
				next_state <= WRITE;
			end
		end
		{WR_ERROR, 1'b0, 1'b0, 4'bx} : next_state <= NO_OP; //WR_ERROR state
		{WR_ERROR, 1'b1, 1'b1, 4'bx} : next_state <= NO_OP;
		{WR_ERROR, 1'b0, 1'b1, 4'd8} : next_state <= WR_ERROR;
		{WR_ERROR, 1'b1, 1'b0, 4'bx} : begin
			if(data_count > 4'd0) begin
				next_state <= READ;
			end
		end
		default: next_state <= 3'bx; //set default
		endcase
	end
	
endmodule
