module kernel_BorderExtHiThreshold(
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
    reg signed [7:0] temp307;
    reg signed [7:0] temp308;
    reg signed [7:0] temp309;
    reg [31:0] temp310;
    reg signed [7:0] temp311;
    reg signed [7:0] temp312;
    reg signed [7:0] temp313;
    reg [31:0] temp314;
    reg signed [31:0] temp315;
    reg signed [7:0] temp316;
    reg [31:0] temp317;
    reg signed [7:0] temp318;
    reg signed [31:0] temp319;
    reg [15:0] temp320;
    reg signed [7:0] temp321;
    reg signed [7:0] temp322;
    reg signed [7:0] temp323;
    reg [31:0] temp324;
    reg signed [31:0] temp325;
    reg [15:0] temp326;
    reg [31:0] temp327;
    reg signed [7:0] temp328;
    reg [31:0] temp329;
    reg signed [7:0] temp330;
    reg [31:0] temp331;
    reg [31:0] temp332;
    reg [31:0] temp333;
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
    assign output_S2 =  state == 25 ? temp326 : ( state == 19 ? temp320 : ( state == 5 ? state_S8 : (state_S8)));
    reg dummy;
    always @(*) begin
        dummy <= clk;
        temp330 <= state_S5 == temp331;
        temp315 <= state_S4 <<< 1;
        temp311 <= temp312 || temp313;
        temp307 <= temp308 || temp309;
        case (temp325)
    0: temp326 <= state_S7[15:0];
    1: temp326 <= state_S7[23:8];
    2: temp326 <= state_S7[31:16];
    3: temp326 <= state_S7[39:24];
    4: temp326 <= state_S7[47:32];
    5: temp326 <= state_S7[55:40];
    6: temp326 <= state_S7[63:48];
    7: temp326 <= state_S7[71:56];
    8: temp326 <= state_S7[79:64];
    9: temp326 <= state_S7[87:72];
    10: temp326 <= state_S7[95:80];
    11: temp326 <= state_S7[103:88];
    12: temp326 <= state_S7[111:96];
    13: temp326 <= state_S7[119:104];
    14: temp326 <= state_S7[127:112];
    15: temp326 <= state_S7[135:120];
    16: temp326 <= state_S7[143:128];
    17: temp326 <= state_S7[151:136];
    18: temp326 <= state_S7[159:144];
    19: temp326 <= state_S7[167:152];
    20: temp326 <= state_S7[175:160];
    21: temp326 <= state_S7[183:168];
    22: temp326 <= state_S7[191:176];
    23: temp326 <= state_S7[199:184];
    24: temp326 <= state_S7[207:192];
    25: temp326 <= state_S7[215:200];
    26: temp326 <= state_S7[223:208];
    27: temp326 <= state_S7[231:216];
    28: temp326 <= state_S7[239:224];
    29: temp326 <= state_S7[247:232];
    30: temp326 <= state_S7[255:240];
    31: temp326 <= state_S7[263:248];
    32: temp326 <= state_S7[271:256];
    33: temp326 <= state_S7[279:264];
    34: temp326 <= state_S7[287:272];
    35: temp326 <= state_S7[295:280];
    36: temp326 <= state_S7[303:288];
    37: temp326 <= state_S7[311:296];
    38: temp326 <= state_S7[319:304];
    39: temp326 <= state_S7[327:312];
    40: temp326 <= state_S7[335:320];
    41: temp326 <= state_S7[343:328];
    42: temp326 <= state_S7[351:336];
    43: temp326 <= state_S7[359:344];
    44: temp326 <= state_S7[367:352];
    45: temp326 <= state_S7[375:360];
    46: temp326 <= state_S7[383:368];
    47: temp326 <= state_S7[391:376];
    48: temp326 <= state_S7[399:384];
    49: temp326 <= state_S7[407:392];
    50: temp326 <= state_S7[415:400];
    51: temp326 <= state_S7[423:408];
    52: temp326 <= state_S7[431:416];
    53: temp326 <= state_S7[439:424];
    54: temp326 <= state_S7[447:432];
    55: temp326 <= state_S7[455:440];
    56: temp326 <= state_S7[463:448];
    57: temp326 <= state_S7[471:456];
    58: temp326 <= state_S7[479:464];
    59: temp326 <= state_S7[487:472];
    60: temp326 <= state_S7[495:480];
    61: temp326 <= state_S7[503:488];
    62: temp326 <= state_S7[511:496];
    63: temp326 <= state_S7[519:504];
    64: temp326 <= state_S7[527:512];
    65: temp326 <= state_S7[535:520];
    66: temp326 <= state_S7[543:528];
    67: temp326 <= state_S7[551:536];
    68: temp326 <= state_S7[559:544];
    69: temp326 <= state_S7[567:552];
    70: temp326 <= state_S7[575:560];
    71: temp326 <= state_S7[583:568];
    72: temp326 <= state_S7[591:576];
    73: temp326 <= state_S7[599:584];
    74: temp326 <= state_S7[607:592];
    75: temp326 <= state_S7[615:600];
    76: temp326 <= state_S7[623:608];
    77: temp326 <= state_S7[631:616];
    78: temp326 <= state_S7[639:624];
    default: temp326 <= 0;
endcase

        temp318 <= state_S6 < width;
        temp327 <= sp_addIx0_result;
        temp333 <= sp_addIx2_result;
        temp332 <= sp_addIx1_result;
        temp321 <= temp322 || temp323;
        case (temp315)
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

        temp323 <= state_S6 == temp324;
        temp328 <= state_S4 == temp329;
        temp319 <= state_S6 <<< 1;
        case (temp319)
    0: temp320 <= state_S7[15:0];
    1: temp320 <= state_S7[23:8];
    2: temp320 <= state_S7[31:16];
    3: temp320 <= state_S7[39:24];
    4: temp320 <= state_S7[47:32];
    5: temp320 <= state_S7[55:40];
    6: temp320 <= state_S7[63:48];
    7: temp320 <= state_S7[71:56];
    8: temp320 <= state_S7[79:64];
    9: temp320 <= state_S7[87:72];
    10: temp320 <= state_S7[95:80];
    11: temp320 <= state_S7[103:88];
    12: temp320 <= state_S7[111:96];
    13: temp320 <= state_S7[119:104];
    14: temp320 <= state_S7[127:112];
    15: temp320 <= state_S7[135:120];
    16: temp320 <= state_S7[143:128];
    17: temp320 <= state_S7[151:136];
    18: temp320 <= state_S7[159:144];
    19: temp320 <= state_S7[167:152];
    20: temp320 <= state_S7[175:160];
    21: temp320 <= state_S7[183:168];
    22: temp320 <= state_S7[191:176];
    23: temp320 <= state_S7[199:184];
    24: temp320 <= state_S7[207:192];
    25: temp320 <= state_S7[215:200];
    26: temp320 <= state_S7[223:208];
    27: temp320 <= state_S7[231:216];
    28: temp320 <= state_S7[239:224];
    29: temp320 <= state_S7[247:232];
    30: temp320 <= state_S7[255:240];
    31: temp320 <= state_S7[263:248];
    32: temp320 <= state_S7[271:256];
    33: temp320 <= state_S7[279:264];
    34: temp320 <= state_S7[287:272];
    35: temp320 <= state_S7[295:280];
    36: temp320 <= state_S7[303:288];
    37: temp320 <= state_S7[311:296];
    38: temp320 <= state_S7[319:304];
    39: temp320 <= state_S7[327:312];
    40: temp320 <= state_S7[335:320];
    41: temp320 <= state_S7[343:328];
    42: temp320 <= state_S7[351:336];
    43: temp320 <= state_S7[359:344];
    44: temp320 <= state_S7[367:352];
    45: temp320 <= state_S7[375:360];
    46: temp320 <= state_S7[383:368];
    47: temp320 <= state_S7[391:376];
    48: temp320 <= state_S7[399:384];
    49: temp320 <= state_S7[407:392];
    50: temp320 <= state_S7[415:400];
    51: temp320 <= state_S7[423:408];
    52: temp320 <= state_S7[431:416];
    53: temp320 <= state_S7[439:424];
    54: temp320 <= state_S7[447:432];
    55: temp320 <= state_S7[455:440];
    56: temp320 <= state_S7[463:448];
    57: temp320 <= state_S7[471:456];
    58: temp320 <= state_S7[479:464];
    59: temp320 <= state_S7[487:472];
    60: temp320 <= state_S7[495:480];
    61: temp320 <= state_S7[503:488];
    62: temp320 <= state_S7[511:496];
    63: temp320 <= state_S7[519:504];
    64: temp320 <= state_S7[527:512];
    65: temp320 <= state_S7[535:520];
    66: temp320 <= state_S7[543:528];
    67: temp320 <= state_S7[551:536];
    68: temp320 <= state_S7[559:544];
    69: temp320 <= state_S7[567:552];
    70: temp320 <= state_S7[575:560];
    71: temp320 <= state_S7[583:568];
    72: temp320 <= state_S7[591:576];
    73: temp320 <= state_S7[599:584];
    74: temp320 <= state_S7[607:592];
    75: temp320 <= state_S7[615:600];
    76: temp320 <= state_S7[623:608];
    77: temp320 <= state_S7[631:616];
    78: temp320 <= state_S7[639:624];
    default: temp320 <= 0;
endcase

        temp325 <= temp319;
        temp329 <= sp_subIx3_result;
        temp316 <= state_S4 == temp317;
        temp317 <= temp310;
    end


    always @(posedge clk) begin
        if (rst) begin
            temp313 <= 0;
            temp324 <= 0;
            temp322 <= 0;
            temp312 <= 0;
            temp309 <= 0;
            temp331 <= 0;
            temp308 <= 0;
            temp314 <= 0;
            temp310 <= 0;
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
                    // S8 <- input0
                    state_S8 <= input_S1;
                    // temp314 <- height - 1
                    temp314 <= sp_subIx0_result;
                    // temp312 <- 0 == S5
                    temp312 <= 0 == state_S5;
                    // temp308 <- 0 == S4
                    temp308 <= 0 == state_S4;
                    // temp310 <- width - 1
                    temp310 <= sp_subIx1_result;
                    // goto 2
                    state <= 2;
                end else begin
                    running <= avail_S1;
                end
            end
            if (state == 2) begin
                if (guard_2) begin
                    // temp313 <- S5 == temp314
                    temp313 <= state_S5 == temp314;
                    // temp309 <- S4 == temp310
                    temp309 <= state_S4 == temp310;
                    // output0 <- S8
                    // goto 3
                    state <= 4;
                end else begin
                end
            end
            // temp311 <- temp312 || temp313
            // temp307 <- temp308 || temp309
            // goto 4
            if (state == 4) begin
                if (guard_4) begin
                    // if temp307 then 5 else 7
                    state <= temp307 ? 5 : 8;
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
                    // if temp311 then 9 else 35
                    state <= temp311 ? 13 : 38;
                end else begin
                end
            end
            // temp315 <- S4 << 1
            // goto 10
            // S7[temp315] <- S8
            // goto 11
            // temp317 <- temp310
            // goto 12
            // temp316 <- S4 == temp317
            // goto 13
            if (state == 13) begin
                if (guard_13) begin
                    // if temp316 then 14 else 33
                    state <= temp316 ? 16 : 38;
                end else begin
                end
            end
            // goto 15
            // temp318 <- S6 < width
            // goto 16
            if (state == 16) begin
                if (guard_16) begin
                    // if temp318 then 17 else 31
                    state <= temp318 ? 19 : 38;
                end else begin
                end
            end
            // temp319 <- S6 << 1
            // goto 18
            // temp320 <- S7[temp319]
            // goto 19
            if (state == 19) begin
                if (guard_19) begin
                    // temp324 <- width - 1
                    temp324 <= sp_subIx2_result;
                    // temp322 <- 0 == S6
                    temp322 <= 0 == state_S6;
                    // output0 <- temp320
                    // goto 20
                    state <= 22;
                end else begin
                end
            end
            // temp323 <- S6 == temp324
            // goto 21
            // temp321 <- temp322 || temp323
            // goto 22
            if (state == 22) begin
                if (guard_22) begin
                    // if temp321 then 23 else 27
                    state <= temp321 ? 25 : 29;
                end else begin
                end
            end
            // temp325 <- temp319
            // goto 24
            // temp326 <- S7[temp325]
            // goto 25
            if (state == 25) begin
                if (guard_25) begin
                    // output0 <- temp326
                    // goto 26
                    state <= 29;
                end else begin
                end
            end
            // goto 28
            // goto 28
            // temp327 <- 1 + S6
            // goto 29
            if (state == 29) begin
                if (guard_29) begin
                    // S6 <- temp327
                    state_S6 <= temp327;
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
            // temp329 <- width - 1
            // goto 37
            // temp328 <- S4 == temp329
            // goto 38
            if (state == 38) begin
                if (guard_38) begin
                    // if temp328 then 39 else 47
                    state <= temp328 ? 39 : 48;
                end else begin
                end
            end
            if (state == 39) begin
                if (guard_39) begin
                    // temp331 <- height - 1
                    temp331 <= sp_subIx4_result;
                    // S4 <- 0
                    state_S4 <= 0;
                    // goto 40
                    state <= 41;
                end else begin
                end
            end
            // temp330 <- S5 == temp331
            // goto 41
            if (state == 41) begin
                if (guard_41) begin
                    // if temp330 then 42 else 44
                    state <= temp330 ? 42 : 45;
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
            // temp332 <- 1 + S5
            // goto 45
            if (state == 45) begin
                if (guard_45) begin
                    // S5 <- temp332
                    state_S5 <= temp332;
                    // goto 46
                    state <= 1;
                end else begin
                end
            end
            // goto 49
            // temp333 <- 1 + S4
            // goto 48
            if (state == 48) begin
                if (guard_48) begin
                    // S4 <- temp333
                    state_S4 <= temp333;
                    // goto 49
                    state <= 1;
                end else begin
                end
            end
            // goto 1
        end
    end
endmodule
