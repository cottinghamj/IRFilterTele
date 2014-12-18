module kernel_Dup3(
    input_S1,
    avail_S1,
    read_S1,
    output_S2,
    write_S2,
    full_S2,
    output_S3,
    write_S3,
    full_S3,
    output_S4,
    write_S4,
    full_S4,
    running,
    rst,
    clk
);
    input wire [15:0] input_S1;
    input wire avail_S1;
    output wire read_S1;
    output wire [15:0] output_S2;
    output wire write_S2;
    input wire full_S2;
    output wire [15:0] output_S3;
    output wire write_S3;
    input wire full_S3;
    output wire [15:0] output_S4;
    output wire write_S4;
    input wire full_S4;
    output reg running;
    input wire rst;
    input wire clk;
    reg [15:0] state_S5;
    reg [31:0] state;
    reg [31:0] last_state;
    wire guard_2 = !full_S3 & !full_S4 & !full_S2;
    wire guard_1 = avail_S1;
    assign read_S1 = ((state == 1) & guard_1);
    assign write_S4 = ((state == 2) & guard_2);
    assign output_S4 = state_S5;
    assign write_S3 = ((state == 2) & guard_2);
    assign output_S3 = state_S5;
    assign write_S2 = ((state == 2) & guard_2);
    assign output_S2 = state_S5;


    always @(posedge clk) begin
        if (rst) begin
            state_S5 <= 0;
            // start 1
            state <= 1;
            last_state <= 0;
            running <= 1;
        end else begin
            running <= 1;
            last_state <= state;
            if (state == 1) begin
                if (guard_1) begin
                    // S5 <- input0
                    state_S5 <= input_S1;
                    // goto 2
                    state <= 2;
                end else begin
                    running <= avail_S1;
                end
            end
            if (state == 2) begin
                if (guard_2) begin
                    // output1 <- S5
                    // output2 <- S5
                    // output0 <- S5
                    // goto 3
                    state <= 1;
                end else begin
                end
            end
            // goto 1
        end
    end
endmodule
