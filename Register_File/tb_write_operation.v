module tb_write_operation;
	reg tb_we;
	reg [2:0] tb_Addr;
	wire [7:0] tb_wEn; //set reg and wire
	
	write_operation test_write_operation(.we(tb_we), .Addr(tb_Addr), .wEn(tb_wEn)); //run module
	
	initial
	begin
		#0;tb_we=0; tb_Addr=3'o0;
		#10; tb_we=1;
		#10; tb_Addr=3'o1;
		#10; tb_Addr=3'o2;
		#10; tb_Addr=3'o3;
		#10; tb_Addr=3'o4;
		#10; tb_Addr=3'o5;
		#10; tb_Addr=3'o6;
		#10; tb_Addr=3'o7;
		#10; $finish;
	end //end test
	
	
endmodule
