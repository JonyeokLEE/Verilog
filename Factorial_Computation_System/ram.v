module ram(clk, cen, wen, s_addr, s_din, s_dout);
	input clk, cen, wen;
	input [7:0]s_addr;
	input [63:0]s_din;
	output reg [63:0]s_dout;
	
	//cen == 1 && wen == 1 -> write data at addr, dout = 0
	//cen == 1 && wen == 0 -> write addr's data to dout
	//cen == 0 -> dout = 0
	
	reg [63:0] mem [0:255];
	integer i;
	
	initial
	begin
		for(i=0;i<256;i= i+1)
		begin
			mem[i] = 64'b0;
		end
	end
	
	always @(posedge clk)
	begin
		casex({cen,wen})
			{1'b1, 1'b1}: begin //Read Mode
				mem[s_addr] <= s_din;
				s_dout<=64'b0;
			end
			{1'b1, 1'b0}: begin //Write Mode
				s_dout <= mem[s_addr];
			end
			{1'b0, 1'bx}: begin //Nothing
				s_dout<=64'b0;
			end
			default: begin //else
				s_dout<=64'bx;
			end
		endcase
	end
	
endmodule
