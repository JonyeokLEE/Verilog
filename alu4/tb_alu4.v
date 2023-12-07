`timescale 1ns/100ps
module tb_alu4;
	
	reg clk, reset; //set clk and reset
	
	reg [3:0]tb_a;
	reg [3:0]tb_b;
	reg [2:0]tb_op; //set reg
	
	wire [3:0]tb_result;
	wire tb_c, tb_z, tb_v, tb_n; //set wire
	
	reg [18:0] testvectors[10000:0]; //read one line
	reg [31:0] vectornum, errors; //for testvector
	
	reg [3:0]ex_result;
	reg ex_c, ex_z, ex_v, ex_n; //expected result
	
	alu4 test_alu4(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), .c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));
	//run module
	
	always begin
			clk = 1; #5; clk = 0; #5;
	end //set clk period
	
	initial begin
		$readmemb("C:/Users/jongh/DigitalLogic/2_2020202054_Assignment_04/alu4/test_alu4.tv", testvectors);
		vectornum=0; errors=0;
		reset =1; #27; reset=0;
	end //read file and set variable
	
	always @(posedge clk)
	begin
		#1; {tb_a, tb_b, tb_op, ex_result, ex_c, ex_n, ex_z, ex_v} = testvectors[vectornum];
	end //store the value
	
	always @(negedge clk)
	if(~reset) begin
		if ((tb_result !== ex_result)||(tb_c !== ex_c)||(tb_n !== ex_n)||(tb_z !== ex_z)||(tb_v !== ex_v)) //error
		begin
		$display("Error: Input[%b]", {tb_a, tb_b, tb_op});
		$display("Error: Output[%b]", {tb_result, tb_c, tb_n, tb_z, tb_v});
		$display("Expected Output[%b]", {ex_result, ex_c, ex_n, ex_z, ex_v}); //Print the error
		errors = errors + 1;
		end
		vectornum = vectornum + 1;
		if(testvectors[vectornum] === 19'bx) //finish line
		begin
			$display("%d tests is completed, Error: %d", vectornum, errors);
			$finish;
		end
	end	
	
endmodule
