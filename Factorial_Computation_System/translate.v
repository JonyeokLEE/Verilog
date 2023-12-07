module translate(before_result, now, multiplicand, multiplier, after_result);
	input signed[127:0] before_result;
   input [2:0] now;
   input [63:0] multiplicand;
   input signed[63:0] multiplier;
   output reg [127:0] after_result;


wire signed[127:0] MSB_multiplicand = {multiplicand, 64'b0}; //for multiplicand starts at MSB
wire signed[127:0]shift1ADD,shift1SUB,ADD,SUB; //each result of cla
wire signed[127:0]complement={~multiplicand, 64'hffffffffffffffff}; //for -MSB_multiplicand

//cla128 forcomple1(.a(~MSB_multiplicand),.b(128'b1),.ci(1'b0),.s(complement)); // -MSB_multiplicand
cla128 cla0(.a(before_result >>> 1),.b(MSB_multiplicand),.ci(1'b0),.s(shift1ADD)); //shift 1, ADD
cla128 cla1(.a(before_result >>> 1),.b(complement),.ci(1'b1),.s(shift1SUB)); //shift 1, SUB
cla128 cla2(.a(before_result),.b(MSB_multiplicand),.ci(1'b0), .s(ADD)); //ADD
cla128 cla3(.a(before_result),.b(complement),.ci(1'b1), .s(SUB)); //SUB

always @(before_result, multiplicand, multiplier, now, shift1ADD,shift1SUB,ADD,SUB, complement) begin
    case (now) //read 3-bit of multiplier and do operation about each cases
        3'b000: begin
            after_result <= before_result >>> 2;
				end
        3'b001: begin
            after_result <= ADD >>> 2;
				end
		  3'b010: begin
            after_result <= ADD >>> 2;
				end	
        3'b011: begin
            after_result <= shift1ADD >>>1;
				end
        3'b100: begin
            after_result <= shift1SUB >>>1;
				end
        3'b101: begin
            after_result <= SUB >>> 2;
				end
		  3'b110: begin
            after_result <= SUB >>> 2;
				end
		  3'b111: begin
            after_result <= before_result >>> 2;
				end	
        default: begin
            after_result <= before_result;
				end
    endcase
end
endmodule
