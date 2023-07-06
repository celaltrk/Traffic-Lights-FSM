`timescale 1ns / 1ps

module OneToTwoDecoder(input logic a, output logic y[1:0]);
    assign y[1] = a;
    assign y[0] = ~a;
endmodule
