`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 06:17:03 PM
// Design Name: 
// Module Name: WalkRegister
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


module WalkRegister(
    input WR_Sync,
    input WR_Reset,
    output reg WR
    );
	 
	 always@(posedge WR_Sync ,posedge WR_Reset) begin
		if (WR_Sync) begin
		      WR = 1;
		end
		else begin
		      if (WR_Reset) begin
		             WR = 0;
		      end
		end
	 end
	
endmodule
