`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 02:24:19 AM
// Design Name: 
// Module Name: divider_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Divider_test;

	// Inputs
	reg clk;
	reg rst;
	
	// Outputs
	wire clk_div;

	// Instantiate the Unit Under Test (UUT)
	Divider uut (
		.rst(rst),
		.clk(clk), 
		.clk_div(clk_div)
	);


	initial begin 
	clk=0;
	rst=0;
	#10;
	rst=1;
	#10;
	rst=0;
	end
	
	initial begin
	forever begin
	 #5 clk = ~clk;
	end 
	end
      
endmodule

