module rca4 (
  input [3:0] a,
  input [3:0] b,
  input ci, //set input
  output co,
  output [3:0] s //set output
);
	
	wire [2:0] carry_wire; //for store carry
	
	fa faForRca_1 (.a(a[0]),.b(b[0]),.ci(ci),.co(carry_wire[0]),.s(s[0])); //first bit adder
	fa faForRca_2 (.a(a[1]),.b(b[1]),.ci(carry_wire[0]),.co(carry_wire[1]),.s(s[1])); //second bit adder
	fa faForRca_3 (.a(a[2]),.b(b[2]),.ci(carry_wire[1]),.co(carry_wire[2]),.s(s[2])); //third bit adder
	fa faForRca_4 (.a(a[3]),.b(b[3]),.ci(carry_wire[2]),.co(co),.s(s[3])); //fourth bit adder

endmodule
