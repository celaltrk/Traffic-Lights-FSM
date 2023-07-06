module ClockDivider(input logic clock_in, output logic clock_out);
    logic[31:0] counter = 32'd0;
    localparam N = 32'd300000000;
    always @(posedge clock_in) begin
        counter <= counter + 32'd1;
        if(counter>=(N-1))
        counter <= 32'd0;
        clock_out <= (counter < N/2) ? 1'b1 : 1'b0;
    end
endmodule