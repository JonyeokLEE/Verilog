module clb4(a,b,ci,c1,c2,c3,co);

   input [3:0]a,b;
   input ci; //set input
	
   output c1,c2,c3,co; //set output
	
   wire [3:0] g,p;
   wire w0_c1;
   wire w0_c2, w1_c2;
   wire w0_c3, w1_c3, w2_c3;
   wire w0_co, w1_co, w2_co, w3_co; //set wire
   
   //Propogate
   _or2 pro_or0(a[0],b[0],p[0]);
   _or2 pro_or1(a[1],b[1],p[1]);
   _or2 pro_or2(a[2],b[2],p[2]);
   _or2 pro_or3(a[3],b[3],p[3]);
	
	//Generate
   _and2 gen_and0(a[0],b[0],g[0]);
   _and2 gen_and1(a[1],b[1],g[1]);
   _and2 gen_and2(a[2],b[2],g[2]);
   _and2 gen_and3(a[3],b[3],g[3]);
   
   //c1
   _and2 c1_and0(p[0],ci,w0_c1);
   _or2 c1_or0(g[0],w0_c1, c1);
	//c1 = g[0] | (p[0] & ci)
   
   //c2
   _and2 c2_and0(p[1],g[0],w0_c2);
   _and3 c2_and1(p[1],p[0],ci, w1_c2);
   _or3 c2_or0(g[1], w0_c2, w1_c2, c2);
	//c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & ci)
   
   //c3
   _and2 c3_and0(p[2],g[1],w0_c3);
   _and3 c3_and1(p[2],p[1],g[0], w1_c3);
   _and4 c3_and2(p[2],p[1],p[0],ci,w2_c3);
   _or4 c3_or0(g[2],w0_c3, w1_c3, w2_c3, c3);
	//c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & ci)
   
	//co
   _and2 co_and0(p[3],g[2],w0_co);
   _and3 co_and1(p[3],p[2],g[1], w1_co);
   _and4 co_and2(p[3],p[2],p[1],g[0],w2_co);
   _and5 co_and3(p[3],p[2],p[1],p[0],ci,w3_co);
   _or5 co_or0(g[3],w0_co,w1_co,w2_co,w3_co,co);
	//co = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & ci)
   
   
endmodule