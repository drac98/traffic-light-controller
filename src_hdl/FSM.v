`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 07:22:36 PM
// Design Name: 
// Module Name: FSM
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


module FSM(
    input Reset_Sync,
    input WR,
    input expired,
    input Sensor_Sync,
    input Prog_Sync,
    input clk,
    
    output reg [6:0] LEDs,
    output reg WR_Reset,
    output reg [1:0] time_selector,
    output reg start_timer
    );
	 
	 localparam tBASE_id    = 2'b00,
                tEXT_id     = 2'b01,
                tYEL_id     = 2'b10,
                tBASEx2_id  = 2'b11;// 2 * tBASE
					
	 reg deviate_flow;
	 reg extended;
	 
	 // LEDs[0] : Walk Light
	 // LEDs[3:1] : Side Street Light Red, Yellow, Green
	 // LEDs[6:4] : Main Street Light Red, Yellow, Green
	 localparam MS_G = 7'b0011000, //Main Street Light Green
                MS_Y = 7'b0101000, //Main Street Light Yellow
                SS_G = 7'b1000010, //Side Street Light Green
                SS_Y = 7'b1000100, //Side Street Light Yellow
                W_G = 7'b1001001;  // Walk Light Green
	 
	 always@(posedge clk) 
		begin
		
		start_timer = 0;
		if (Prog_Sync | Reset_Sync) begin
			LEDs = MS_G;
			time_selector = tBASEx2_id;
			WR_Reset = 0;
			start_timer = 1;
			extended = 1;
			end
		if (expired) 
			begin
				case (LEDs)
					MS_G: begin
							if (deviate_flow) begin
								if (Sensor_Sync & extended)begin
									LEDs = MS_G;
									time_selector = tEXT_id;
									start_timer = 1;
									extended = 0;
 								end
								else begin
									LEDs = MS_G;
									time_selector = tBASE_id;
									start_timer = 1;
								end
								deviate_flow = 0;
							end else begin	
								LEDs = MS_Y;
								time_selector = tYEL_id;
								start_timer = 1;
							end
						  end
					
					MS_Y: begin
							if (WR) begin
								LEDs = W_G;
								time_selector = tEXT_id;
								start_timer = 1;
								WR_Reset = 1;
							end
							else begin
								LEDs = SS_G;
								time_selector = tBASE_id;
								start_timer = 1;
							end
							extended = 1;
						  end
					SS_G: begin
							if (Sensor_Sync & extended) begin
								LEDs = SS_G;
								time_selector = tEXT_id;
								start_timer = 1;
								extended = 0;
							end
							else begin
								LEDs = SS_Y;
								time_selector = tYEL_id;
								start_timer = 1;
								extended = 1;
							end
						  end
					SS_Y: begin
							LEDs = MS_G;
							time_selector = tBASE_id;
							start_timer = 1;
							deviate_flow = 1;
							extended = 1;
						  end
					W_G: begin
							LEDs = SS_G;
							time_selector = tYEL_id;
							start_timer = 1;
							WR_Reset = 0;
						 end
					default : 
							begin
							LEDs = MS_G;
							time_selector = tBASE_id;
							deviate_flow = 1;
							start_timer = 1;
							end
				endcase
		
		end
		end
	
	

endmodule

