module bus_addr(s_addr, m_req, s0_sel, s1_sel);
	input [15:0] s_addr;
	input m_req;
	output reg s0_sel, s1_sel;
	
	always @(*) begin
		case(m_req)
		1'b1: begin //m_req = 1
			if((s_addr>=16'h0000)&&(s_addr<=16'h07FF)) begin //Address of ram
				s0_sel<=1'b1;
				s1_sel<=1'b0;
			end
			else if((s_addr>=16'h7000)&&(s_addr<=16'h71FF)) begin //Address of Factorial Core
				s0_sel<=1'b0;
				s1_sel<=1'b1;
			end
			else begin //else offset
				s0_sel<=1'b0;
				s1_sel<=1'b0;
			end
		end
		1'b0: begin //m_req = 0
			s0_sel <= 1'b0;
			s1_sel <= 1'b0;
		end
		endcase
	end
		
endmodule
