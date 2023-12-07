module tl_cntr(clk,reset_n,Ta,Tb,La,Lb);

	input clk,reset_n,Ta,Tb;
	output reg [1:0] La,Lb; //set input and output reg

	parameter S0=2'b00;
	parameter S1=2'b01;
	parameter S2=2'b10;
	parameter S3=2'b11;
	parameter GREEN=2'b00;
	parameter YELLOW=2'b01;
	parameter RED=2'b10; //set parameter
	
	reg [1:0]cs;
	reg [1:0]ns; //set reg
	
	always @ (posedge clk or negedge reset_n)
	begin
		if (reset_n == 1'b0) cs <= S0; //for reset
		else cs <= ns;
	end
	
	always @ (cs or Ta or Tb)
	begin
	casex ({cs, Ta, Tb})
	{S0, 1'b0, 1'bx}: ns <= S1;
	{S0, 1'b1, 1'bx}: ns <= S0;
	{S1, 1'bx, 1'bx}: ns <= S2;
	{S2, 1'bx, 1'b0}: ns <= S3;
	{S2, 1'bx, 1'b1}: ns <= S2;
	{S3, 1'bx, 1'bx}: ns <= S0; //set next state
	default: ns<= 2'bx;
	endcase
	end
	
	// State output generation
	always @ (cs)
	begin
	casex (cs)
	S0: begin La = GREEN; Lb = RED; end
	S1: begin La = YELLOW; Lb = RED; end
	S2: begin La = RED; Lb = GREEN; end
	S3: begin La = RED; Lb = YELLOW; end
	default: begin La = 2'bx; Lb = 2'bx; end
	endcase //for match each state's output
	end

endmodule
