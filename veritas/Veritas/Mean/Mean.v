module kernel_Mean(
    input_S1,
    avail_S1,
    read_S1,
    output_S2,
    write_S2,
    full_S2,
    ram_addr,
    ram_in,
    ram_out,
    ram_mask,
    ram_we,
    ram_re,
    ram_ready,
    running,
    rst,
    clk
);
    input wire [15:0] input_S1;
    input wire avail_S1;
    output wire read_S1;
    output wire signed [31:0] output_S2;
    output wire write_S2;
    input wire full_S2;
    output reg [29:0] ram_addr;
    input wire [31:0] ram_in;
    output reg [31:0] ram_out;
    output reg [3:0] ram_mask;
    output reg ram_re;
    output reg ram_we;
    input wire ram_ready;
    output reg running;
    input wire rst;
    input wire clk;
    parameter outputCount = 1;
    reg [31:0] state_S3;
    reg [31:0] state_S4;
    reg [31:0] state_S6;
    reg signed [31:0] state_S7;
    reg [15:0] state_S8;
    reg [31:0] state_S9;
    reg signed [7:0] temp284;
    reg signed [31:0] temp285;
    reg [31:0] temp286;
    reg signed [7:0] temp287;
    reg signed [7:0] temp288;
    reg signed [31:0] temp290;
    reg signed [31:0] temp291;
    reg signed [31:0] temp292;
    reg signed [31:0] temp295;
    reg signed [31:0] temp296;
    reg signed [31:0] temp297;
    reg signed [31:0] temp298;
    reg [31:0] temp299;
    reg [31:0] temp300;
    reg signed [7:0] temp301;
    reg signed [31:0] temp302;
    reg signed [31:0] temp303;
    reg [31:0] temp304;
    reg signed [31:0] temp305;
    reg [31:0] ram_state;
    reg [31:0] state;
    reg [31:0] last_state;
    reg sp_itof32x0_start;
    reg [31:0] sp_itof32x0_0;
    wire [31:0] sp_itof32x0_result;
    wire sp_itof32x0_ready;
    sp_itof32 #(.WIDTH(32)) sp_itof32x0(clk,
            sp_itof32x0_start,
            sp_itof32x0_0,
            sp_itof32x0_result, sp_itof32x0_ready);


    always @(*) begin
        sp_itof32x0_start <= 0;
        sp_itof32x0_0 <= 1'bx;
        if (state == 21) begin
            sp_itof32x0_start <= last_state != state;
            sp_itof32x0_0 <= state_S8;
        end
        if (state == 20) begin
            sp_itof32x0_start <= last_state != state;
            sp_itof32x0_0 <= state_S3;
        end
    end

    reg sp_addF32x0_start;
    reg [31:0] sp_addF32x0_0;
    reg [31:0] sp_addF32x0_1;
    wire [31:0] sp_addF32x0_result;
    wire sp_addF32x0_ready;
    sp_addF32 #(.WIDTH(32)) sp_addF32x0(clk,
            sp_addF32x0_start,
            sp_addF32x0_0,
            sp_addF32x0_1,
            sp_addF32x0_result, sp_addF32x0_ready);


    always @(*) begin
        sp_addF32x0_start <= 0;
        sp_addF32x0_0 <= 1'bx;
        sp_addF32x0_1 <= 1'bx;
        if (state == 22) begin
            sp_addF32x0_start <= last_state != state;
            sp_addF32x0_0 <= temp305;
            sp_addF32x0_1 <= temp295;
        end
    end

    reg sp_divF32x0_start;
    reg [31:0] sp_divF32x0_0;
    reg [31:0] sp_divF32x0_1;
    wire [31:0] sp_divF32x0_result;
    wire sp_divF32x0_ready;
    sp_divF32 #(.WIDTH(32)) sp_divF32x0(clk,
            sp_divF32x0_start,
            sp_divF32x0_0,
            sp_divF32x0_1,
            sp_divF32x0_result, sp_divF32x0_ready);


    always @(*) begin
        sp_divF32x0_start <= 0;
        sp_divF32x0_0 <= 1'bx;
        sp_divF32x0_1 <= 1'bx;
        if (state == 23) begin
            sp_divF32x0_start <= last_state != state;
            sp_divF32x0_0 <= state_S7;
            sp_divF32x0_1 <= temp297;
        end
    end

    reg sp_mulF32x0_start;
    reg [31:0] sp_mulF32x0_0;
    reg [31:0] sp_mulF32x0_1;
    wire [31:0] sp_mulF32x0_result;
    wire sp_mulF32x0_ready;
    sp_mulF32 #(.WIDTH(32)) sp_mulF32x0(clk,
            sp_mulF32x0_start,
            sp_mulF32x0_0,
            sp_mulF32x0_1,
            sp_mulF32x0_result, sp_mulF32x0_ready);


    always @(*) begin
        sp_mulF32x0_start <= 0;
        sp_mulF32x0_0 <= 1'bx;
        sp_mulF32x0_1 <= 1'bx;
        if (state == 21) begin
            sp_mulF32x0_start <= last_state != state;
            sp_mulF32x0_0 <= temp291;
            sp_mulF32x0_1 <= temp292;
        end
    end

    wire [31:0] sp_addIx0_result;
    sp_addI #(.WIDTH(32))
        sp_addIx0(1, state_S9, sp_addIx0_result);

    wire [31:0] sp_addIx3_result;
    sp_addI #(.WIDTH(32))
        sp_addIx3(1, state_S9, sp_addIx3_result);

    wire [31:0] sp_addIx2_result;
    sp_addI #(.WIDTH(32))
        sp_addIx2(1, state_S3, sp_addIx2_result);

    wire [31:0] sp_addIx1_result;
    sp_addI #(.WIDTH(32))
        sp_addIx1(1, state_S9, sp_addIx1_result);

    wire guard_23 = (last_state == state) & sp_divF32x0_ready;
    wire guard_35 = ram_ready & (state == last_state) & !ram_re;
    wire guard_26 = 1;
    wire guard_17 = 1;
    wire guard_29 = 1;
    wire guard_11 = 1;
    wire guard_2 = 1;
    wire guard_20 = (last_state == state) & sp_itof32x0_ready & avail_S1;
    wire guard_5 = 1;
    wire guard_14 = 1;
    wire guard_31 = 1;
    wire guard_22 = (last_state == state) & sp_addF32x0_ready;
    wire guard_7 = ram_ready & !ram_we & (state == last_state);
    wire guard_37 = 1;
    wire guard_19 = ram_ready & (state == last_state) & !ram_re;
    wire guard_36 = !full_S2;
    wire guard_9 = 1;
    wire guard_3 = 1;
    wire guard_21 = (last_state == state) & sp_itof32x0_ready & sp_mulF32x0_ready;
    wire guard_39 = 1;
    wire guard_33 = 1;
    wire guard_24 = ram_ready & !ram_we & (state == last_state);
    wire guard_15 = 1;
    assign read_S1 = ((state == 20) & guard_20);
    assign write_S2 = ((state == 36) & guard_36);
    assign output_S2 = temp303;
    reg dummy;
    always @(*) begin
        dummy <= clk;
        temp285 <= state_S9 <<< 2;
        temp287 <= state_S3 <= outputCount;
        temp302 <= state_S9 <<< 2;
        temp286 <= sp_addIx0_result;
        temp301 <= state_S6 > state_S9;
        temp284 <= state_S6 > state_S9;
        temp300 <= sp_addIx2_result;
        temp299 <= sp_addIx1_result;
        temp288 <= state_S6 > state_S9;
        temp290 <= state_S9 <<< 2;
    end


    always @(posedge clk) begin
        ram_re <= 0;
        ram_we <= 0;
        if (rst) begin
            temp292 <= 0;
            temp297 <= 0;
            temp305 <= 0;
            temp296 <= 0;
            temp304 <= 0;
            temp295 <= 0;
            temp303 <= 0;
            temp298 <= 0;
            temp291 <= 0;
            // S6 <- 1600
            state_S6 <= 1600;
            // S4 <- 0
            state_S4 <= 0;
            // S3 <- 0
            state_S3 <= 0;
            // start 1
            state <= 2;
            last_state <= 0;
            running <= 1;
        end else begin
            running <= 1;
            last_state <= state;
            // goto 2
            if (state == 2) begin
                if (guard_2) begin
                    // switch S4 case 0: 3 case 1: 13 default: 41
                    state <= 2;
                    if (state_S4 == 0) begin
                        state <= 3;
                    end
                    if (state_S4 == 1) begin
                        state <= 14;
                    end
                end else begin
                end
            end
            if (state == 3) begin
                if (guard_3) begin
                    // S9 <- 0
                    state_S9 <= 0;
                    // S3 <- 1
                    state_S3 <= 1;
                    // goto 4
                    state <= 5;
                end else begin
                end
            end
            // temp284 <- S6 > S9
            // goto 5
            if (state == 5) begin
                if (guard_5) begin
                    // if temp284 then 6 else 11
                    state <= temp284 ? 7 : 11;
                end else begin
                end
            end
            // temp285 <- S9 << 2
            // goto 7
            if (state == 7) begin
                if (guard_7) begin
                    // S5[temp285] <- 0.0
                    // goto 8
                    state <= 9;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 0 + (temp285 >> 2);
                    ram_we <= 1;
                    ram_out <= 0;
                    ram_mask <= {4{1'b1}};
                end
            end
            // temp286 <- 1 + S9
            // goto 9
            if (state == 9) begin
                if (guard_9) begin
                    // S9 <- temp286
                    state_S9 <= temp286;
                    // goto 10
                    state <= 5;
                end else begin
                end
            end
            // goto 4
            if (state == 11) begin
                if (guard_11) begin
                    // S4 <- 1
                    state_S4 <= 1;
                    // goto 12
                    state <= 2;
                end else begin
                end
            end
            // goto 42
            // temp287 <- S3 <= outputCount
            // goto 14
            if (state == 14) begin
                if (guard_14) begin
                    // if temp287 then 15 else 31
                    state <= temp287 ? 15 : 31;
                end else begin
                end
            end
            if (state == 15) begin
                if (guard_15) begin
                    // S9 <- 0
                    state_S9 <= 0;
                    // goto 16
                    state <= 17;
                end else begin
                end
            end
            // temp288 <- S6 > S9
            // goto 17
            if (state == 17) begin
                if (guard_17) begin
                    // if temp288 then 18 else 28
                    state <= temp288 ? 19 : 29;
                end else begin
                end
            end
            // temp290 <- S9 << 2
            // goto 19
            if (state == 19) begin
                if (guard_19) begin
                    // temp291 <- S5[temp290]
                    // goto 20
                    state <= 20;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 0 + (temp290 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    temp291 <= ram_in;
                end
            end
            if (state == 20) begin
                if (guard_20) begin
                    // S8 <- input0
                    state_S8 <= input_S1;
                    // temp298 <- temp290
                    temp298 <= temp290;
                    // temp292 <- convert S3
                    temp292 <= sp_itof32x0_result;
                    // goto 21
                    state <= 21;
                end else begin
                    running <= avail_S1;
                end
            end
            if (state == 21) begin
                if (guard_21) begin
                    // temp297 <- temp292
                    temp297 <= temp292;
                    // temp295 <- convert S8
                    temp295 <= sp_itof32x0_result;
                    // temp305 <- temp291 * temp292
                    temp305 <= sp_mulF32x0_result;
                    // goto 22
                    state <= 22;
                end else begin
                end
            end
            if (state == 22) begin
                if (guard_22) begin
                    // S7 <- temp305 + temp295
                    state_S7 <= sp_addF32x0_result;
                    // goto 23
                    state <= 23;
                end else begin
                end
            end
            if (state == 23) begin
                if (guard_23) begin
                    // temp296 <- S7 / temp297
                    temp296 <= sp_divF32x0_result;
                    // goto 24
                    state <= 24;
                end else begin
                end
            end
            if (state == 24) begin
                if (guard_24) begin
                    // S5[temp298] <- temp296
                    // goto 25
                    state <= 26;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 0 + (temp298 >> 2);
                    ram_we <= 1;
                    ram_out <= temp296;
                    ram_mask <= {4{1'b1}};
                end
            end
            // temp299 <- 1 + S9
            // goto 26
            if (state == 26) begin
                if (guard_26) begin
                    // S9 <- temp299
                    state_S9 <= temp299;
                    // goto 27
                    state <= 17;
                end else begin
                end
            end
            // goto 16
            // temp300 <- 1 + S3
            // goto 29
            if (state == 29) begin
                if (guard_29) begin
                    // S3 <- temp300
                    state_S3 <= temp300;
                    // goto 30
                    state <= 2;
                end else begin
                end
            end
            // goto 40
            if (state == 31) begin
                if (guard_31) begin
                    // S9 <- 0
                    state_S9 <= 0;
                    // goto 32
                    state <= 33;
                end else begin
                end
            end
            // temp301 <- S6 > S9
            // goto 33
            if (state == 33) begin
                if (guard_33) begin
                    // if temp301 then 34 else 39
                    state <= temp301 ? 35 : 39;
                end else begin
                end
            end
            // temp302 <- S9 << 2
            // goto 35
            if (state == 35) begin
                if (guard_35) begin
                    // temp303 <- S5[temp302]
                    // goto 36
                    state <= 36;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 0 + (temp302 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    temp303 <= ram_in;
                end
            end
            if (state == 36) begin
                if (guard_36) begin
                    // temp304 <- 1 + S9
                    temp304 <= sp_addIx3_result;
                    // output0 <- temp303
                    // goto 37
                    state <= 37;
                end else begin
                end
            end
            if (state == 37) begin
                if (guard_37) begin
                    // S9 <- temp304
                    state_S9 <= temp304;
                    // goto 38
                    state <= 33;
                end else begin
                end
            end
            // goto 32
            if (state == 39) begin
                if (guard_39) begin
                    // S4 <- 0
                    state_S4 <= 0;
                    // goto 40
                    state <= 2;
                end else begin
                end
            end
            // goto 42
            // goto 42
            // goto 43
            // goto 1
        end
    end
endmodule
