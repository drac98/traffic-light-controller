`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 06:18:38 PM
// Design Name: 
// Module Name: WalkRegister_test
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


module WalkRegister_test;
	// Inputs
	reg WR_Sync;
	reg WR_Reset;

	// Outputs
	wire WR;

	// Instantiate the Unit Under Test (UUT)
	WalkRegister uut (
		.WR_Sync(WR_Sync), 
		.WR_Reset(WR_Reset),
		.WR(WR)
	);

	initial begin
		// Initialize Inputs
		WR_Sync = 0;
		WR_Reset = 0;

		#100;
        WR_Sync = 1;
		#100;
		WR_Sync = 0;
		#400;
		WR_Reset = 1;
		#100;

	end
     
endmodule

