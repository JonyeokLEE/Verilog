module cc_logic(op, shamt, d_in, d_out, d_next);
	
	input [2:0]op;
	input [1:0]shamt;
	input [7:0]d_in;
	input [7:0]d_out;
	output reg [7:0]d_next; //set input and output and reg
	
	wire [7:0] d_lsl;
	wire [7:0] d_lsr;
	wire [7:0] d_asr; //set wire
	
	parameter NOP=3'b000;
	parameter LOAD=3'b001;
	parameter LSL=3'b010;
	parameter LSR=3'b011;
	parameter ASR=3'b100; //set parameter
	
	always @(op, shamt, d_in, d_out, d_lsl, d_lsr, d_asr)
	begin
		case(op)
		NOP: d_next<=d_out;
		LOAD: d_next<=d_in;
		LSL: d_next<=d_lsl;
		LSR: d_next<=d_lsr;
		ASR: d_next<=d_asr;
		endcase //match each output with its op
	end
	
	LSL8 LSL8_0(d_out, shamt, d_lsl);
	LSR8 LSR8_0(d_out, shamt, d_lsr);
	ASR8 ASR8_0(d_out, shamt, d_asr); //run module to get shift result
	

endmodule
