//module _dff_en(input wire clk, input wire en, input wire d, output reg q);

  //always @(posedge clk) begin
    //if (en) 
      //q <= d;
  //end

//endmodule //another way to construct dff_en

module _dff_en(clk, en, d, q);

	input clk, en, d;
	output q; //set input and output
	
	wire w_d; //set wire
	
	mx2 mx_0(.d0(q), .d1(d), .s(en), .y(w_d)); //to select signal
	_dff dff_0(.clk(clk), .d(w_d), .q(q), .q_bar()); //run dff
	
endmodule

