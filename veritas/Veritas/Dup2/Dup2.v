module kernel_Dup2(
    input_S1,
    avail_S1,
    read_S1,
    output_S2,
    write_S2,
    full_S2,
    output_S3,
    write_S3,
    full_S3,
    running,
    rst,
    clk
);
    input wire signed [31:0] input_S1;
    input wire avail_S1;
    output wire read_S1;
    output wire signed [31:0] output_S2;
    output wire write_S2;
    input wire full_S2;
    output wire signed [31:0] output_S3;
    output wire write_S3;
    input wire full_S3;
    output reg running;
    input wire rst;
    input wire clk;
    reg signed [31:0] state_S4;
    reg [31:0] state;
    reg [31:0] last_state;
    wire guard_2 = !full_S3 & !full_S2;
    wire guard_1 = avail_S1;
    assign read_S1 = ((state == 1) & guard_1);
    assign write_S3 = ((state == 2) & guard_2);
    assign output_S3 = state_S4;
    assign write_S2 = ((state == 2) & guard_2);
    assign output_S2 = state_S4;


    always @(posedge clk) begin
        if (rst) begin
            state_S4 <= 0;
            // start 1
            state <= 1;
            last_state <= 0;
            running <= 1;
        end else begin
            running <= 1;
            last_state <= state;
            if (state == 1) begin
                if (guard_1) begin
                    // S4 <- input0
                    state_S4 <= input_S1;
                    // goto 2
                    state <= 2;
                end else begin
                    running <= avail_S1;
                end
            end
            if (state == 2) begin
                if (guard_2) begin
                    // output1 <- S4
                    // output0 <- S4
                    // goto 3
                    state <= 1;
                end else begin
                end
            end
            // goto 1
        end
    end
endmodule
