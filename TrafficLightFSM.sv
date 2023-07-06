`timescale 1ns / 1ps

module TrafficLightFSM(input logic clk, reset, sa, sb, output logic led[5:0]);
    typedef enum logic[2:0]{S0, S1, S2, S3, S4, S5, S6, S7} statetype;
    statetype state, nextstate;
    logic a[1:0], b[1:0];
    //state register
    //logic dividedclk;
    //ClockDivider c(clk, dividedclk);
    always_ff@(posedge clk, posedge reset)
        if (reset) state <= S0;
        else state <= nextstate;
    //next state logic
    always_comb
        case(state)
            S0: if(sb) nextstate = S1;
                else nextstate = S0;
            S1: nextstate = S2;
            S2: nextstate = S3;
            S3: nextstate = S4;
            S4: if(~sa&sb) nextstate = S4;
                else nextstate = S5;
            S5: nextstate = S6;
            S6: nextstate = S7;
            S7: nextstate = S0;
        endcase
    // state encoding
    logic s2, s1, s0;
    assign s2 = (state == S4 | state == S5 | state == S6 | state == S7);
    assign s1 = (state == S2 | state == S3 | state == S6 | state == S7);
    assign s0 = (state == S1 | state == S3 | state == S5 | state == S7);
    // output logic
    logic x, nx;
    assign x = s2 ^ s1;
    assign nx = ~x;
    assign a[1] = x | s2 & ~s0;
    assign a[0] = nx & s0;
    assign b[1] = nx | ~s2&s1&~s0;
    assign b[0] = x & s0;
    // light decoding
    logic ay[3:0], by[3:0];
    TwoToFourDecoder dec1(a,ay);
    TwoToFourDecoder dec2(b,by);
    assign led[5] = ay[2];
    assign led[4] = ay[0] | ay[2];
    assign led[2] = by[2];
    assign led[1] = by[0] | by[2];
//    assign led[5] = a[1];
//    assign led[4] = ~a[0];
//    assign led[2] = b[1];
//    assign led[1] = ~b[0];
    assign led[3] = 1;
    assign led[0] = 1;
endmodule
