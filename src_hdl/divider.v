`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 01:59:44 AM
// Design Name: 
// Module Name: divider
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


module Divider(
    input clk,
	input rst,
    output reg clk_div
    );
	 
	 localparam [26:0] clk_1s_constant = 27'd100_000_000;
	 reg [26:0]counter = clk_1s_constant;
	 always@(posedge clk)
		begin
			if (rst) counter = clk_1s_constant;
			else begin
				counter = counter - 1;
				clk_div = (counter == 0);
				if (!counter) counter = clk_1s_constant;
			end
		end

endmodule
