module tb_read_operation;
	reg [31:0] tb_reg0, tb_reg1, tb_reg2, tb_reg3, tb_reg4, tb_reg5, tb_reg6, tb_reg7;
	reg [2:0] tb_Addr;
	wire [31:0] tb_Data; //set reg and wire
	
	
	read_operation test_read_operation(.Addr(tb_Addr), .Data(tb_Data), .from_reg0(tb_reg0), .from_reg1(tb_reg1), .from_reg2(tb_reg2),
	.from_reg3(tb_reg3), .from_reg4(tb_reg4), .from_reg5(tb_reg5), .from_reg6(tb_reg6), .from_reg7(tb_reg7));
	
	initial
	begin
		#0;tb_reg0=32'h0001; tb_reg1=32'h0010; tb_reg2=32'h0011; tb_reg3=32'h0100; tb_reg4=32'h0101; tb_reg5=32'h0110; tb_reg6=32'h0111;
		tb_reg7=32'h1000; tb_Addr=8'o0;
		#10; tb_Addr=8'o1;
		#10; tb_Addr=8'o2;
		#10; tb_Addr=8'o3;
		#10; tb_Addr=8'o4;
		#10; tb_Addr=8'o5;
		#10; tb_Addr=8'o6;
		#10; tb_Addr=8'o7;
		#10; $finish;
	end //end test
	
	
endmodule
