`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 10:37:32 PM
// Design Name: 
// Module Name: Labkit_test
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


module Labkit_test;

	// Inputs
	reg Reset;
	reg Sensor;
	reg Walk_Request;
	reg Reprogram;
	reg [1:0] Time_Parameter_Selector;
	reg [3:0] Time_Value;
	reg clk;

	// Outputs
	wire [6:0] LEDs;
	
	// Instantiate the Unit Under Test (UUT)
	Labkit uut (
		.Reset(Reset), 
		.Sensor(Sensor), 
		.Walk_Request(Walk_Request), 
		.Reprogram(Reprogram), 
		.Time_Parameter_Selector(Time_Parameter_Selector), 
		.Time_Value(Time_Value), 
		.clk(clk), 
		.LEDs(LEDs)

	);

	initial begin
		// Initialize Inputs
		Reset = 0;
		Sensor = 0;
		Walk_Request = 0;
		Reprogram = 0;
		Time_Parameter_Selector = 0;
		Time_Value = 0;
		clk = 0;
		#20
		
		#5
		Reset = 1;
		#5
		Reset = 0;
		#100

		Walk_Request = 1;
		#20
		Walk_Request = 0;
		#200

		Sensor = 1;
		#200
		Sensor = 0;

	end
	
	initial begin
	forever begin
	 #5 clk = ~clk;
	end 
	end

endmodule
