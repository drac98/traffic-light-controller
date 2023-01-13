`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 02:29:07 PM
// Design Name: 
// Module Name: Timer
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


module Timer(
    input [3:0] value,
    input clk_div,
    input start_timer,
    input clk,
    input reset_sync,
    output reg expired
    );
	 
	 
	 reg [3:0] time_left;
	 reg clk_offset =1;
	 reg reduced = 0;
	always@(posedge clk) begin
		
		if (!clk_offset) begin
			clk_offset = 1;
			time_left = value-1;
		end
			
		if (reset_sync)begin
			clk_offset = 0;
		end			
		if (start_timer) begin
			clk_offset =0;
		end
		expired = 0;
		
		if (clk_div) begin
		    if(!reduced) begin
                if (!time_left) begin
                    expired = 1;
                end else begin
                    time_left = time_left - 1;
                    reduced = 1;
                end
            end
        end else begin
            reduced=0;
        end
				
																		
	end



endmodule

