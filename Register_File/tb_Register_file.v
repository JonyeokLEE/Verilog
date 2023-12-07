`timescale 1ns/100ps

module tb_Register_file;

   reg tb_clk, tb_reset_n, tb_we;
   reg [2:0] tb_wAddr, tb_rAddr;
   reg [31:0] tb_wData;
   wire [31:0] tb_rData; //set reg and wire
   
   Register_file test_RegFile(.clk(tb_clk), .reset_n(tb_reset_n), .wAddr(tb_wAddr), .wData(tb_wData), .we(tb_we),
   .rAddr(tb_rAddr), .rData(tb_rData));
   //run module
   
   always #5
   begin
      tb_clk = ~tb_clk;
   end //set clk
   
   initial
   begin
      #0; tb_clk=0; tb_reset_n=0; tb_we=0; tb_wAddr = 3'b000; tb_rAddr=3'b000; tb_wData=32'h00000000;
      #7; tb_reset_n=1; tb_we=1;
      #5; tb_wAddr = 3'b001; tb_wData=32'h11111111;
      #5; tb_wAddr = 3'b010; tb_wData=32'h22222222;
      #5; tb_wAddr = 3'b011; tb_wData=32'h33333333;
      #5; tb_wAddr = 3'b100; tb_wData=32'h44444444;
      #5; tb_wAddr = 3'b101; tb_wData=32'h55555555;
      #5; tb_wAddr = 3'b110; tb_wData=32'h66666666;
      #5; tb_wAddr = 3'b111; tb_wData=32'h77777777; //write data
      #5; tb_rAddr = 3'b000;
      #5; tb_rAddr = 3'b001;
      #5; tb_rAddr = 3'b010;
      #5; tb_rAddr = 3'b011;
      #5; tb_rAddr = 3'b100;
      #5; tb_rAddr = 3'b101;
      #5; tb_rAddr = 3'b110;
      #5; tb_rAddr = 3'b111; //read data
      #5; tb_we=0; tb_wAddr = 3'b001; tb_wData=32'hffffffff; //cannot write data because of write-enable
      #5; tb_rAddr = 3'b000; //check about this
      #5; tb_reset_n=0; //reset
      #10; $finish;
   end //end test

endmodule