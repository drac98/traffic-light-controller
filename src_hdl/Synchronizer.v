`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 06:22:37 PM
// Design Name: 
// Module Name: Synchronizer
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


module Synchronizer(
    input Reset,
    input Sensor,
    input Walk_Request,
    input Reprogram,
	input clk,
	
    output reg Prog_Sync,
    output reg WR_Sync,
    output reg Sensor_Sync,
    output reg Reset_Sync
    );
	always@(posedge clk) begin
	
	if(Reset) Reset_Sync = 1;
	else Reset_Sync = 0;
	
	if(Sensor) Sensor_Sync = 1;
	else Sensor_Sync = 0;
	
	if(Walk_Request) WR_Sync = 1;
	else WR_Sync = 0;
	
	if(Reprogram) Prog_Sync = 1;
	else Prog_Sync = 0;
	
	end

endmodule