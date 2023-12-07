module FactoCore(clk, reset_n, s_sel, s_wr, s_addr, s_din, s_dout, interrupt);
	input clk, reset_n, s_sel, s_wr;
	input [15:0] s_addr;
	input [63:0] s_din;
	output reg [63:0] s_dout;
	output interrupt;
	
	wire boothdone;
	reg boothstart, boothclear;
	
	
	reg [63:0] opstart, opclear, opdone, intrEn, result_l, result_h; //Registers
	reg [63:0] operand,operand_ing; //operand_ing is decreasing operand
	
	reg [63:0] before_result; //this gonna be multiplicand
	wire [63:0] reshigh, reslow; //results from multiplier module
	
	reg [2:0] state, next_state; //states
	
	multiplier booth(.clk(clk), .reset_n(reset_n), .multiplier(before_result), .multiplicand(operand_ing), .op_start(boothstart)
	, .op_clear(boothclear), .op_done(boothdone), .result({reshigh,reslow}));
	//run multiplier
	
	_and2 intrSignal(.a(opdone[0]),.b(intrEn[0]),.y(interrupt)); //for intterupt signal
	
	wire [12:0] offset = s_addr[15:3]; //to read address offset
	
	parameter START = 13'hE00;
	parameter CLEAR = 13'hE01;
	parameter DONE = 13'hE02;
	parameter INTR = 13'hE03;
	parameter OPER = 13'hE04;
	parameter RESH = 13'hE05;
	parameter RESL = 13'hE06; //parameter of Registers
	
	parameter INIT = 3'b000;
	parameter READY_0 = 3'b001;
	parameter READY_1 = 3'b010;
	parameter MUL = 3'b011;
	parameter SETBOOTH = 3'b100;
	parameter DONE_ALL = 3'b101;
	parameter CLEARSTATE = 3'b110; //parameter of States
	
	
	//update state
	always @(posedge clk or negedge reset_n)
	begin
		if(~reset_n) state<= INIT;
		else state<=next_state;
	end
	
	//next state logic
	always @(state, opclear, opstart, opdone,boothdone, s_sel)
	begin
		case(state) 
			INIT: begin
				if(opclear[0]==1'b1) next_state<=CLEARSTATE;
				if(s_sel===1'b1) next_state<=READY_0;
				else next_state<=INIT;
			end
			READY_0: begin
				if(opclear[0]==1'b1) next_state<=CLEARSTATE;
				else if(opstart[0]==1'b1) next_state<=MUL;
				else next_state<=READY_1;
			end
			READY_1: begin
				if(opclear[0]==1'b1) next_state<=CLEARSTATE;
				else if(opstart[0]==1'b1) next_state<=MUL;
				else next_state<=READY_0;
			end
			MUL: begin
				if(opclear[0]==1'b1) next_state<=CLEARSTATE;
				else if(opdone[0]==1'b1) next_state<= DONE_ALL;
				else if(boothdone==1'b1) next_state<=SETBOOTH;
				else next_state<=MUL;
			end
			SETBOOTH: begin
				if(opclear[0]==1'b1) next_state<=CLEARSTATE;
				if(opdone[0]==1'b1) next_state<= DONE_ALL;
				else if(boothdone==1'b1) next_state<=MUL;
				else next_state<=SETBOOTH;
			end
			DONE_ALL: begin
				if(opclear[0]==1'b1) next_state<=CLEARSTATE;
				else next_state<=DONE_ALL;
			end
			CLEARSTATE: begin
				if(s_sel===1'b1&&opclear[0]==1'b0) next_state<=READY_0;
				else next_state<=CLEARSTATE;
			end
		endcase
	end
	
	//output logic
	always @(posedge clk)
	begin
		if(s_wr==1'b0&&s_sel==1'b1) begin
			if(offset==DONE) s_dout<=opdone;
			else if(offset==RESH) s_dout<=result_h;
			else if(offset==RESL) s_dout<=result_l;
			else s_dout<=64'b0;
		end
		else s_dout<=64'b0;
	end
	
	//s_wr = 0 -> register read / s_wr = 1 -> register write

	//input logic
	always @(posedge clk)
	begin
		if(state==INIT) begin
				opstart<=64'b0;
				opclear<=64'b0;
				intrEn<=64'b0;
				operand<=64'b0; //initialize
				if(s_wr==1'b1&&s_sel==1'b1) begin
					case(offset)
						START: opstart[0]<=s_din[0];
						CLEAR: opclear[0]<=s_din[0];
						INTR: intrEn[0]<=s_din[0];
						OPER: operand[31:0]<=s_din[31:0];
					endcase
				end
		end
		if(state==CLEARSTATE) begin
				opstart<=64'b0; //initialize
				if(s_wr==1'b1&&s_sel==1'b1) begin
					case(offset)
						START: opstart[0]<=s_din[0];
						CLEAR: opclear[0]<=s_din[0];
						INTR: intrEn[0]<=s_din[0];
						OPER:operand[31:0]<=s_din[31:0];
					endcase
				end
		end
		else begin
		if(s_wr==1'b1&&s_sel==1'b1) begin //get s_din
			case(offset)
				START: opstart[0]<=s_din[0];
				CLEAR: opclear[0]<=s_din[0];
				INTR: intrEn[0]<=s_din[0];
				OPER:operand[31:0]<=s_din[31:0];
			endcase
		end
		end	
	end
	
	reg flag;
	
	//operation logic
	always @(state)
	begin
		case(state)
			INIT: begin
				operand_ing<=64'b0;
				before_result<=64'b0;
				opdone<=64'b0;
				boothstart<=1'b0;
				result_l<=64'd1;
				result_h<=64'b0;
				boothclear<=1'b1;
				flag <= 1'b0;
				operand_ing<=operand; //Reset all regs
			end
			READY_0: begin
				operand_ing<=operand; //get operand to operand_ing
				boothclear<=1'b0;
				if(operand===1 ||operand===0) flag<=1'b1; //if operand = 1 or 0 -> flag On
				else flag <=1'b0; //else flag Off
			end
			READY_1: begin
				operand_ing<=operand; //get operand to operand_ing
				boothclear<=1'b0;
				if(operand===1 ||operand===0) flag<=1'b1; //if operand = 1 or 0 -> flag On
				else flag <=1'b0; //else flag Off
			end
			MUL: begin
				if(operand==64'b0||operand_ing==64'd1) begin //finish condition
					opdone[1:0] = 2'b11; //update opdone
					result_h<=reshigh;
					result_l<=reslow; //write result to registers
					if(flag==1'b1) begin //if operand = 1 or 0 -> result_l = 1, result_h = 0
						result_l<=1'b1;
						result_h<=1'b0;
					end
				end
				
				opdone[1]<=1'b1; //processing -> opdone[1] = 1
				
				if(boothstart===1'b0) begin //when start
					if(result_l === 64'b0) before_result<=result_h;
					else before_result<=result_l; //update before_result
					
					
					boothclear<=1'b0;
					boothstart<=1'b1; //booth multiplier start
				end
			end
			SETBOOTH: begin
				operand_ing<=operand_ing-1; //decrease operand_ing
				result_h<=reshigh;
				result_l<=reslow; //update result
				boothclear <=1'b1;
				boothstart<=1'b0; //booth multiplier reset
			end
			DONE_ALL: begin
				opdone[1:0] = 2'b11;
				result_h<=result_h;
				result_l<=result_l; //keep result
			end
			CLEARSTATE: begin
				operand_ing<=64'b0;
				before_result<=64'b0;
				opdone<=64'b0;
				boothstart<=1'b0;
				result_l<=64'd1;
				result_h<=64'b0;
				boothclear<=1'b1;
				flag <= 1'b0; //Clear all registers
			end
		endcase
	end
	
	
endmodule
 