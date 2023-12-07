`timescale 1ns/100ps //set timescale

module tb_mx2; //testbench module for mx2

 reg d0, d1, s; //set reg d0, d1, s
 wire y; //set wire y
 
mx2 mx_top (d0, d1, s, y); //call mx2 module

initial 
begin //start
 #0 d0 = 0; d1 = 0; s = 0;
 #10 d1 = 1;
 #10 d0 = 1; d1 = 0;
 #10 d1 = 1;
 #10 d0 = 0; d1 = 0; s = 1;
 #10 d1 = 1;
 #10 d0 = 1; d1 = 0;
 #10 d1 = 1;
 #10 $finish;
end //end testbench

endmodule //end testbench
