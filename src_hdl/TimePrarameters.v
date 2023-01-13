`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 05:59:48 PM
// Design Name: 
// Module Name: TimePrarameters
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


module TimeParameters(
    input [1:0] time_parameter_selector,
    input [3:0] time_value,
    input prog_sync,
    input [1:0] time_selector,
    input Reset_Sync,
    input clk,
    
    output reg [3:0] value
    );
	 
	 reg[3:0] t_base = 4'b0110, // time_selector value = 00
              t_ext = 4'b0011, // time_selector value = 01
              t_yel = 4'b0010; // time_selector value = 10
	     
						 
	always@(posedge clk) begin
	
	case (time_selector)
		
		2'b00: value = t_base;
		2'b01: value = t_ext;
		2'b10: value = t_yel;
		2'b11: value = 2*t_base;
	
	endcase
	// On a global reset, the three time parameters will be respectively set to 6, 3, and 2 seconds.
	
	if (prog_sync) begin
		case (time_parameter_selector) 
			2'b00: t_base = time_value;
			2'b01: t_ext = time_value;
			2'b10: t_yel = time_value;
			2'b11: begin // This case handles the undefined input in the project description
                    t_base = 4'b0110;
                    t_ext = 4'b0011;
                    t_yel = 4'b0010;
                   end
		endcase
	end
	
	if (Reset_Sync) begin
        t_base = 4'b0110;
        t_ext = 4'b0011;
        t_yel = 4'b0010;
	end
		
	end

endmodule