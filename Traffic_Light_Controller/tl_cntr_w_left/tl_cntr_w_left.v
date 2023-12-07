module tl_cntr_w_left(clk,reset_n,Ta,Tal,Tb,Tbl,La,Lb); //have to check module's name

	input clk,reset_n,Ta,Tb,Tal,Tbl;
	output reg [1:0] La,Lb; //set input and output and reg

	parameter S0=3'b000;
	parameter S1=3'b001;
	parameter S2=3'b010;
	parameter S3=3'b011;
	parameter S4=3'b100;
	parameter S5=3'b101;
	parameter S6=3'b110;
	parameter S7=3'b111;
	parameter GREEN=2'b00;
	parameter YELLOW=2'b01;
	parameter LEFT=2'b10;
	parameter RED=2'b11; //set parameter
	
	reg [2:0]cs;
	reg [2:0]ns; //set reg
	
	always @ (posedge clk or negedge reset_n)
	begin
		if (reset_n == 1'b0) cs <= S0; //for reset signal
		else cs <= ns;
	end
	
	always @ (cs or Ta or Tb or Tal or Tbl)
	begin
	casex ({cs, Ta, Tal, Tb, Tbl})
	{S0, 1'b0, 1'bx, 1'bx, 1'bx}: ns <= S1;
	{S0, 1'b1, 1'bx, 1'bx, 1'bx}: ns <= S0;
	{S1, 1'bx, 1'bx, 1'bx, 1'bx}: ns <= S2;
	{S2, 1'bx, 1'b0, 1'bx, 1'bx}: ns <= S3;
	{S2, 1'bx, 1'b1, 1'bx, 1'bx}: ns <= S2;
	{S3, 1'bx, 1'bx, 1'bx, 1'bx}: ns <= S4;
	{S4, 1'bx, 1'bx, 1'b1, 1'bx}: ns <= S4;
	{S4, 1'bx, 1'bx, 1'b0, 1'bx}: ns <= S5;
	{S5, 1'bx, 1'bx, 1'bx, 1'bx}: ns <= S6;
	{S6, 1'bx, 1'bx, 1'bx, 1'b1}: ns <= S6;
	{S6, 1'bx, 1'bx, 1'bx, 1'b0}: ns <= S7;
	{S7, 1'bx, 1'bx, 1'bx, 1'bx}: ns <= S0;
	default: ns<= 2'bx;
	endcase //case about next state
	end
	
	always @ (cs)
	begin
	casex (cs)
	S0: begin La = GREEN; Lb = RED; end
	S1: begin La = YELLOW; Lb = RED; end
	S2: begin La = LEFT; Lb = RED; end
	S3: begin La = YELLOW; Lb = RED; end
	S4: begin La = RED; Lb = GREEN; end
	S5: begin La = RED; Lb = YELLOW; end
	S6: begin La = RED; Lb = LEFT; end
	S7: begin La = RED; Lb = YELLOW; end
	default: begin La = 2'bx; Lb = 2'bx; end //case about output
	endcase
	end

endmodule
