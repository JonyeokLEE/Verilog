`timescale 1ns/100ps

module tb_alu32;
	
	reg clk, reset; //set clk and reset
	
	reg [31:0]tb_a;
	reg [31:0]tb_b;
	reg [2:0]tb_op; //set reg
	reg forbyte; //hexadecimal - 1byte each -> to read 3-bits opcode
	
	wire [31:0]tb_result;
	wire tb_c, tb_z, tb_v, tb_n; //set wire
	
	reg [103:0] testvectors[10000:0];
	reg [31:0] vectornum, errors; //for testvector
	
	reg [31:0]ex_result;
	reg ex_c, ex_z, ex_v, ex_n; //expected result
	
	alu32 test_alu32(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), .c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));
	//run the module
	
	always begin
			clk = 1; #5; clk = 0; #5;
	end //set clk period
	
	initial begin
		$readmemh("C:/Users/jongh/DigitalLogic/2_2020202054_Assignment_04/alu32/test_alu32.tv", testvectors);
		vectornum=0; errors=0;
		reset =1; #27; reset=0;
	end //open file and read as hexadecimal
	
	always @(posedge clk)
	begin
		#1; {tb_a, tb_b, forbyte, tb_op, ex_result, ex_c, ex_n, ex_z, ex_v} = testvectors[vectornum];
	end //read and store the file
	
	always @(negedge clk)
	if(~reset) begin
		if ((tb_result !== ex_result)||(tb_c !== ex_c)||(tb_n !== ex_n)||(tb_z !== ex_z)||(tb_v !== ex_v)) //error
		begin
		$display("Error: Input[%h]", {tb_a, tb_b, tb_op});
		$display("Error: Output[%h]", {tb_result, tb_c, tb_n, tb_z, tb_v});
		$display("Expected Output[%h]", {ex_result, ex_c, ex_n, ex_z, ex_v});
		errors = errors + 1;
		end
		vectornum = vectornum + 1;
		if(testvectors[vectornum] === 104'bx) //finish line
		begin
			$display("%d tests is completed, Error: %d", vectornum, errors);
			$finish;
		end
	end	
	
endmodule