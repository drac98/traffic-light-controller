`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 02:27:14 PM
// Design Name: 
// Module Name: Timer_test
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


module Timer_test;

	// Inputs
	reg [3:0] value;
	reg clk_div;
	reg start_timer;
	reg clk;
	reg reset_sync;

	// Outputs
	wire expired;

	// Instantiate the Unit Under Test (UUT)
	Timer uut (
		.value(value), 
		.clk_div(clk_div), 
		.start_timer(start_timer),
		.clk(clk),
		.expired(expired),
		.reset_sync(reset_sync)
	);

	initial begin
		// Initialize Inputs
		value = 0;
		clk_div = 0;
		start_timer = 0;
		reset_sync = 0;

		#5;
        value=4'b0011;
		start_timer=1;
		reset_sync = 1;
		#5;
		start_timer=0;
		reset_sync = 0;
		#315;
		value=4'b0010;
		start_timer=1;
        reset_sync = 1;
        #5;
        start_timer=0;
        reset_sync = 0;
        #50;

		

	end
	
    initial begin 
        clk_div=0;
        forever begin
            #50 clk_div = ~clk_div;
        end 
    end
    
    initial begin 
        clk=0;
        forever begin
            #5 clk = ~clk;
        end 
    end
endmodule