module mux3_32bit ( d0, d1, d2, s, y);
	input [31:0] d0, d1, d2; // Input data
   input [1:0] s; // Selection input (2-bit for 3 inputs)
   output reg [31:0] y; // Output data

   always @(*) begin
		  case (s)
            2'b00: y = d0; // if s = 00, y = d0
            2'b01: y = d1; // if s = 01, y = d1
            2'b10: y = d2; // if s = 10, y = d2
            default: y = 32'b0; // Default case for any other input
        endcase
    end

endmodule
