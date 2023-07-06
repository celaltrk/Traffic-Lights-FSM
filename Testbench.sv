`timescale 1ns / 1ps
module Testbench();
    logic sa,sb,clk,reset,led[5:0];
    TrafficLightFSM dut(clk, reset, sa, sb, led);
    always begin
        clk = 0; #5;
        clk = 1; #5;
    end
    initial begin
        reset = 1; #5;
        reset = 0; #5; //pressed the reset button
        sa = 0; sb = 0; #50; // waits at state 0
        sa = 0; sb = 1; #100; // switches to state 4 and waits there
        sa = 1; sb = 0; #100; // switches to state 0 and waits there
        sb = 1; #50; // circulates between the states
    end
endmodule
