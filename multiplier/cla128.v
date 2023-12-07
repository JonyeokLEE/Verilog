module cla128(a, b, ci, s, co);
	input [127:0] a, b;    // 128-bit input a and b
   input ci;            // Carry input
   output [127:0] s;     // 128-bit output s
   output co;           // Carry output
	
	wire [2:0]carry;
	
	cla32 cla32_0(.a(a[31:0]),.b(b[31:0]),.ci(ci),.s(s[31:0]),.co(carry[0]));
	cla32 cla32_1(.a(a[63:32]),.b(b[63:32]),.ci(carry[0]),.s(s[63:32]),.co(carry[1]));
	cla32 cla32_2(.a(a[95:64]),.b(b[95:64]),.ci(carry[1]),.s(s[95:64]),.co(carry[2]));
	cla32 cla32_3(.a(a[127:96]),.b(b[127:96]),.ci(carry[2]),.s(s[127:96]),.co(co)); //connect 4 cla 32
	
endmodule
