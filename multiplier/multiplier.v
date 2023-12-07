module multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result);
   input clk, reset_n, op_start, op_clear;
   input [63:0] multiplier;
   input [63:0] multiplicand;
   output reg op_done;
   output reg [127:0] result; //declare input, output and reg
   
   reg [2:0] state;
   reg [2:0] next_state; //declare state
   
   parameter INIT = 3'b000;
	parameter READY = 3'b001;
   parameter PROCESS1 = 3'b010;
   parameter PROCESS2 = 3'b011;
   parameter DONE = 3'b100; //set parameter of state
   
   reg [63:0] booth_multiplicand;
   reg [63:0] booth_multiplier; //save input and use this with operation
   
   reg [127:0]before_result;
   wire[127:0]after_result; //partial_products
   
   reg [31:0] count; //to know the operation is done
   reg [64:0] now; //to read 3-bits
   
   
   always @(posedge clk or negedge reset_n)
   begin
      if(~reset_n) state<=INIT;
      else state<=next_state;
   end //update state with information of clk and reset_n
   
   //next_state_logic
   always @(op_clear, op_start, state, count)
   begin
      case({state, op_clear, op_start})
			{INIT, 1'b1, 1'b0}: next_state <= INIT;
			{INIT, 1'b0, 1'b0}: next_state <= INIT;
			{INIT, 1'b0, 1'b1}: next_state <= READY;
			
			{READY, 1'b1, 1'b0}: next_state <= INIT;
			{READY, 1'b0, 1'b0},
			{READY, 1'b0, 1'b1}: next_state <= PROCESS1;

			{PROCESS1, 1'b1, 1'b0}: next_state <= INIT;
			{PROCESS1, 1'b0, 1'b0},
			{PROCESS1, 1'b0, 1'b1}: begin
				if(count[0]==1'b1) next_state<=DONE;
				else next_state<=PROCESS2;
			end
			
			{PROCESS2, 1'b1, 1'b0}: next_state <= INIT;
			{PROCESS2, 1'b0, 1'b0},
			{PROCESS2, 1'b0, 1'b1}: begin
				if(count[0]==1'b1) next_state<=DONE;
				else next_state<=PROCESS1;
			end

			{DONE, 1'b1, 1'b0}: next_state <= INIT;
			{DONE, 1'b0, 1'b0},
			{DONE, 1'b0, 1'b1}: next_state <= DONE;
			
			default: next_state <= 3'bx;
		endcase
   end
   
   
   //output of state logic
   always @(state, count)
   begin
      case(state)
			INIT: begin
            result<=128'b0;
            op_done<=1'b0;
         end //clear the output
			READY: begin
            result<=128'b0;
            op_done<=1'b0;
         end //clear the output
         PROCESS1: begin
            result<=after_result;
				op_done<=1'b0;
         end //when operation is done -> op_done = 1 / and update to result the partial product
         PROCESS2: begin
            result<=after_result;
				op_done<=1'b0;
         end //when operation is done -> op_done = 1 / and update to result the partial product
         DONE: begin
            result<=after_result;
            op_done<=1'b1;
         end //when operation is done -> op_done = 1 / and update to result the final partial product
         default: begin
            result<=128'b0;
            op_done<=1'b0;
         end //else -> clear the output
      endcase
   end
   
   always @(state)
   begin
   case(state)
         INIT: begin 
            count<=32'b0; //set count
            now <= 65'b0; //set now
            before_result <=128'b0; //set first partial product
         end
			READY: begin 
				booth_multiplicand <= multiplicand;
				booth_multiplier <= multiplier;
            count<=32'b10000000000000000000000000000000; //set count
            now <= {multiplier, 1'b0}; //set now
            before_result <=128'b0; //set first partial product
         end
         PROCESS1: begin
            count<=(count>>1);
            now<=(now>>>2);
            before_result<=after_result;
         end
         PROCESS2: begin
            count<=(count>>1); //update count
            now<=(now>>>2); //update now
            before_result<=after_result; //update partial product
         end
         DONE: begin
            count<=32'b0;
            now<=65'b0; //reset count and now
         end
         default: begin
            count<=32'bx;
            now<=65'bx;
            before_result<=128'bx; //reset values
         end
      endcase
   end
   
   translate read_3bits(.before_result(before_result), .now(now[2:0]), .multiplicand(booth_multiplicand), .multiplier(booth_multiplier), .after_result(after_result));
   //run module which reads 3 bit and do operation
      
endmodule
