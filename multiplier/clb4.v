module clb4(a, b, ci, c1, c2, c3, co);

	input [3:0] a;
	input [3:0] b;
	input ci;
	output c1,c2,c3,co;

	wire [3:0] g,p;
	wire c1_1;
	wire c2_1, c2_2;
	wire c3_1, c3_2, c3_3;
	wire co_1, co_2, co_3, co_4;
	
	// Propagate
	_or2 or2_Pro1(.a(a[0]),.b(b[0]),.y(p[0]));
	_or2 or2_Pro2(.a(a[1]),.b(b[1]),.y(p[1]));
	_or2 or2_Pro3(.a(a[2]),.b(b[2]),.y(p[2]));
	_or2 or2_Pro4(.a(a[3]),.b(b[3]),.y(p[3]));
	// Pi = Ai + Bi
	
	// Generate
	_and2 and2_Gen1(.a(a[0]),.b(b[0]),.y(g[0]));
	_and2 and2_Gen2(.a(a[1]),.b(b[1]),.y(g[1]));
	_and2 and2_Gen3(.a(a[2]),.b(b[2]),.y(g[2]));
	_and2 and2_Gen4(.a(a[3]),.b(b[3]),.y(g[3]));
	// Gi = AiBi
	
	// c1
	_and2 and2_C1(.a(p[0]),.b(ci),.y(c1_1));
	_or2 or2_C1(.a(g[0]),.b(c1_1),.y(c1));
	// c1 = g[0] | (p[0] & ci);
	
	// c2
	_and2 and2_C2(.a(p[1]),.b(g[0]),.y(c2_1));
	_and3 and3_C2(.a(p[1]),.b(p[0]),.c(ci),.y(c2_2));
	_or3 or3_C2(.a(g[1]),.b(c2_1),.c(c2_2),.y(c2));
	// c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & ci);

	// c3
	_and2 and2_C3(.a(p[2]),.b(g[1]),.y(c3_1));
	_and3 and3_C3(.a(p[2]),.b(p[1]),.c(g[0]),.y(c3_2));
	_and4 and4_C3(.a(p[2]),.b(p[1]),.c(p[0]),.d(ci),.y(c3_3));
	_or4 or4_C3(.a(g[2]),.b(c3_1),.c(c3_2),.d(c3_3),.y(c3));
	// c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & ci);

	// co
	_and2 and2_Co(.a(p[3]),.b(g[2]),.y(co_1));
	_and3 and3_Co(.a(p[3]),.b(p[2]),.c(g[1]),.y(co_2));
	_and4 and4_Co(.a(p[3]),.b(p[2]),.c(p[1]),.d(g[0]),.y(co_3));
	_and5 and5_Co(.a(p[3]),.b(p[2]),.c(p[1]),.d(p[0]),.e(ci),.y(co_4));
	_or5 or4_Co(.a(g[3]),.b(co_1),.c(co_2),.d(co_3),.e(co_4),.y(co));
	// co = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & ci)

endmodule 