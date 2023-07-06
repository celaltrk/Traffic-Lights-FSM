`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2022 02:26:59 AM
// Design Name: 
// Module Name: ClockDivider3
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


module ClockDivider3(input logic clock_in, reset, output logic clock_out);
    logic[31:0] count = 32'b0;
    localparam DIVISOR = 3;
    always@(posedge clock_in, posedge reset)
        begin
            if (reset | count == DIVISOR - 1)
                count <= 32'b0;
            else 
                count <= count + 1;
            if (reset)
                clock_out <= 1'b0;
            else if (count == DIVISOR - 1)
                clock_out <= ~clock_out; //tick the clock
        end
endmodule
