`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 10:35:38 PM
// Design Name: 
// Module Name: Labkit
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


module Labkit(
    input Reset,
    input Sensor,
    input Walk_Request,
    input Reprogram,
    input [1:0] Time_Parameter_Selector,
    input [3:0] Time_Value,
    input clk,
    output [6:0] LEDs
    );
	 
	 wire [1:0] time_selector;
	 wire [1:0] Selector;
	 wire [3:0] value;
	 wire Reset_Sync,clk_div,Sensor_Sync,WR,WR_Reset,start_timer,expired,Prog_Sync,
			WR_Sync;
	 
	Divider divider (
		.rst(Reset_Sync),
		.clk(clk), 
		.clk_div(clk_div)
	);
	
    Timer timer (
        .value(value), 
        .clk_div(clk_div), 
        .start_timer(start_timer),
        .clk(clk),
        .expired(expired),
        .reset_sync(Reset_Sync)
    );

    TimeParameters timeParameter (
            .time_parameter_selector(Time_Parameter_Selector), 
            .time_value(Time_Value), 
            .prog_sync(Prog_Sync), 
            .time_selector(time_selector), 
            .clk(clk), 
            .value(value),
            .Reset_Sync(Reset_Sync)
        );

	Synchronizer synchronizer (
		.Reset(Reset), 
		.Sensor(Sensor), 
		.Walk_Request(Walk_Request), 
		.Reprogram(Reprogram), 
		.clk(clk), 
		.Prog_Sync(Prog_Sync), 
		.WR_Sync(WR_Sync), 
		.Sensor_Sync(Sensor_Sync), 
		.Reset_Sync(Reset_Sync)
	);
	
	WalkRegister walkRegister (
		.WR_Sync(WR_Sync), 
		.WR_Reset(WR_Reset),  
		.WR(WR)
	);

	FSM fsm (
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
	
endmodule
