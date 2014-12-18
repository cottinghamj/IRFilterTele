module kernel_StdDev(
    input_S1,
    avail_S1,
    read_S1,
    input_S2,
    avail_S2,
    read_S2,
    output_S3,
    write_S3,
    full_S3,
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
    input wire signed [31:0] input_S1;
    input wire avail_S1;
    output wire read_S1;
    input wire [15:0] input_S2;
    input wire avail_S2;
    output wire read_S2;
    output wire signed [31:0] output_S3;
    output wire write_S3;
    input wire full_S3;
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
    reg [31:0] state_S4;
    reg signed [31:0] state_S7;
    reg [15:0] state_S8;
    reg [31:0] state_S9;
    reg [7:0] state_S10;
    reg [31:0] state_S11;
    reg signed [7:0] temp31;
    reg signed [31:0] temp32;
    reg signed [31:0] temp33;
    reg signed [31:0] temp34;
    reg [31:0] temp35;
    reg signed [7:0] temp36;
    reg signed [7:0] temp37;
    reg signed [31:0] temp40;
    reg signed [31:0] temp41;
    reg signed [31:0] temp42;
    reg signed [31:0] temp43;
    reg signed [31:0] temp44;
    reg signed [31:0] temp45;
    reg signed [31:0] temp46;
    reg signed [31:0] temp47;
    reg signed [31:0] temp48;
    reg signed [31:0] temp49;
    reg signed [31:0] temp50;
    reg [31:0] temp51;
    reg [31:0] temp52;
    reg signed [7:0] temp53;
    reg signed [31:0] temp54;
    reg signed [31:0] temp55;
    reg signed [31:0] temp56;
    reg [31:0] temp57;
    reg signed [31:0] temp58;
    reg signed [31:0] temp59;
    reg signed [31:0] temp60;
    reg signed [31:0] temp61;
    reg signed [31:0] temp62;
    reg signed [31:0] temp63;
    reg signed [31:0] temp64;
    reg signed [31:0] temp65;
    reg [31:0] temp66;
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
        if (state == 43) begin
            sp_itof32x0_start <= last_state != state;
            sp_itof32x0_0 <= temp57;
        end
        if (state == 21) begin
            sp_itof32x0_start <= last_state != state;
            sp_itof32x0_0 <= state_S8;
        end
    end

    reg sp_sqrtF32x0_start;
    reg [31:0] sp_sqrtF32x0_0;
    wire [31:0] sp_sqrtF32x0_result;
    wire sp_sqrtF32x0_ready;
    sp_sqrtF32 #(.WIDTH(32)) sp_sqrtF32x0(clk,
            sp_sqrtF32x0_start,
            sp_sqrtF32x0_0,
            sp_sqrtF32x0_result, sp_sqrtF32x0_ready);


    always @(*) begin
        sp_sqrtF32x0_start <= 0;
        sp_sqrtF32x0_0 <= 1'bx;
        if (state == 48) begin
            sp_sqrtF32x0_start <= last_state != state;
            sp_sqrtF32x0_0 <= temp62;
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
        if (state == 29) begin
            sp_addF32x0_start <= last_state != state;
            sp_addF32x0_0 <= temp42;
            sp_addF32x0_1 <= temp43;
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
        if (state == 44) begin
            sp_divF32x0_start <= last_state != state;
            sp_divF32x0_0 <= temp56;
            sp_divF32x0_1 <= temp58;
        end
    end

    reg sp_subF32x0_start;
    reg [31:0] sp_subF32x0_0;
    reg [31:0] sp_subF32x0_1;
    wire [31:0] sp_subF32x0_result;
    wire sp_subF32x0_ready;
    sp_subF32 #(.WIDTH(32)) sp_subF32x0(clk,
            sp_subF32x0_start,
            sp_subF32x0_0,
            sp_subF32x0_1,
            sp_subF32x0_result, sp_subF32x0_ready);


    always @(*) begin
        sp_subF32x0_start <= 0;
        sp_subF32x0_0 <= 1'bx;
        sp_subF32x0_1 <= 1'bx;
        if (state == 27) begin
            sp_subF32x0_start <= last_state != state;
            sp_subF32x0_0 <= state_S7;
            sp_subF32x0_1 <= temp49;
        end
        if (state == 25) begin
            sp_subF32x0_start <= last_state != state;
            sp_subF32x0_0 <= state_S7;
            sp_subF32x0_1 <= temp46;
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
        if (state == 28) begin
            sp_mulF32x0_start <= last_state != state;
            sp_mulF32x0_0 <= temp44;
            sp_mulF32x0_1 <= temp47;
        end
    end

    wire [31:0] sp_subIx0_result;
    sp_subI #(.WIDTH(32))
        sp_subIx0(outputCount, 1, sp_subIx0_result);

    wire [31:0] sp_addIx0_result;
    sp_addI #(.WIDTH(32))
        sp_addIx0(1, state_S11, sp_addIx0_result);

    wire [31:0] sp_addIx3_result;
    sp_addI #(.WIDTH(32))
        sp_addIx3(1, state_S11, sp_addIx3_result);

    wire [31:0] sp_addIx2_result;
    sp_addI #(.WIDTH(32))
        sp_addIx2(1, state_S4, sp_addIx2_result);

    wire [31:0] sp_addIx1_result;
    sp_addI #(.WIDTH(32))
        sp_addIx1(1, state_S11, sp_addIx1_result);

    wire guard_41 = ram_ready & (state == last_state) & !ram_re;
    wire guard_32 = 1;
    wire guard_53 = 1;
    wire guard_44 = (last_state == state) & sp_divF32x0_ready;
    wire guard_17 = 1;
    wire guard_35 = 1;
    wire guard_26 = ram_ready & (state == last_state) & !ram_re;
    wire guard_11 = 1;
    wire guard_47 = ram_ready & (state == last_state) & !ram_re;
    wire guard_29 = (last_state == state) & sp_addF32x0_ready;
    wire guard_20 = avail_S2;
    wire guard_2 = 1;
    wire guard_5 = 1;
    wire guard_55 = 1;
    wire guard_49 = ram_ready & !ram_we & (state == last_state);
    wire guard_13 = 1;
    wire guard_22 = ram_ready & (state == last_state) & !ram_re;
    wire guard_16 = 1;
    wire guard_7 = ram_ready & !ram_we & (state == last_state);
    wire guard_52 = !full_S3;
    wire guard_43 = (last_state == state) & sp_itof32x0_ready;
    wire guard_25 = (last_state == state) & sp_subF32x0_ready;
    wire guard_37 = 1;
    wire guard_19 = 1;
    wire guard_28 = (last_state == state) & sp_mulF32x0_ready;
    wire guard_45 = ram_ready & !ram_we & (state == last_state);
    wire guard_9 = ram_ready & !ram_we & (state == last_state);
    wire guard_27 = (last_state == state) & sp_subF32x0_ready;
    wire guard_48 = (last_state == state) & sp_sqrtF32x0_ready;
    wire guard_21 = (last_state == state) & sp_itof32x0_ready;
    wire guard_3 = 1;
    wire guard_30 = ram_ready & !ram_we & (state == last_state);
    wire guard_39 = 1;
    wire guard_51 = ram_ready & (state == last_state) & !ram_re;
    wire guard_6 = avail_S1;
    wire guard_24 = ram_ready & (state == last_state) & !ram_re;
    assign read_S1 = ((state == 6) & guard_6);
    assign read_S2 = ((state == 20) & guard_20);
    assign write_S3 = ((state == 52) & guard_52);
    assign output_S3 = temp65;
    reg dummy;
    always @(*) begin
        dummy <= clk;
        temp45 <= temp41;
        temp37 <= state_S11 < state_S9;
        temp51 <= sp_addIx1_result;
        temp57 <= sp_subIx0_result;
        temp64 <= temp55;
        temp31 <= state_S11 < state_S9;
        temp59 <= temp55;
        temp52 <= sp_addIx2_result;
        temp35 <= sp_addIx0_result;
        temp61 <= temp55;
        temp36 <= state_S4 <= outputCount;
        temp53 <= state_S11 < state_S9;
        temp55 <= state_S11 <<< 2;
        temp34 <= temp33;
    end


    always @(posedge clk) begin
        ram_re <= 0;
        ram_we <= 0;
        if (rst) begin
            temp40 <= 0;
            temp48 <= 0;
            temp56 <= 0;
            temp49 <= 0;
            temp44 <= 0;
            temp62 <= 0;
            temp42 <= 0;
            temp65 <= 0;
            temp32 <= 0;
            temp46 <= 0;
            temp33 <= 0;
            temp41 <= 0;
            temp50 <= 0;
            temp58 <= 0;
            temp47 <= 0;
            temp60 <= 0;
            temp66 <= 0;
            temp43 <= 0;
            temp54 <= 0;
            temp63 <= 0;
            // S10 <- 0
            state_S10 <= 0;
            // S9 <- 1600
            state_S9 <= 1600;
            // S4 <- 0
            state_S4 <= 0;
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
                    // switch S10 case 0: 3 case 1: 15 default: 57
                    state <= 2;
                    if (state_S10 == 0) begin
                        state <= 3;
                    end
                    if (state_S10 == 1) begin
                        state <= 16;
                    end
                end else begin
                end
            end
            if (state == 3) begin
                if (guard_3) begin
                    // S11 <- 0
                    state_S11 <= 0;
                    // S4 <- 1
                    state_S4 <= 1;
                    // goto 4
                    state <= 5;
                end else begin
                end
            end
            // temp31 <- S11 < S9
            // goto 5
            if (state == 5) begin
                if (guard_5) begin
                    // if temp31 then 6 else 13
                    state <= temp31 ? 6 : 13;
                end else begin
                end
            end
            if (state == 6) begin
                if (guard_6) begin
                    // temp33 <- S11 << 2
                    temp33 <= state_S11 <<< 2;
                    // temp32 <- input0
                    temp32 <= input_S1;
                    // goto 7
                    state <= 7;
                end else begin
                    running <= avail_S1;
                end
            end
            if (state == 7) begin
                if (guard_7) begin
                    // S5[temp33] <- temp32
                    // goto 8
                    state <= 9;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 0 + (temp33 >> 2);
                    ram_we <= 1;
                    ram_out <= temp32;
                    ram_mask <= {4{1'b1}};
                end
            end
            // temp34 <- temp33
            // goto 9
            if (state == 9) begin
                if (guard_9) begin
                    // S6[temp34] <- 0.0
                    // goto 10
                    state <= 11;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 1600 + (temp34 >> 2);
                    ram_we <= 1;
                    ram_out <= 0;
                    ram_mask <= {4{1'b1}};
                end
            end
            // temp35 <- 1 + S11
            // goto 11
            if (state == 11) begin
                if (guard_11) begin
                    // S11 <- temp35
                    state_S11 <= temp35;
                    // goto 12
                    state <= 5;
                end else begin
                end
            end
            // goto 4
            if (state == 13) begin
                if (guard_13) begin
                    // S10 <- 1
                    state_S10 <= 1;
                    // goto 14
                    state <= 2;
                end else begin
                end
            end
            // goto 58
            // temp36 <- S4 <= outputCount
            // goto 16
            if (state == 16) begin
                if (guard_16) begin
                    // if temp36 then 17 else 37
                    state <= temp36 ? 17 : 37;
                end else begin
                end
            end
            if (state == 17) begin
                if (guard_17) begin
                    // S11 <- 0
                    state_S11 <= 0;
                    // goto 18
                    state <= 19;
                end else begin
                end
            end
            // temp37 <- S11 < S9
            // goto 19
            if (state == 19) begin
                if (guard_19) begin
                    // if temp37 then 20 else 34
                    state <= temp37 ? 20 : 35;
                end else begin
                end
            end
            if (state == 20) begin
                if (guard_20) begin
                    // temp41 <- S11 << 2
                    temp41 <= state_S11 <<< 2;
                    // S8 <- input1
                    state_S8 <= input_S2;
                    // goto 21
                    state <= 21;
                end else begin
                    running <= avail_S2;
                end
            end
            if (state == 21) begin
                if (guard_21) begin
                    // S7 <- convert S8
                    state_S7 <= sp_itof32x0_result;
                    // goto 22
                    state <= 22;
                end else begin
                end
            end
            if (state == 22) begin
                if (guard_22) begin
                    // temp42 <- S6[temp41]
                    // goto 23
                    state <= 24;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1600 + (temp41 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    temp42 <= ram_in;
                end
            end
            // temp45 <- temp41
            // goto 24
            if (state == 24) begin
                if (guard_24) begin
                    // temp46 <- S5[temp45]
                    // goto 25
                    state <= 25;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 0 + (temp45 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    temp46 <= ram_in;
                end
            end
            if (state == 25) begin
                if (guard_25) begin
                    // temp48 <- temp41
                    temp48 <= temp41;
                    // temp44 <- S7 - temp46
                    temp44 <= sp_subF32x0_result;
                    // goto 26
                    state <= 26;
                end else begin
                end
            end
            if (state == 26) begin
                if (guard_26) begin
                    // temp49 <- S5[temp48]
                    // goto 27
                    state <= 27;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 0 + (temp48 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    temp49 <= ram_in;
                end
            end
            if (state == 27) begin
                if (guard_27) begin
                    // temp50 <- temp41
                    temp50 <= temp41;
                    // temp47 <- S7 - temp49
                    temp47 <= sp_subF32x0_result;
                    // goto 28
                    state <= 28;
                end else begin
                end
            end
            if (state == 28) begin
                if (guard_28) begin
                    // temp43 <- temp44 * temp47
                    temp43 <= sp_mulF32x0_result;
                    // goto 29
                    state <= 29;
                end else begin
                end
            end
            if (state == 29) begin
                if (guard_29) begin
                    // temp40 <- temp42 + temp43
                    temp40 <= sp_addF32x0_result;
                    // goto 30
                    state <= 30;
                end else begin
                end
            end
            if (state == 30) begin
                if (guard_30) begin
                    // S6[temp50] <- temp40
                    // goto 31
                    state <= 32;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 1600 + (temp50 >> 2);
                    ram_we <= 1;
                    ram_out <= temp40;
                    ram_mask <= {4{1'b1}};
                end
            end
            // temp51 <- 1 + S11
            // goto 32
            if (state == 32) begin
                if (guard_32) begin
                    // S11 <- temp51
                    state_S11 <= temp51;
                    // goto 33
                    state <= 19;
                end else begin
                end
            end
            // goto 18
            // temp52 <- 1 + S4
            // goto 35
            if (state == 35) begin
                if (guard_35) begin
                    // S4 <- temp52
                    state_S4 <= temp52;
                    // goto 36
                    state <= 2;
                end else begin
                end
            end
            // goto 56
            if (state == 37) begin
                if (guard_37) begin
                    // S11 <- 0
                    state_S11 <= 0;
                    // goto 38
                    state <= 39;
                end else begin
                end
            end
            // temp53 <- S11 < S9
            // goto 39
            if (state == 39) begin
                if (guard_39) begin
                    // if temp53 then 40 else 55
                    state <= temp53 ? 41 : 55;
                end else begin
                end
            end
            // temp55 <- S11 << 2
            // goto 41
            if (state == 41) begin
                if (guard_41) begin
                    // temp56 <- S6[temp55]
                    // goto 42
                    state <= 43;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1600 + (temp55 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    temp56 <= ram_in;
                end
            end
            // temp59 <- temp55
            // temp57 <- outputCount - 1
            // goto 43
            if (state == 43) begin
                if (guard_43) begin
                    // temp58 <- convert temp57
                    temp58 <= sp_itof32x0_result;
                    // goto 44
                    state <= 44;
                end else begin
                end
            end
            if (state == 44) begin
                if (guard_44) begin
                    // temp54 <- temp56 / temp58
                    temp54 <= sp_divF32x0_result;
                    // goto 45
                    state <= 45;
                end else begin
                end
            end
            if (state == 45) begin
                if (guard_45) begin
                    // S6[temp59] <- temp54
                    // goto 46
                    state <= 47;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 1600 + (temp59 >> 2);
                    ram_we <= 1;
                    ram_out <= temp54;
                    ram_mask <= {4{1'b1}};
                end
            end
            // temp61 <- temp55
            // goto 47
            if (state == 47) begin
                if (guard_47) begin
                    // temp62 <- S6[temp61]
                    // goto 48
                    state <= 48;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1600 + (temp61 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    temp62 <= ram_in;
                end
            end
            if (state == 48) begin
                if (guard_48) begin
                    // temp63 <- temp55
                    temp63 <= temp55;
                    // temp60 <- sqrt temp62
                    temp60 <= sp_sqrtF32x0_result;
                    // goto 49
                    state <= 49;
                end else begin
                end
            end
            if (state == 49) begin
                if (guard_49) begin
                    // S6[temp63] <- temp60
                    // goto 50
                    state <= 51;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 1600 + (temp63 >> 2);
                    ram_we <= 1;
                    ram_out <= temp60;
                    ram_mask <= {4{1'b1}};
                end
            end
            // temp64 <- temp55
            // goto 51
            if (state == 51) begin
                if (guard_51) begin
                    // temp65 <- S6[temp64]
                    // goto 52
                    state <= 52;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1600 + (temp64 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    temp65 <= ram_in;
                end
            end
            if (state == 52) begin
                if (guard_52) begin
                    // temp66 <- 1 + S11
                    temp66 <= sp_addIx3_result;
                    // output0 <- temp65
                    // goto 53
                    state <= 53;
                end else begin
                end
            end
            if (state == 53) begin
                if (guard_53) begin
                    // S11 <- temp66
                    state_S11 <= temp66;
                    // goto 54
                    state <= 39;
                end else begin
                end
            end
            // goto 38
            if (state == 55) begin
                if (guard_55) begin
                    // S10 <- 0
                    state_S10 <= 0;
                    // goto 56
                    state <= 2;
                end else begin
                end
            end
            // goto 58
            // goto 58
            // goto 59
            // goto 1
        end
    end
endmodule
