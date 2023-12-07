module ram(clk, cen, wen, addr, din, dout);
	input clk, cen, wen;
	input [4:0]addr;
	input [31:0]din;
	output reg [31:0]dout; //set input and output and reg
	
	//cen == 1 && wen == 1 -> write data at addr, dout = 0
	//cen == 1 && wen == 0 -> write addr's data to dout
	//cen == 0 -> dout = 0
	
	reg [31:0] mem [0:31]; //declare memory
	integer i;
	
	initial
	begin
		for(i=0;i<32;i= i+1)
		begin
			mem[i] = 32'b0;
		end
	end //initial all memory
	
	always @(posedge clk)
	begin
		casex({cen,wen})
			{1'b1, 1'b1}: begin
				if(addr>5'd31) begin
					dout<=32'b0;
				end //if address is greater than 31 -> cannot write
				else begin
				mem[addr] <= din;
				dout<=32'b0;
				end
			end
			
			{1'b1, 1'b0}: begin
				if (addr > 5'd31) begin
					dout <= 32'b0;
				end //if address is greater than 31 -> cannot read
				
				else begin
					dout <= mem[addr];
				end	
			end


			{1'b0, 1'bx}: begin //if cen == 0
				dout<=32'b0;
			end
			
			default: begin
				dout<=32'bx;
			end
		endcase
	end
	
endmodule