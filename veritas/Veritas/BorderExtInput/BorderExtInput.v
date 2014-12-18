module kernel_BorderExtInput(
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
    parameter width = 40;
    parameter height = 40;
    reg [31:0] state_S4;
    reg [31:0] state_S5;
    reg [31:0] state_S6;
    reg [639:0] state_S7;
    reg [15:0] state_S8;
    reg signed [7:0] temp4;
    reg signed [7:0] temp5;
    reg signed [7:0] temp6;
    reg [31:0] temp7;
    reg signed [7:0] temp8;
    reg signed [7:0] temp9;
    reg signed [7:0] temp10;
    reg [31:0] temp11;
    reg signed [31:0] temp12;
    reg signed [7:0] temp13;
    reg [31:0] temp14;
    reg signed [7:0] temp15;
    reg signed [31:0] temp16;
    reg [15:0] temp17;
    reg signed [7:0] temp18;
    reg signed [7:0] temp19;
    reg signed [7:0] temp20;
    reg [31:0] temp21;
    reg signed [31:0] temp22;
    reg [15:0] temp23;
    reg [31:0] temp24;
    reg signed [7:0] temp25;
    reg [31:0] temp26;
    reg signed [7:0] temp27;
    reg [31:0] temp28;
    reg [31:0] temp29;
    reg [31:0] temp30;
    reg [31:0] state;
    reg [31:0] last_state;
    wire [31:0] sp_subIx3_result;
    sp_subI #(.WIDTH(32))
        sp_subIx3(width, 1, sp_subIx3_result);

    wire [31:0] sp_subIx0_result;
    sp_subI #(.WIDTH(32))
        sp_subIx0(height, 1, sp_subIx0_result);

    wire [31:0] sp_addIx0_result;
    sp_addI #(.WIDTH(32))
        sp_addIx0(1, state_S6, sp_addIx0_result);

    wire [31:0] sp_subIx2_result;
    sp_subI #(.WIDTH(32))
        sp_subIx2(width, 1, sp_subIx2_result);

    wire [31:0] sp_addIx2_result;
    sp_addI #(.WIDTH(32))
        sp_addIx2(1, state_S4, sp_addIx2_result);

    wire [31:0] sp_subIx4_result;
    sp_subI #(.WIDTH(32))
        sp_subIx4(height, 1, sp_subIx4_result);

    wire [31:0] sp_subIx1_result;
    sp_subI #(.WIDTH(32))
        sp_subIx1(width, 1, sp_subIx1_result);

    wire [31:0] sp_addIx1_result;
    sp_addI #(.WIDTH(32))
        sp_addIx1(1, state_S5, sp_addIx1_result);

    wire guard_41 = 1;
    wire guard_8 = 1;
    wire guard_29 = 1;
    wire guard_38 = 1;
    wire guard_2 = !full_S2;
    wire guard_5 = !full_S2;
    wire guard_4 = 1;
    wire guard_13 = 1;
    wire guard_22 = 1;
    wire guard_16 = 1;
    wire guard_25 = !full_S2;
    wire guard_1 = avail_S1;
    wire guard_19 = !full_S2;
    wire guard_45 = 1;
    wire guard_48 = 1;
    wire guard_39 = 1;
    wire guard_42 = 1;
    assign read_S1 = ((state == 1) & guard_1);
    assign write_S2 = ((state == 2) & guard_2) | ((state == 5) & guard_5) | ((state == 19) & guard_19) | ((state == 25) & guard_25);
    assign output_S2 =  state == 25 ? temp23 : ( state == 19 ? temp17 : ( state == 5 ? state_S8 : (state_S8)));
    reg dummy;
    always @(*) begin
        dummy <= clk;
        temp14 <= temp7;
        temp22 <= temp16;
        temp24 <= sp_addIx0_result;
        temp4 <= temp5 || temp6;
        case (temp22)
    0: temp23 <= state_S7[15:0];
    1: temp23 <= state_S7[23:8];
    2: temp23 <= state_S7[31:16];
    3: temp23 <= state_S7[39:24];
    4: temp23 <= state_S7[47:32];
    5: temp23 <= state_S7[55:40];
    6: temp23 <= state_S7[63:48];
    7: temp23 <= state_S7[71:56];
    8: temp23 <= state_S7[79:64];
    9: temp23 <= state_S7[87:72];
    10: temp23 <= state_S7[95:80];
    11: temp23 <= state_S7[103:88];
    12: temp23 <= state_S7[111:96];
    13: temp23 <= state_S7[119:104];
    14: temp23 <= state_S7[127:112];
    15: temp23 <= state_S7[135:120];
    16: temp23 <= state_S7[143:128];
    17: temp23 <= state_S7[151:136];
    18: temp23 <= state_S7[159:144];
    19: temp23 <= state_S7[167:152];
    20: temp23 <= state_S7[175:160];
    21: temp23 <= state_S7[183:168];
    22: temp23 <= state_S7[191:176];
    23: temp23 <= state_S7[199:184];
    24: temp23 <= state_S7[207:192];
    25: temp23 <= state_S7[215:200];
    26: temp23 <= state_S7[223:208];
    27: temp23 <= state_S7[231:216];
    28: temp23 <= state_S7[239:224];
    29: temp23 <= state_S7[247:232];
    30: temp23 <= state_S7[255:240];
    31: temp23 <= state_S7[263:248];
    32: temp23 <= state_S7[271:256];
    33: temp23 <= state_S7[279:264];
    34: temp23 <= state_S7[287:272];
    35: temp23 <= state_S7[295:280];
    36: temp23 <= state_S7[303:288];
    37: temp23 <= state_S7[311:296];
    38: temp23 <= state_S7[319:304];
    39: temp23 <= state_S7[327:312];
    40: temp23 <= state_S7[335:320];
    41: temp23 <= state_S7[343:328];
    42: temp23 <= state_S7[351:336];
    43: temp23 <= state_S7[359:344];
    44: temp23 <= state_S7[367:352];
    45: temp23 <= state_S7[375:360];
    46: temp23 <= state_S7[383:368];
    47: temp23 <= state_S7[391:376];
    48: temp23 <= state_S7[399:384];
    49: temp23 <= state_S7[407:392];
    50: temp23 <= state_S7[415:400];
    51: temp23 <= state_S7[423:408];
    52: temp23 <= state_S7[431:416];
    53: temp23 <= state_S7[439:424];
    54: temp23 <= state_S7[447:432];
    55: temp23 <= state_S7[455:440];
    56: temp23 <= state_S7[463:448];
    57: temp23 <= state_S7[471:456];
    58: temp23 <= state_S7[479:464];
    59: temp23 <= state_S7[487:472];
    60: temp23 <= state_S7[495:480];
    61: temp23 <= state_S7[503:488];
    62: temp23 <= state_S7[511:496];
    63: temp23 <= state_S7[519:504];
    64: temp23 <= state_S7[527:512];
    65: temp23 <= state_S7[535:520];
    66: temp23 <= state_S7[543:528];
    67: temp23 <= state_S7[551:536];
    68: temp23 <= state_S7[559:544];
    69: temp23 <= state_S7[567:552];
    70: temp23 <= state_S7[575:560];
    71: temp23 <= state_S7[583:568];
    72: temp23 <= state_S7[591:576];
    73: temp23 <= state_S7[599:584];
    74: temp23 <= state_S7[607:592];
    75: temp23 <= state_S7[615:600];
    76: temp23 <= state_S7[623:608];
    77: temp23 <= state_S7[631:616];
    78: temp23 <= state_S7[639:624];
    default: temp23 <= 0;
endcase

        temp26 <= sp_subIx3_result;
        temp18 <= temp19 || temp20;
        temp8 <= temp10 || temp9;
        temp29 <= sp_addIx1_result;
        case (temp12)
    0: state_S7[15:0] <= state_S8;
    1: state_S7[23:8] <= state_S8;
    2: state_S7[31:16] <= state_S8;
    3: state_S7[39:24] <= state_S8;
    4: state_S7[47:32] <= state_S8;
    5: state_S7[55:40] <= state_S8;
    6: state_S7[63:48] <= state_S8;
    7: state_S7[71:56] <= state_S8;
    8: state_S7[79:64] <= state_S8;
    9: state_S7[87:72] <= state_S8;
    10: state_S7[95:80] <= state_S8;
    11: state_S7[103:88] <= state_S8;
    12: state_S7[111:96] <= state_S8;
    13: state_S7[119:104] <= state_S8;
    14: state_S7[127:112] <= state_S8;
    15: state_S7[135:120] <= state_S8;
    16: state_S7[143:128] <= state_S8;
    17: state_S7[151:136] <= state_S8;
    18: state_S7[159:144] <= state_S8;
    19: state_S7[167:152] <= state_S8;
    20: state_S7[175:160] <= state_S8;
    21: state_S7[183:168] <= state_S8;
    22: state_S7[191:176] <= state_S8;
    23: state_S7[199:184] <= state_S8;
    24: state_S7[207:192] <= state_S8;
    25: state_S7[215:200] <= state_S8;
    26: state_S7[223:208] <= state_S8;
    27: state_S7[231:216] <= state_S8;
    28: state_S7[239:224] <= state_S8;
    29: state_S7[247:232] <= state_S8;
    30: state_S7[255:240] <= state_S8;
    31: state_S7[263:248] <= state_S8;
    32: state_S7[271:256] <= state_S8;
    33: state_S7[279:264] <= state_S8;
    34: state_S7[287:272] <= state_S8;
    35: state_S7[295:280] <= state_S8;
    36: state_S7[303:288] <= state_S8;
    37: state_S7[311:296] <= state_S8;
    38: state_S7[319:304] <= state_S8;
    39: state_S7[327:312] <= state_S8;
    40: state_S7[335:320] <= state_S8;
    41: state_S7[343:328] <= state_S8;
    42: state_S7[351:336] <= state_S8;
    43: state_S7[359:344] <= state_S8;
    44: state_S7[367:352] <= state_S8;
    45: state_S7[375:360] <= state_S8;
    46: state_S7[383:368] <= state_S8;
    47: state_S7[391:376] <= state_S8;
    48: state_S7[399:384] <= state_S8;
    49: state_S7[407:392] <= state_S8;
    50: state_S7[415:400] <= state_S8;
    51: state_S7[423:408] <= state_S8;
    52: state_S7[431:416] <= state_S8;
    53: state_S7[439:424] <= state_S8;
    54: state_S7[447:432] <= state_S8;
    55: state_S7[455:440] <= state_S8;
    56: state_S7[463:448] <= state_S8;
    57: state_S7[471:456] <= state_S8;
    58: state_S7[479:464] <= state_S8;
    59: state_S7[487:472] <= state_S8;
    60: state_S7[495:480] <= state_S8;
    61: state_S7[503:488] <= state_S8;
    62: state_S7[511:496] <= state_S8;
    63: state_S7[519:504] <= state_S8;
    64: state_S7[527:512] <= state_S8;
    65: state_S7[535:520] <= state_S8;
    66: state_S7[543:528] <= state_S8;
    67: state_S7[551:536] <= state_S8;
    68: state_S7[559:544] <= state_S8;
    69: state_S7[567:552] <= state_S8;
    70: state_S7[575:560] <= state_S8;
    71: state_S7[583:568] <= state_S8;
    72: state_S7[591:576] <= state_S8;
    73: state_S7[599:584] <= state_S8;
    74: state_S7[607:592] <= state_S8;
    75: state_S7[615:600] <= state_S8;
    76: state_S7[623:608] <= state_S8;
    77: state_S7[631:616] <= state_S8;
    78: state_S7[639:624] <= state_S8;
endcase

        temp13 <= state_S4 == temp14;
        temp25 <= state_S4 == temp26;
        temp12 <= state_S4 <<< 1;
        temp30 <= sp_addIx2_result;
        case (temp16)
    0: temp17 <= state_S7[15:0];
    1: temp17 <= state_S7[23:8];
    2: temp17 <= state_S7[31:16];
    3: temp17 <= state_S7[39:24];
    4: temp17 <= state_S7[47:32];
    5: temp17 <= state_S7[55:40];
    6: temp17 <= state_S7[63:48];
    7: temp17 <= state_S7[71:56];
    8: temp17 <= state_S7[79:64];
    9: temp17 <= state_S7[87:72];
    10: temp17 <= state_S7[95:80];
    11: temp17 <= state_S7[103:88];
    12: temp17 <= state_S7[111:96];
    13: temp17 <= state_S7[119:104];
    14: temp17 <= state_S7[127:112];
    15: temp17 <= state_S7[135:120];
    16: temp17 <= state_S7[143:128];
    17: temp17 <= state_S7[151:136];
    18: temp17 <= state_S7[159:144];
    19: temp17 <= state_S7[167:152];
    20: temp17 <= state_S7[175:160];
    21: temp17 <= state_S7[183:168];
    22: temp17 <= state_S7[191:176];
    23: temp17 <= state_S7[199:184];
    24: temp17 <= state_S7[207:192];
    25: temp17 <= state_S7[215:200];
    26: temp17 <= state_S7[223:208];
    27: temp17 <= state_S7[231:216];
    28: temp17 <= state_S7[239:224];
    29: temp17 <= state_S7[247:232];
    30: temp17 <= state_S7[255:240];
    31: temp17 <= state_S7[263:248];
    32: temp17 <= state_S7[271:256];
    33: temp17 <= state_S7[279:264];
    34: temp17 <= state_S7[287:272];
    35: temp17 <= state_S7[295:280];
    36: temp17 <= state_S7[303:288];
    37: temp17 <= state_S7[311:296];
    38: temp17 <= state_S7[319:304];
    39: temp17 <= state_S7[327:312];
    40: temp17 <= state_S7[335:320];
    41: temp17 <= state_S7[343:328];
    42: temp17 <= state_S7[351:336];
    43: temp17 <= state_S7[359:344];
    44: temp17 <= state_S7[367:352];
    45: temp17 <= state_S7[375:360];
    46: temp17 <= state_S7[383:368];
    47: temp17 <= state_S7[391:376];
    48: temp17 <= state_S7[399:384];
    49: temp17 <= state_S7[407:392];
    50: temp17 <= state_S7[415:400];
    51: temp17 <= state_S7[423:408];
    52: temp17 <= state_S7[431:416];
    53: temp17 <= state_S7[439:424];
    54: temp17 <= state_S7[447:432];
    55: temp17 <= state_S7[455:440];
    56: temp17 <= state_S7[463:448];
    57: temp17 <= state_S7[471:456];
    58: temp17 <= state_S7[479:464];
    59: temp17 <= state_S7[487:472];
    60: temp17 <= state_S7[495:480];
    61: temp17 <= state_S7[503:488];
    62: temp17 <= state_S7[511:496];
    63: temp17 <= state_S7[519:504];
    64: temp17 <= state_S7[527:512];
    65: temp17 <= state_S7[535:520];
    66: temp17 <= state_S7[543:528];
    67: temp17 <= state_S7[551:536];
    68: temp17 <= state_S7[559:544];
    69: temp17 <= state_S7[567:552];
    70: temp17 <= state_S7[575:560];
    71: temp17 <= state_S7[583:568];
    72: temp17 <= state_S7[591:576];
    73: temp17 <= state_S7[599:584];
    74: temp17 <= state_S7[607:592];
    75: temp17 <= state_S7[615:600];
    76: temp17 <= state_S7[623:608];
    77: temp17 <= state_S7[631:616];
    78: temp17 <= state_S7[639:624];
    default: temp17 <= 0;
endcase

        temp20 <= state_S6 == temp21;
        temp15 <= state_S6 < width;
        temp16 <= state_S6 <<< 1;
        temp27 <= state_S5 == temp28;
    end


    always @(posedge clk) begin
        if (rst) begin
            temp11 <= 0;
            temp9 <= 0;
            temp28 <= 0;
            temp5 <= 0;
            temp21 <= 0;
            temp10 <= 0;
            temp6 <= 0;
            temp7 <= 0;
            temp19 <= 0;
            // S6 <- 0
            state_S6 <= 0;
            // S5 <- 0
            state_S5 <= 0;
            // S4 <- 0
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
                    // temp11 <- height - 1
                    temp11 <= sp_subIx0_result;
                    // temp9 <- 0 == S5
                    temp9 <= 0 == state_S5;
                    // temp7 <- width - 1
                    temp7 <= sp_subIx1_result;
                    // S8 <- input0
                    state_S8 <= input_S1;
                    // temp5 <- 0 == S4
                    temp5 <= 0 == state_S4;
                    // goto 2
                    state <= 2;
                end else begin
                    running <= avail_S1;
                end
            end
            if (state == 2) begin
                if (guard_2) begin
                    // temp6 <- S4 == temp7
                    temp6 <= state_S4 == temp7;
                    // temp10 <- S5 == temp11
                    temp10 <= state_S5 == temp11;
                    // output0 <- S8
                    // goto 3
                    state <= 4;
                end else begin
                end
            end
            // temp8 <- temp10 || temp9
            // temp4 <- temp5 || temp6
            // goto 4
            if (state == 4) begin
                if (guard_4) begin
                    // if temp4 then 5 else 7
                    state <= temp4 ? 5 : 8;
                end else begin
                end
            end
            if (state == 5) begin
                if (guard_5) begin
                    // output0 <- S8
                    // goto 6
                    state <= 8;
                end else begin
                end
            end
            // goto 8
            // goto 8
            if (state == 8) begin
                if (guard_8) begin
                    // if temp8 then 9 else 35
                    state <= temp8 ? 13 : 38;
                end else begin
                end
            end
            // temp12 <- S4 << 1
            // goto 10
            // S7[temp12] <- S8
            // goto 11
            // temp14 <- temp7
            // goto 12
            // temp13 <- S4 == temp14
            // goto 13
            if (state == 13) begin
                if (guard_13) begin
                    // if temp13 then 14 else 33
                    state <= temp13 ? 16 : 38;
                end else begin
                end
            end
            // goto 15
            // temp15 <- S6 < width
            // goto 16
            if (state == 16) begin
                if (guard_16) begin
                    // if temp15 then 17 else 31
                    state <= temp15 ? 19 : 38;
                end else begin
                end
            end
            // temp16 <- S6 << 1
            // goto 18
            // temp17 <- S7[temp16]
            // goto 19
            if (state == 19) begin
                if (guard_19) begin
                    // temp19 <- 0 == S6
                    temp19 <= 0 == state_S6;
                    // temp21 <- width - 1
                    temp21 <= sp_subIx2_result;
                    // output0 <- temp17
                    // goto 20
                    state <= 22;
                end else begin
                end
            end
            // temp20 <- S6 == temp21
            // goto 21
            // temp18 <- temp19 || temp20
            // goto 22
            if (state == 22) begin
                if (guard_22) begin
                    // if temp18 then 23 else 27
                    state <= temp18 ? 25 : 29;
                end else begin
                end
            end
            // temp22 <- temp16
            // goto 24
            // temp23 <- S7[temp22]
            // goto 25
            if (state == 25) begin
                if (guard_25) begin
                    // output0 <- temp23
                    // goto 26
                    state <= 29;
                end else begin
                end
            end
            // goto 28
            // goto 28
            // temp24 <- 1 + S6
            // goto 29
            if (state == 29) begin
                if (guard_29) begin
                    // S6 <- temp24
                    state_S6 <= temp24;
                    // goto 30
                    state <= 16;
                end else begin
                end
            end
            // goto 15
            // goto 32
            // goto 34
            // goto 34
            // goto 36
            // goto 36
            // temp26 <- width - 1
            // goto 37
            // temp25 <- S4 == temp26
            // goto 38
            if (state == 38) begin
                if (guard_38) begin
                    // if temp25 then 39 else 47
                    state <= temp25 ? 39 : 48;
                end else begin
                end
            end
            if (state == 39) begin
                if (guard_39) begin
                    // temp28 <- height - 1
                    temp28 <= sp_subIx4_result;
                    // S4 <- 0
                    state_S4 <= 0;
                    // goto 40
                    state <= 41;
                end else begin
                end
            end
            // temp27 <- S5 == temp28
            // goto 41
            if (state == 41) begin
                if (guard_41) begin
                    // if temp27 then 42 else 44
                    state <= temp27 ? 42 : 45;
                end else begin
                end
            end
            if (state == 42) begin
                if (guard_42) begin
                    // S5 <- 0
                    state_S5 <= 0;
                    // goto 43
                    state <= 1;
                end else begin
                end
            end
            // goto 46
            // temp29 <- 1 + S5
            // goto 45
            if (state == 45) begin
                if (guard_45) begin
                    // S5 <- temp29
                    state_S5 <= temp29;
                    // goto 46
                    state <= 1;
                end else begin
                end
            end
            // goto 49
            // temp30 <- 1 + S4
            // goto 48
            if (state == 48) begin
                if (guard_48) begin
                    // S4 <- temp30
                    state_S4 <= temp30;
                    // goto 49
                    state <= 1;
                end else begin
                end
            end
            // goto 1
        end
    end
endmodule
