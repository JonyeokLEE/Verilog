module bus_arbit(clk, reset_n, m_req, m_grant);

	input clk, reset_n, m_req;
	output reg m_grant;
	
	reg state, next_state;
	
	parameter INIT = 1'b0;
	parameter MASTER = 1'b1; //State which give Grant
	
	//update state
	always@(posedge clk or negedge reset_n)
	begin
		if(~reset_n) state <= INIT;
		else state <= next_state;
	end
	
	
	//next_state logic
	always@(state, m_req)
	begin
		case({state,m_req})
			{INIT, 1'b0}: begin
				next_state<=INIT;
			end
			{INIT, 1'b1}: begin
				next_state<=MASTER;
			end
			{MASTER, 1'b0}: begin
				next_state<=INIT;
			end
			{MASTER, 1'b1}: begin
				next_state<=MASTER;
			end
			default: begin
				next_state<=INIT;
			end
		endcase
	end
	
	//output logic
	always@(state)
	begin
		case(state)
			INIT: begin
				m_grant<=1'b0;
			end
			MASTER: begin
				m_grant<=1'b1;
			end
			default: begin
				m_grant<=1'bx;
			end
		endcase
	end

endmodule
