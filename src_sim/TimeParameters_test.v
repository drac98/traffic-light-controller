`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 06:04:32 PM
// Design Name: 
// Module Name: TimeParameters_test
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


module TimeParameters_test;

	// Inputs
	reg [1:0] time_parameter_selector;
	reg [3:0] time_value;
	reg prog_sync;
	reg [1:0] time_selector;
	reg clk;
	reg Reset_Sync;

	// Outputs
	wire [3:0] value;

	// Instantiate the Unit Under Test (UUT)
	TimeParameters uut (
		.time_parameter_selector(time_parameter_selector), 
		.time_value(time_value), 
		.prog_sync(prog_sync), 
		.time_selector(time_selector), 
		.clk(clk), 
		.value(value),
		.Reset_Sync(Reset_Sync)
	);

	initial begin
		// Initialize Inputs
		time_parameter_selector = 2'b00;
		time_value = 4'b0001;
		prog_sync = 0;
		Reset_Sync = 0;
		
		time_selector = 2'b00; // Value will output tBASE
		// Wait 100 ns for global reset to finish
		#100;

        time_selector = 2'b01; // Value will output tEXT
		#100;
		
        time_selector =2'b10; // Value will output tYEL
		#100;
		
		// Program tBASE value
        time_parameter_selector = 2'b00;
        time_value = 4'b0110;   // Set tBASE to 8s
        time_selector = 2'b00; // Value will output tBASE

		#5
		prog_sync = 1; // Program
		#100
		prog_sync = 0;
		#5
		time_parameter_selector = 2'b01;
		time_value = 4'b1111;

	end
	
	initial begin
	clk = 0;
	forever begin
	 #5 clk = ~clk;
	end 
	end
      
endmodule