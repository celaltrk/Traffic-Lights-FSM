`timescale 1ns / 1ps

module TwoToFourDecoder(input logic a[1:0], output logic y[3:0]);
    logic p[1:0];
    OneToTwoDecoder dec1(a[0], y[1:0]);
    OneToTwoDecoder dec2(a[1], p[1:0]);
    OneToTwoDecoder dec3(a[0], y[3:2]);    
endmodule
