`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 07:24:07 PM
// Design Name: 
// Module Name: FSM_test
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


module FSM_test;

	// Inputs
	
	reg Sensor_Sync;
	reg WR;
	reg expired;
	reg Prog_Sync;
	reg clk;
	reg Reset_Sync;

	// Outputs
	wire WR_Reset;
	wire [6:0] LEDs;
	wire [1:0] time_selector;
	wire start_timer;
	
	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.Sensor_Sync(Sensor_Sync), 
		.WR(WR), 
		.WR_Reset(WR_Reset), 
		.LEDs(LEDs), 
		.time_selector(time_selector), 
		.start_timer(start_timer), 
		.expired(expired), 
		.Prog_Sync(Prog_Sync), 
		.clk(clk),
		.Reset_Sync(Reset_Sync)
	);

initial begin 
       clk=0;
       forever begin
        #5 clk = ~clk;
       end 
    end
    initial begin 
        expired=0;
        forever begin
            #5 expired = ~expired;
        end 
     end

    initial begin

//            // Normal Flow
//            Sensor_Sync = 0;
//            WR = 0;
//            expired = 0;
//            Prog_Sync = 0;
//            Reset_Sync = 0;
//            #5
//            Sensor_Sync = 0;
//            Reset_Sync = 1;
//            #5
//            Reset_Sync = 0;
//            #5;
    
//           // Walk Request
//           Sensor_Sync = 0;
//           WR = 0;
//           expired = 0;
//           Prog_Sync = 0;
//           Reset_Sync = 0;
//           #5
//           Sensor_Sync = 0;
//           Reset_Sync = 1;
//           WR = 1;
//           #5
//           Reset_Sync = 0;
//           #5;

            //Traffic Sensor
            Sensor_Sync = 0;
            WR = 0;
            expired = 0;
            Prog_Sync = 0;
            Reset_Sync = 0;
            #5
            Sensor_Sync = 1;
            Reset_Sync = 1;
            #5
            Reset_Sync = 0;
            #5;
    end
	
	initial begin 
	clk=0;
   forever begin
    #5 clk = ~clk;
	end 
	end
      
endmodule
