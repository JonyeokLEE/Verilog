module bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant, m_sel);

	input clk, reset_n, m0_req,  m1_req;
	output reg m0_grant, m1_grant, m_sel;
	
	reg state, next_state; //set input and output and reg
	
	parameter M0=1'b0;
	parameter M1=1'b1;
	
	//update state
	always@(posedge clk or negedge reset_n)
	begin
		if(~reset_n) state <= M0;
		else state<=next_state;
	end
	
	
	//next_state logic
	always@(state, m0_req, m1_req)
	begin
		casex({state,m0_req, m1_req})
			{M0, 1'b0, 1'b1}: begin
				next_state<=M1;
			end
			{M0, 1'bx, 1'bx}: begin
				next_state<=M0;
			end
			{M1, 1'bx, 1'b0}: begin
				next_state<=M0;
			end
			{M1, 1'bx, 1'b1}: begin
				next_state<=M1;
			end
			default: begin
				next_state<=1'bx;
			end
		endcase
	end
	
	//output logic
	always@(state)
	begin
		case(state)
			M0: begin
				m0_grant<=1'b1;
				m1_grant<=1'b0;
				m_sel<=1'b0;
			end
				
			M1: begin
				m0_grant<=1'b0;
				m1_grant<=1'b1;
				m_sel<=1'b1;
			end
			default: begin
				m0_grant<=1'bx;
				m1_grant<=1'bx;
				m_sel<=1'bx;
			end
		endcase
	end

endmodule
