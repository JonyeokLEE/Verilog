`timescale 1ns/100ps
module tb_cla32;
  reg [31:0] a, b; // 32-bit input registers a and b
  reg ci; // Cin
  wire [31:0] s; // Sum
  wire co; // Cout
  cla32 U0_cla32(a, b, ci, s, co); // Instantiate a 32-bit Carry Look-Ahead Adder

  initial
  begin
    // Test cases
     a = 32'h0; b = 32'h0; ci = 1'b0;
    #10 a = 32'hFFFF_FFFF; b = 32'h0; ci = 1'b1;
    #10 a = 32'h0000_FFFF; b = 32'hFFFF_0000; ci = 1'b0;
    #10 a = 32'h0000_FFFF; b = 32'hFFFF_0000; ci = 1'b1;
    #10 a = 32'h1234_5678; b = 32'h3531_5986; ci = 1'b0;
    #10 a = 32'h1429_5487; b = 32'h3573_9826; ci = 1'b0;
    #10 $stop;
  end
endmodule