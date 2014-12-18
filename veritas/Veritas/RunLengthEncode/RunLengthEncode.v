module kernel_RunLengthEncode(
    input_S1,
    avail_S1,
    read_S1,
    output_S2,
    write_S2,
    full_S2,
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
    output reg running;
    input wire rst;
    input wire clk;
    parameter pixelCount = 1600;
    reg [15:0] state_S3;
    reg [15:0] state_S4;
    reg signed [7:0] state_S5;
    reg [31:0] state_S6;
    reg [15:0] temp242;
    reg signed [7:0] temp244;
    reg signed [7:0] temp245;
    reg [15:0] temp246;
    reg [15:0] temp247;
    reg signed [7:0] temp248;
    reg [31:0] temp249;
    reg [15:0] temp250;
    reg [31:0] temp251;
    reg [15:0] temp252;
    reg [15:0] temp253;
    reg signed [7:0] temp254;
    reg signed [7:0] temp255;
    reg [31:0] state;
    reg [31:0] last_state;
    reg sp_mulIx0_start;
    reg [31:0] sp_mulIx0_0;
    reg [31:0] sp_mulIx0_1;
    wire [31:0] sp_mulIx0_result;
    wire sp_mulIx0_ready;
    sp_mulI #(.WIDTH(32)) sp_mulIx0(clk,
            sp_mulIx0_start,
            sp_mulIx0_0,
            sp_mulIx0_1,
            sp_mulIx0_result, sp_mulIx0_ready);


    always @(*) begin
        sp_mulIx0_start <= 0;
        sp_mulIx0_0 <= 1'bx;
        sp_mulIx0_1 <= 1'bx;
        if (state == 19) begin
            sp_mulIx0_start <= last_state != state;
            sp_mulIx0_0 <= state_S6;
            sp_mulIx0_1 <= state_S6;
        end
        if (state == 15) begin
            sp_mulIx0_start <= last_state != state;
            sp_mulIx0_0 <= state_S6;
            sp_mulIx0_1 <= state_S6;
        end
    end

    wire [15:0] sp_addIx0_result;
    sp_addI #(.WIDTH(16))
        sp_addIx0(1, state_S3, sp_addIx0_result);

    wire [15:0] sp_addIx2_result;
    sp_addI #(.WIDTH(16))
        sp_addIx2(1, state_S4, sp_addIx2_result);

    wire [15:0] sp_addIx1_result;
    sp_addI #(.WIDTH(16))
        sp_addIx1(1, state_S4, sp_addIx1_result);

    wire guard_23 = 1;
    wire guard_26 = 1;
    wire guard_8 = 1;
    wire guard_17 = !full_S2;
    wire guard_11 = 1;
    wire guard_2 = 1;
    wire guard_20 = 1;
    wire guard_14 = 1;
    wire guard_4 = 1;
    wire guard_22 = 1;
    wire guard_7 = !full_S2;
    wire guard_25 = !full_S2;
    wire guard_1 = avail_S1;
    wire guard_19 = (last_state == state) & sp_mulIx0_ready & !full_S2;
    wire guard_21 = !full_S2;
    wire guard_24 = 1;
    wire guard_6 = 1;
    wire guard_15 = (last_state == state) & sp_mulIx0_ready;
    assign read_S1 = ((state == 1) & guard_1);
    assign write_S2 = ((state == 19) & guard_19) | ((state == 25) & guard_25) | ((state == 21) & guard_21) | ((state == 17) & guard_17) | ((state == 7) & guard_7);
    assign output_S2 =  state == 17 ? temp250 : ( state == 25 ? state_S4 : ( state == 19 ? state_S4 : ( state == 21 ? temp252 : (0))));
    reg dummy;
    always @(*) begin
        dummy <= clk;
        temp248 <= 0 == state_S5;
        temp245 <= 0 == state_S5;
        temp247 <= sp_addIx2_result;
        temp250 <= temp249[15:0];
        temp244 <= 0 == state_S6;
        temp254 <= state_S3 == pixelCount;
    end


    always @(posedge clk) begin
        if (rst) begin
            temp246 <= 0;
            temp255 <= 0;
            temp249 <= 0;
            temp251 <= 0;
            temp252 <= 0;
            temp253 <= 0;
            temp242 <= 0;
            // S5 <- 0
            state_S5 <= 0;
            // S4 <- 0
            state_S4 <= 0;
            // S3 <- 0
            state_S3 <= 0;
            // start 1
            state <= 1;
            last_state <= 0;
            running <= 1;
        end else begin
            running <= 1;
            last_state <= state;
            if (state == 1) begin
                if (guard_1) begin
                    // temp253 <- 1 + S3
                    temp253 <= sp_addIx0_result;
                    // temp242 <- input0
                    temp242 <= input_S1;
                    // goto 2
                    state <= 2;
                end else begin
                    running <= avail_S1;
                end
            end
            if (state == 2) begin
                if (guard_2) begin
                    // S3 <- temp253
                    state_S3 <= temp253;
                    // S6 <- convert temp242
                    state_S6 <= {{16{1'b0}},temp242};
                    // goto 3
                    state <= 4;
                end else begin
                end
            end
            // temp254 <- S3 == pixelCount
            // temp244 <- 0 == S6
            // goto 4
            if (state == 4) begin
                if (guard_4) begin
                    // if temp244 then 5 else 13
                    state <= temp244 ? 6 : 14;
                end else begin
                end
            end
            // temp245 <- 0 == S5
            // goto 6
            if (state == 6) begin
                if (guard_6) begin
                    // if temp245 then 7 else 10
                    state <= temp245 ? 7 : 11;
                end else begin
                end
            end
            if (state == 7) begin
                if (guard_7) begin
                    // temp246 <- 1 + S4
                    temp246 <= sp_addIx1_result;
                    // output0 <- 0
                    // S5 <- 1
                    state_S5 <= 1;
                    // goto 8
                    state <= 8;
                end else begin
                end
            end
            if (state == 8) begin
                if (guard_8) begin
                    // S4 <- temp246
                    state_S4 <= temp246;
                    // goto 9
                    state <= 22;
                end else begin
                end
            end
            // goto 12
            // temp247 <- 1 + S4
            // goto 11
            if (state == 11) begin
                if (guard_11) begin
                    // S4 <- temp247
                    state_S4 <= temp247;
                    // goto 12
                    state <= 22;
                end else begin
                end
            end
            // goto 22
            // temp248 <- 0 == S5
            // goto 14
            if (state == 14) begin
                if (guard_14) begin
                    // if temp248 then 15 else 19
                    state <= temp248 ? 15 : 19;
                end else begin
                end
            end
            if (state == 15) begin
                if (guard_15) begin
                    // temp249 <- S6 * S6
                    temp249 <= sp_mulIx0_result;
                    // goto 16
                    state <= 17;
                end else begin
                end
            end
            // temp250 <- convert temp249
            // goto 17
            if (state == 17) begin
                if (guard_17) begin
                    // output0 <- temp250
                    // goto 18
                    state <= 22;
                end else begin
                end
            end
            // goto 22
            if (state == 19) begin
                if (guard_19) begin
                    // S5 <- 0
                    state_S5 <= 0;
                    // temp251 <- S6 * S6
                    temp251 <= sp_mulIx0_result;
                    // output0 <- S4
                    // goto 20
                    state <= 20;
                end else begin
                end
            end
            if (state == 20) begin
                if (guard_20) begin
                    // temp252 <- convert temp251
                    temp252 <= temp251[15:0];
                    // S4 <- 0
                    state_S4 <= 0;
                    // goto 21
                    state <= 21;
                end else begin
                end
            end
            if (state == 21) begin
                if (guard_21) begin
                    // output0 <- temp252
                    // goto 22
                    state <= 22;
                end else begin
                end
            end
            if (state == 22) begin
                if (guard_22) begin
                    // if temp254 then 23 else 30
                    state <= temp254 ? 23 : 1;
                end else begin
                end
            end
            if (state == 23) begin
                if (guard_23) begin
                    // temp255 <- 1 == S5
                    temp255 <= 1 == state_S5;
                    // S3 <- 0
                    state_S3 <= 0;
                    // goto 24
                    state <= 24;
                end else begin
                end
            end
            if (state == 24) begin
                if (guard_24) begin
                    // S5 <- 0
                    state_S5 <= 0;
                    // if temp255 then 25 else 28
                    state <= temp255 ? 25 : 1;
                end else begin
                end
            end
            if (state == 25) begin
                if (guard_25) begin
                    // output0 <- S4
                    // goto 26
                    state <= 26;
                end else begin
                end
            end
            if (state == 26) begin
                if (guard_26) begin
                    // S4 <- 0
                    state_S4 <= 0;
                    // goto 27
                    state <= 1;
                end else begin
                end
            end
            // goto 29
            // goto 29
            // goto 31
            // goto 31
            // goto 1
        end
    end
endmodule
