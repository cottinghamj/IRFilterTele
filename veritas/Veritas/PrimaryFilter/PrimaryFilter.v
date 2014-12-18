module kernel_PrimaryFilter(
    input_pixelIn,
    avail_pixelIn,
    read_pixelIn,
    input_lowThreshIn,
    avail_lowThreshIn,
    read_lowThreshIn,
    input_highThreshIn,
    avail_highThreshIn,
    read_highThreshIn,
    output_pixelOut,
    write_pixelOut,
    full_pixelOut,
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
    input wire [15:0] input_pixelIn;
    input wire avail_pixelIn;
    output wire read_pixelIn;
    input wire [15:0] input_lowThreshIn;
    input wire avail_lowThreshIn;
    output wire read_lowThreshIn;
    input wire [15:0] input_highThreshIn;
    input wire avail_highThreshIn;
    output wire read_highThreshIn;
    output wire [15:0] output_pixelOut;
    output wire write_pixelOut;
    input wire full_pixelOut;
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
    parameter outputCount = 1000;
    parameter width = 40;
    parameter height = 40;
    reg [31:0] state_S1;
    reg [31:0] state_S2;
    reg [31:0] state_S3;
    reg [7:0] state_S5;
    reg [31:0] state_S6;
    reg [15:0] state_S9;
    reg [15:0] state_S10;
    reg [15:0] state_S11;
    reg [15:0] state_S12;
    reg [15:0] state_S13;
    reg [15:0] state_S14;
    reg [15:0] state_S15;
    reg [15:0] state_S16;
    reg [15:0] state_S17;
    reg [15:0] state_S18;
    reg [15:0] state_S19;
    reg [15:0] state_S20;
    reg [15:0] state_S21;
    reg [15:0] state_S22;
    reg [15:0] state_S23;
    reg [15:0] state_S24;
    reg [15:0] state_S25;
    reg [15:0] state_S26;
    reg [15:0] state_S27;
    reg signed [7:0] temp68;
    reg [15:0] temp69;
    reg [31:0] temp70;
    reg [31:0] temp71;
    reg [31:0] temp72;
    reg signed [31:0] temp73;
    reg [15:0] temp74;
    reg [31:0] temp75;
    reg [31:0] temp76;
    reg [31:0] temp77;
    reg signed [31:0] temp78;
    reg signed [7:0] temp79;
    reg signed [7:0] temp80;
    reg signed [7:0] temp81;
    reg [31:0] temp83;
    reg [31:0] temp84;
    reg [31:0] temp85;
    reg [31:0] temp86;
    reg signed [7:0] temp87;
    reg [31:0] temp88;
    reg [31:0] temp89;
    reg [31:0] temp90;
    reg [31:0] temp91;
    reg [31:0] temp92;
    reg [31:0] temp93;
    reg [31:0] temp94;
    reg [31:0] temp95;
    reg [31:0] temp96;
    reg signed [31:0] temp97;
    reg [31:0] temp99;
    reg [31:0] temp100;
    reg [31:0] temp101;
    reg [31:0] temp102;
    reg signed [31:0] temp103;
    reg signed [31:0] temp105;
    reg signed [31:0] temp107;
    reg signed [31:0] temp109;
    reg [31:0] temp111;
    reg [31:0] temp112;
    reg [31:0] temp113;
    reg signed [31:0] temp114;
    reg signed [7:0] temp116;
    reg [7:0] temp117;
    reg [7:0] temp119;
    reg signed [31:0] temp120;
    reg [31:0] temp122;
    reg [31:0] temp123;
    reg signed [31:0] temp124;
    reg signed [7:0] temp126;
    reg [7:0] temp127;
    reg [7:0] temp128;
    reg [7:0] temp129;
    reg signed [31:0] temp130;
    reg [7:0] temp132;
    reg signed [31:0] temp133;
    reg [31:0] temp135;
    reg [31:0] temp136;
    reg [31:0] temp137;
    reg signed [31:0] temp138;
    reg signed [7:0] temp140;
    reg [31:0] temp141;
    reg [31:0] temp142;
    reg [31:0] temp143;
    reg [31:0] temp144;
    reg [31:0] temp145;
    reg [31:0] temp146;
    reg [31:0] temp147;
    reg signed [31:0] temp148;
    reg [31:0] temp150;
    reg [31:0] temp151;
    reg [31:0] temp152;
    reg signed [31:0] temp153;
    reg [31:0] temp155;
    reg signed [31:0] temp156;
    reg signed [7:0] temp158;
    reg [31:0] temp159;
    reg [31:0] temp160;
    reg [31:0] temp161;
    reg [31:0] temp162;
    reg [31:0] temp163;
    reg [31:0] temp164;
    reg [31:0] temp165;
    reg [31:0] temp166;
    reg [31:0] temp167;
    reg signed [31:0] temp168;
    reg [31:0] temp170;
    reg [31:0] temp171;
    reg [31:0] temp172;
    reg [31:0] temp173;
    reg signed [31:0] temp174;
    reg [31:0] temp176;
    reg signed [31:0] temp177;
    reg signed [7:0] temp179;
    reg signed [7:0] temp180;
    reg signed [7:0] temp181;
    reg [7:0] temp182;
    reg [7:0] temp183;
    reg signed [31:0] temp184;
    reg [7:0] temp186;
    reg signed [31:0] temp187;
    reg [31:0] temp189;
    reg [31:0] temp190;
    reg [31:0] temp191;
    reg signed [31:0] temp192;
    reg signed [7:0] temp194;
    reg [7:0] temp196;
    reg signed [31:0] temp197;
    reg [31:0] temp199;
    reg [31:0] temp200;
    reg signed [31:0] temp201;
    reg [31:0] temp203;
    reg [31:0] temp204;
    reg [31:0] temp205;
    reg signed [31:0] temp206;
    reg signed [7:0] temp208;
    reg signed [7:0] temp209;
    reg signed [7:0] temp210;
    reg signed [7:0] temp211;
    reg signed [7:0] temp212;
    reg signed [7:0] temp213;
    reg signed [7:0] temp214;
    reg signed [7:0] temp215;
    reg signed [7:0] temp216;
    reg signed [7:0] temp217;
    reg signed [7:0] temp218;
    reg signed [7:0] temp219;
    reg signed [7:0] temp220;
    reg signed [7:0] temp221;
    reg signed [7:0] temp222;
    reg signed [7:0] temp223;
    reg signed [7:0] temp224;
    reg signed [7:0] temp225;
    reg signed [31:0] temp226;
    reg signed [7:0] temp227;
    reg [7:0] temp228;
    reg signed [7:0] temp230;
    reg [31:0] temp231;
    reg [31:0] temp232;
    reg signed [7:0] temp234;
    reg signed [7:0] temp235;
    reg [31:0] temp236;
    reg [31:0] temp237;
    reg signed [7:0] temp238;
    reg [31:0] temp239;
    reg [31:0] ram_state;
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
            sp_mulIx0_0 <= temp84;
            sp_mulIx0_1 <= temp85;
        end
        if (state == 9) begin
            sp_mulIx0_start <= last_state != state;
            sp_mulIx0_0 <= state_S2;
            sp_mulIx0_1 <= temp77;
        end
        if (state == 4) begin
            sp_mulIx0_start <= last_state != state;
            sp_mulIx0_0 <= state_S2;
            sp_mulIx0_1 <= temp72;
        end
    end

    wire [31:0] sp_addIx17_result;
    sp_addI #(.WIDTH(32))
        sp_addIx17(temp161, temp162, sp_addIx17_result);

    wire [31:0] sp_addIx23_result;
    sp_addI #(.WIDTH(32))
        sp_addIx23(1, state_S6, sp_addIx23_result);

    wire [31:0] sp_addIx4_result;
    sp_addI #(.WIDTH(32))
        sp_addIx4(temp90, temp91, sp_addIx4_result);

    wire [31:0] sp_addIx7_result;
    sp_addI #(.WIDTH(32))
        sp_addIx7(temp95, temp96, sp_addIx7_result);

    wire [31:0] sp_subIx3_result;
    sp_subI #(.WIDTH(32))
        sp_subIx3(state_S6, temp113, sp_subIx3_result);

    wire [31:0] sp_addIx22_result;
    sp_addI #(.WIDTH(32))
        sp_addIx22(2, temp171, sp_addIx22_result);

    wire [7:0] sp_subIx11_result;
    sp_subI #(.WIDTH(8))
        sp_subIx11(temp183, 2, sp_subIx11_result);

    wire [7:0] sp_subIx6_result;
    sp_subI #(.WIDTH(8))
        sp_subIx6(temp129, 86, sp_subIx6_result);

    wire [31:0] sp_addIx10_result;
    sp_addI #(.WIDTH(32))
        sp_addIx10(1, temp100, sp_addIx10_result);

    wire [31:0] sp_subIx0_result;
    sp_subI #(.WIDTH(32))
        sp_subIx0(state_S1, 1, sp_subIx0_result);

    wire [7:0] sp_addIx31_result;
    sp_addI #(.WIDTH(8))
        sp_addIx31(1, state_S5, sp_addIx31_result);

    wire [7:0] sp_subIx14_result;
    sp_subI #(.WIDTH(8))
        sp_subIx14(state_S5, 1, sp_subIx14_result);

    wire [31:0] sp_subIx9_result;
    sp_subI #(.WIDTH(32))
        sp_subIx9(state_S6, 1, sp_subIx9_result);

    wire [31:0] sp_addIx19_result;
    sp_addI #(.WIDTH(32))
        sp_addIx19(temp166, temp167, sp_addIx19_result);

    wire [31:0] sp_addIx25_result;
    sp_addI #(.WIDTH(32))
        sp_addIx25(state_S6, temp191, sp_addIx25_result);

    wire [31:0] sp_addIx34_result;
    sp_addI #(.WIDTH(32))
        sp_addIx34(1, state_S3, sp_addIx34_result);

    wire [31:0] sp_addIx28_result;
    sp_addI #(.WIDTH(32))
        sp_addIx28(1, temp204, sp_addIx28_result);

    wire [31:0] sp_addIx13_result;
    sp_addI #(.WIDTH(32))
        sp_addIx13(1, temp136, sp_addIx13_result);

    wire [31:0] sp_addIx0_result;
    sp_addI #(.WIDTH(32))
        sp_addIx0(2, height, sp_addIx0_result);

    wire [31:0] sp_addIx9_result;
    sp_addI #(.WIDTH(32))
        sp_addIx9(temp101, temp102, sp_addIx9_result);

    wire [31:0] sp_addIx3_result;
    sp_addI #(.WIDTH(32))
        sp_addIx3(2, width, sp_addIx3_result);

    wire [31:0] sp_addIx16_result;
    sp_addI #(.WIDTH(32))
        sp_addIx16(temp151, temp152, sp_addIx16_result);

    wire [31:0] sp_subIx13_result;
    sp_subI #(.WIDTH(32))
        sp_subIx13(temp190, 1, sp_subIx13_result);

    wire [31:0] sp_subIx8_result;
    sp_subI #(.WIDTH(32))
        sp_subIx8(temp145, 86, sp_subIx8_result);

    wire [31:0] sp_addIx6_result;
    sp_addI #(.WIDTH(32))
        sp_addIx6(1, temp89, sp_addIx6_result);

    wire [31:0] sp_addIx27_result;
    sp_addI #(.WIDTH(32))
        sp_addIx27(state_S6, temp205, sp_addIx27_result);

    wire [31:0] sp_addIx33_result;
    sp_addI #(.WIDTH(32))
        sp_addIx33(1, state_S2, sp_addIx33_result);

    wire [31:0] sp_subIx2_result;
    sp_subI #(.WIDTH(32))
        sp_subIx2(temp93, 86, sp_subIx2_result);

    wire [31:0] sp_addIx15_result;
    sp_addI #(.WIDTH(32))
        sp_addIx15(temp146, temp147, sp_addIx15_result);

    wire [31:0] sp_subIx5_result;
    sp_subI #(.WIDTH(32))
        sp_subIx5(state_S6, temp123, sp_subIx5_result);

    wire [31:0] sp_addIx21_result;
    sp_addI #(.WIDTH(32))
        sp_addIx21(temp172, temp173, sp_addIx21_result);

    wire [31:0] sp_subIx10_result;
    sp_subI #(.WIDTH(32))
        sp_subIx10(temp164, 86, sp_subIx10_result);

    wire [7:0] sp_addIx24_result;
    sp_addI #(.WIDTH(8))
        sp_addIx24(86, state_S5, sp_addIx24_result);

    wire [31:0] sp_addIx30_result;
    sp_addI #(.WIDTH(32))
        sp_addIx30(2, width, sp_addIx30_result);

    wire [31:0] sp_addIx5_result;
    sp_addI #(.WIDTH(32))
        sp_addIx5(temp83, temp86, sp_addIx5_result);

    wire [31:0] sp_addIx18_result;
    sp_addI #(.WIDTH(32))
        sp_addIx18(2, temp160, sp_addIx18_result);

    wire [31:0] sp_addIx8_result;
    sp_addI #(.WIDTH(32))
        sp_addIx8(1, temp94, sp_addIx8_result);

    wire [7:0] sp_addIx12_result;
    sp_addI #(.WIDTH(8))
        sp_addIx12(2, state_S5, sp_addIx12_result);

    wire [31:0] sp_addIx2_result;
    sp_addI #(.WIDTH(32))
        sp_addIx2(state_S1, temp76, sp_addIx2_result);

    wire [31:0] sp_subIx4_result;
    sp_subI #(.WIDTH(32))
        sp_subIx4(temp112, 1, sp_subIx4_result);

    wire [7:0] sp_subIx12_result;
    sp_subI #(.WIDTH(8))
        sp_subIx12(state_S5, 2, sp_subIx12_result);

    wire [31:0] sp_subIx7_result;
    sp_subI #(.WIDTH(32))
        sp_subIx7(state_S6, temp137, sp_subIx7_result);

    wire [7:0] sp_addIx11_result;
    sp_addI #(.WIDTH(8))
        sp_addIx11(1, state_S5, sp_addIx11_result);

    wire [31:0] sp_addIx26_result;
    sp_addI #(.WIDTH(32))
        sp_addIx26(state_S6, temp200, sp_addIx26_result);

    wire [31:0] sp_addIx32_result;
    sp_addI #(.WIDTH(32))
        sp_addIx32(2, height, sp_addIx32_result);

    wire [31:0] sp_subIx1_result;
    sp_subI #(.WIDTH(32))
        sp_subIx1(state_S2, 1, sp_subIx1_result);

    wire [31:0] sp_addIx20_result;
    sp_addI #(.WIDTH(32))
        sp_addIx20(2, temp165, sp_addIx20_result);

    wire [31:0] sp_addIx29_result;
    sp_addI #(.WIDTH(32))
        sp_addIx29(1, state_S1, sp_addIx29_result);

    wire [31:0] sp_addIx1_result;
    sp_addI #(.WIDTH(32))
        sp_addIx1(state_S1, temp71, sp_addIx1_result);

    wire [31:0] sp_addIx14_result;
    sp_addI #(.WIDTH(32))
        sp_addIx14(temp142, temp143, sp_addIx14_result);

    wire guard_92 = ram_ready & (state == last_state) & !ram_re;
    wire guard_182 = 1;
    wire guard_173 = 1;
    wire guard_119 = ram_ready & (state == last_state) & !ram_re;
    wire guard_128 = ram_ready & (state == last_state) & !ram_re;
    wire guard_23 = 1;
    wire guard_176 = 1;
    wire guard_185 = 1;
    wire guard_59 = ram_ready & (state == last_state) & !ram_re;
    wire guard_41 = ram_ready & (state == last_state) & !ram_re;
    wire guard_140 = ram_ready & (state == last_state) & !ram_re;
    wire guard_62 = 1;
    wire guard_8 = avail_highThreshIn;
    wire guard_17 = 1;
    wire guard_35 = ram_ready & (state == last_state) & !ram_re;
    wire guard_89 = ram_ready & (state == last_state) & !ram_re;
    wire guard_29 = ram_ready & (state == last_state) & !ram_re;
    wire guard_2 = 1;
    wire guard_184 = 1;
    wire guard_166 = ram_ready & !ram_we & (state == last_state);
    wire guard_169 = 1;
    wire guard_160 = !full_pixelOut;
    wire guard_178 = 1;
    wire guard_115 = 1;
    wire guard_187 = 1;
    wire guard_181 = 1;
    wire guard_172 = 1;
    wire guard_46 = ram_ready & (state == last_state) & !ram_re;
    wire guard_136 = ram_ready & (state == last_state) & !ram_re;
    wire guard_109 = ram_ready & (state == last_state) & !ram_re;
    wire guard_55 = ram_ready & (state == last_state) & !ram_re;
    wire guard_145 = ram_ready & (state == last_state) & !ram_re;
    wire guard_154 = 1;
    wire guard_49 = 1;
    wire guard_130 = 1;
    wire guard_4 = (last_state == state) & sp_mulIx0_ready;
    wire guard_148 = !full_pixelOut;
    wire guard_103 = ram_ready & (state == last_state) & !ram_re;
    wire guard_112 = ram_ready & (state == last_state) & !ram_re;
    wire guard_97 = 1;
    wire guard_7 = ram_ready & !ram_we & (state == last_state);
    wire guard_79 = 1;
    wire guard_70 = ram_ready & (state == last_state) & !ram_re;
    wire guard_189 = 1;
    wire guard_37 = ram_ready & (state == last_state) & !ram_re;
    wire guard_1 = avail_pixelIn;
    wire guard_19 = (last_state == state) & sp_mulIx0_ready;
    wire guard_174 = 1;
    wire guard_147 = 1;
    wire guard_132 = ram_ready & (state == last_state) & !ram_re;
    wire guard_159 = 1;
    wire guard_123 = ram_ready & (state == last_state) & !ram_re;
    wire guard_162 = !full_pixelOut;
    wire guard_9 = (last_state == state) & sp_mulIx0_ready;
    wire guard_3 = avail_lowThreshIn;
    wire guard_12 = ram_ready & !ram_we & (state == last_state);
    wire guard_84 = ram_ready & (state == last_state) & !ram_re;
    wire guard_75 = ram_ready & (state == last_state) & !ram_re;
    wire guard_39 = ram_ready & (state == last_state) & !ram_re;
    wire guard_66 = ram_ready & (state == last_state) & !ram_re;
    wire guard_51 = ram_ready & (state == last_state) & !ram_re;
    wire guard_170 = 1;
    assign read_pixelIn = ((state == 1) & guard_1);
    assign read_highThreshIn = ((state == 8) & guard_8);
    assign read_lowThreshIn = ((state == 3) & guard_3);
    assign write_pixelOut = ((state == 148) & guard_148) | ((state == 160) & guard_160) | ((state == 162) & guard_162);
    assign output_pixelOut =  state == 162 ? 0 : ( state == 160 ? state_S17 : (0));
    reg dummy;
    always @(*) begin
        dummy <= clk;
        temp150 <= sp_addIx16_result;
        temp166 <= temp90;
        temp126 <= 86 <= temp127;
        temp156 <= temp155 <<< 1;
        temp70 <= sp_addIx1_result;
        temp228 <= sp_addIx31_result;
        temp101 <= temp90;
        temp235 <= temp236 == temp237;
        temp186 <= sp_subIx12_result;
        temp182 <= sp_subIx11_result;
        temp93 <= sp_addIx8_result;
        temp158 <= 86 <= temp159;
        temp208 <= state_S17 < state_S18;
        temp92 <= sp_subIx2_result;
        temp159 <= sp_addIx18_result;
        temp143 <= temp85;
        temp105 <= state_S6 <<< 1;
        temp176 <= sp_addIx23_result;
        temp103 <= temp99 <<< 1;
        temp113 <= temp85;
        temp191 <= temp85;
        temp138 <= temp135 <<< 1;
        temp127 <= sp_addIx12_result;
        temp73 <= temp70 <<< 1;
        temp203 <= sp_addIx28_result;
        temp216 <= temp217 || temp218;
        temp84 <= sp_subIx1_result;
        temp237 <= sp_addIx32_result;
        temp165 <= sp_addIx19_result;
        temp210 <= temp211 || temp224;
        temp79 <= temp80 && temp81;
        temp137 <= temp85;
        temp86 <= sp_subIx0_result;
        temp102 <= temp85;
        temp107 <= temp105;
        temp135 <= sp_addIx13_result;
        temp211 <= temp212 || temp223;
        temp209 <= temp210 || temp225;
        temp132 <= temp127;
        temp189 <= sp_subIx13_result;
        temp180 <= 0 == state_S5;
        temp179 <= temp180 || temp181;
        state_S6 <= sp_addIx5_result;
        temp224 <= state_S22 > state_S23;
        temp177 <= temp176 <<< 1;
        temp160 <= sp_addIx17_result;
        temp232 <= sp_addIx30_result;
        temp218 <= state_S26 > state_S27;
        temp128 <= sp_subIx6_result;
        temp222 <= state_S15 > state_S16;
        temp141 <= sp_addIx14_result;
        temp227 <= 86 == temp228;
        temp204 <= sp_addIx27_result;
        temp161 <= temp90;
        temp123 <= temp85;
        temp146 <= temp90;
        temp190 <= sp_addIx25_result;
        temp96 <= temp85;
        temp129 <= temp127;
        temp78 <= temp75 <<< 1;
        temp194 <= temp180;
        temp151 <= temp90;
        temp112 <= sp_subIx3_result;
        temp187 <= temp186 <<< 1;
        temp236 <= sp_addIx33_result;
        temp140 <= 86 <= temp141;
        temp174 <= temp170 <<< 1;
        temp197 <= temp196 <<< 1;
        temp89 <= sp_addIx4_result;
        temp173 <= temp85;
        temp95 <= temp90;
        temp172 <= temp90;
        temp231 <= sp_addIx29_result;
        temp144 <= sp_subIx8_result;
        temp167 <= temp85;
        temp148 <= temp144 <<< 1;
        temp120 <= temp119 <<< 1;
        temp97 <= temp92 <<< 1;
        temp214 <= temp215 || temp220;
        temp147 <= temp85;
        temp201 <= temp199 <<< 1;
        temp183 <= sp_addIx24_result;
        temp145 <= sp_addIx15_result;
        temp111 <= sp_subIx4_result;
        temp100 <= sp_addIx9_result;
        temp133 <= temp132 <<< 1;
        temp199 <= sp_addIx26_result;
        temp206 <= temp203 <<< 1;
        temp114 <= temp111 <<< 1;
        temp142 <= temp90;
        temp192 <= temp189 <<< 1;
        temp230 <= temp231 == temp232;
        temp212 <= temp213 || temp222;
        temp152 <= temp85;
        temp119 <= temp117;
        temp155 <= sp_subIx9_result;
        temp153 <= temp150 <<< 1;
        temp163 <= sp_subIx10_result;
        temp116 <= 86 == temp117;
        temp205 <= temp85;
        temp238 <= outputCount == temp239;
        temp234 <= 0 == state_S1;
        temp215 <= temp216 || temp219;
        temp171 <= sp_addIx21_result;
        temp94 <= sp_addIx7_result;
        temp168 <= temp163 <<< 1;
        temp226 <= state_S5 <<< 1;
        temp181 <= 1 == state_S5;
        temp130 <= temp128 <<< 1;
        temp136 <= sp_subIx7_result;
        temp90 <= {{24{1'b0}},state_S5};
        temp219 <= state_S10 < state_S9;
        temp85 <= sp_addIx3_result;
        temp81 <= 1 < state_S1;
        temp221 <= state_S13 > state_S14;
        temp75 <= sp_addIx2_result;
        temp164 <= sp_addIx20_result;
        temp200 <= temp85;
        temp225 <= state_S24 > state_S25;
        temp87 <= 86 <= temp88;
        temp162 <= temp85;
        temp220 <= state_S11 > state_S12;
        temp223 <= state_S20 > state_S21;
        temp117 <= sp_addIx11_result;
        temp170 <= sp_addIx22_result;
        temp196 <= sp_subIx14_result;
        temp124 <= temp122 <<< 1;
        temp122 <= sp_subIx5_result;
        temp184 <= temp182 <<< 1;
        temp99 <= sp_addIx10_result;
        temp109 <= state_S5 <<< 1;
        temp217 <= state_S17 > state_S19;
        temp88 <= sp_addIx6_result;
        temp80 <= 1 < state_S2;
    end


    always @(posedge clk) begin
        ram_re <= 0;
        ram_we <= 0;
        if (rst) begin
            state_S18 <= 0;
            state_S9 <= 0;
            temp239 <= 0;
            state_S15 <= 0;
            state_S26 <= 0;
            temp91 <= 0;
            state_S14 <= 0;
            state_S25 <= 0;
            state_S10 <= 0;
            state_S13 <= 0;
            temp68 <= 0;
            state_S21 <= 0;
            state_S19 <= 0;
            temp72 <= 0;
            state_S24 <= 0;
            temp76 <= 0;
            state_S12 <= 0;
            state_S20 <= 0;
            temp83 <= 0;
            temp71 <= 0;
            state_S17 <= 0;
            temp77 <= 0;
            state_S22 <= 0;
            state_S11 <= 0;
            temp69 <= 0;
            state_S27 <= 0;
            temp213 <= 0;
            state_S23 <= 0;
            state_S16 <= 0;
            temp74 <= 0;
            // S5 <- 0
            state_S5 <= 0;
            // S3 <- 0
            state_S3 <= 0;
            // S2 <- 0
            state_S2 <= 0;
            // S1 <- 0
            state_S1 <= 0;
            // start 1
            state <= 1;
            last_state <= 0;
            running <= 1;
        end else begin
            running <= 1;
            last_state <= state;
            if (state == 1) begin
                if (guard_1) begin
                    // S26 <- input0
                    state_S26 <= input_pixelIn;
                    // temp68 <- 0 == S3
                    temp68 <= 0 == state_S3;
                    // goto 2
                    state <= 2;
                end else begin
                    running <= avail_pixelIn;
                end
            end
            if (state == 2) begin
                if (guard_2) begin
                    // if temp68 then 3 else 14
                    state <= temp68 ? 3 : 17;
                end else begin
                end
            end
            if (state == 3) begin
                if (guard_3) begin
                    // temp69 <- input1
                    temp69 <= input_lowThreshIn;
                    // temp72 <- 2 + height
                    temp72 <= sp_addIx0_result;
                    // goto 4
                    state <= 4;
                end else begin
                    running <= avail_lowThreshIn;
                end
            end
            if (state == 4) begin
                if (guard_4) begin
                    // temp71 <- S2 * temp72
                    temp71 <= sp_mulIx0_result;
                    // goto 5
                    state <= 7;
                end else begin
                end
            end
            // temp70 <- S1 + temp71
            // goto 6
            // temp73 <- temp70 << 1
            // goto 7
            if (state == 7) begin
                if (guard_7) begin
                    // S7[temp73] <- temp69
                    // goto 8
                    state <= 8;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 0 + (temp73 >> 2);
                    ram_we <= 1;
                    case (temp73 & 3)
                        0: begin
                            ram_out[15:0] <= temp69[15:0];
                            ram_mask <= 3;
                        end
                        1: begin
                            ram_out[23:8] <= temp69[15:0];
                            ram_mask <= 6;
                        end
                        2: begin
                            ram_out[31:16] <= temp69[15:0];
                            ram_mask <= 12;
                        end
                    endcase
                end
            end
            if (state == 8) begin
                if (guard_8) begin
                    // temp77 <- temp72
                    temp77 <= temp72;
                    // temp74 <- input2
                    temp74 <= input_highThreshIn;
                    // goto 9
                    state <= 9;
                end else begin
                    running <= avail_highThreshIn;
                end
            end
            if (state == 9) begin
                if (guard_9) begin
                    // temp76 <- S2 * temp77
                    temp76 <= sp_mulIx0_result;
                    // goto 10
                    state <= 12;
                end else begin
                end
            end
            // temp75 <- S1 + temp76
            // goto 11
            // temp78 <- temp75 << 1
            // goto 12
            if (state == 12) begin
                if (guard_12) begin
                    // S8[temp78] <- temp74
                    // goto 13
                    state <= 17;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 882 + (temp78 >> 2);
                    ram_we <= 1;
                    case (temp78 & 3)
                        0: begin
                            ram_out[15:0] <= temp74[15:0];
                            ram_mask <= 3;
                        end
                        1: begin
                            ram_out[23:8] <= temp74[15:0];
                            ram_mask <= 6;
                        end
                        2: begin
                            ram_out[31:16] <= temp74[15:0];
                            ram_mask <= 12;
                        end
                    endcase
                end
            end
            // goto 15
            // goto 15
            // temp81 <- 1 < S1
            // temp80 <- 1 < S2
            // goto 16
            // temp79 <- temp80 && temp81
            // goto 17
            if (state == 17) begin
                if (guard_17) begin
                    // if temp79 then 18 else 164
                    state <= temp79 ? 19 : 166;
                end else begin
                end
            end
            // temp86 <- S1 - 1
            // temp85 <- 2 + width
            // temp84 <- S2 - 1
            // temp90 <- convert S5
            // goto 19
            if (state == 19) begin
                if (guard_19) begin
                    // temp91 <- temp85
                    temp91 <= temp85;
                    // temp83 <- temp84 * temp85
                    temp83 <= sp_mulIx0_result;
                    // goto 20
                    state <= 23;
                end else begin
                end
            end
            // temp89 <- temp90 + temp91
            // S6 <- temp83 + temp86
            // goto 21
            // temp88 <- 1 + temp89
            // goto 22
            // temp87 <- 86 <= temp88
            // goto 23
            if (state == 23) begin
                if (guard_23) begin
                    // if temp87 then 24 else 31
                    state <= temp87 ? 29 : 35;
                end else begin
                end
            end
            // temp96 <- temp85
            // temp95 <- temp90
            // goto 25
            // temp94 <- temp95 + temp96
            // goto 26
            // temp93 <- 1 + temp94
            // goto 27
            // temp92 <- temp93 - 86
            // goto 28
            // temp97 <- temp92 << 1
            // goto 29
            if (state == 29) begin
                if (guard_29) begin
                    // S17 <- S4[temp97]
                    // goto 30
                    state <= 37;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp97 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp97 & 3)
                        0: state_S17 <= ram_in[15:0];
                        1: state_S17 <= ram_in[23:8];
                        2: state_S17 <= ram_in[31:16];
                        default: state_S17 <= 0;
                    endcase
                end
            end
            // goto 36
            // temp101 <- temp90
            // temp102 <- temp85
            // goto 32
            // temp100 <- temp101 + temp102
            // goto 33
            // temp99 <- 1 + temp100
            // goto 34
            // temp103 <- temp99 << 1
            // goto 35
            if (state == 35) begin
                if (guard_35) begin
                    // S17 <- S4[temp103]
                    // goto 36
                    state <= 37;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp103 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp103 & 3)
                        0: state_S17 <= ram_in[15:0];
                        1: state_S17 <= ram_in[23:8];
                        2: state_S17 <= ram_in[31:16];
                        default: state_S17 <= 0;
                    endcase
                end
            end
            // temp105 <- S6 << 1
            // goto 37
            if (state == 37) begin
                if (guard_37) begin
                    // S18 <- S7[temp105]
                    // goto 38
                    state <= 39;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 0 + (temp105 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp105 & 3)
                        0: state_S18 <= ram_in[15:0];
                        1: state_S18 <= ram_in[23:8];
                        2: state_S18 <= ram_in[31:16];
                        default: state_S18 <= 0;
                    endcase
                end
            end
            // temp107 <- temp105
            // goto 39
            if (state == 39) begin
                if (guard_39) begin
                    // S19 <- S8[temp107]
                    // goto 40
                    state <= 41;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 882 + (temp107 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp107 & 3)
                        0: state_S19 <= ram_in[15:0];
                        1: state_S19 <= ram_in[23:8];
                        2: state_S19 <= ram_in[31:16];
                        default: state_S19 <= 0;
                    endcase
                end
            end
            // temp109 <- S5 << 1
            // goto 41
            if (state == 41) begin
                if (guard_41) begin
                    // S9 <- S4[temp109]
                    // goto 42
                    state <= 46;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp109 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp109 & 3)
                        0: state_S9 <= ram_in[15:0];
                        1: state_S9 <= ram_in[23:8];
                        2: state_S9 <= ram_in[31:16];
                        default: state_S9 <= 0;
                    endcase
                end
            end
            // temp113 <- temp85
            // goto 43
            // temp112 <- S6 - temp113
            // goto 44
            // temp111 <- temp112 - 1
            // goto 45
            // temp114 <- temp111 << 1
            // goto 46
            if (state == 46) begin
                if (guard_46) begin
                    // S10 <- S8[temp114]
                    // goto 47
                    state <= 49;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 882 + (temp114 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp114 & 3)
                        0: state_S10 <= ram_in[15:0];
                        1: state_S10 <= ram_in[23:8];
                        2: state_S10 <= ram_in[31:16];
                        default: state_S10 <= 0;
                    endcase
                end
            end
            // temp117 <- 1 + S5
            // goto 48
            // temp116 <- 86 == temp117
            // goto 49
            if (state == 49) begin
                if (guard_49) begin
                    // if temp116 then 50 else 53
                    state <= temp116 ? 51 : 55;
                end else begin
                end
            end
            // goto 51
            if (state == 51) begin
                if (guard_51) begin
                    // S11 <- S4[0]
                    // goto 52
                    state <= 59;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (0 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (0 & 3)
                        0: state_S11 <= ram_in[15:0];
                        1: state_S11 <= ram_in[23:8];
                        2: state_S11 <= ram_in[31:16];
                        default: state_S11 <= 0;
                    endcase
                end
            end
            // goto 56
            // temp119 <- temp117
            // goto 54
            // temp120 <- temp119 << 1
            // goto 55
            if (state == 55) begin
                if (guard_55) begin
                    // S11 <- S4[temp120]
                    // goto 56
                    state <= 59;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp120 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp120 & 3)
                        0: state_S11 <= ram_in[15:0];
                        1: state_S11 <= ram_in[23:8];
                        2: state_S11 <= ram_in[31:16];
                        default: state_S11 <= 0;
                    endcase
                end
            end
            // temp123 <- temp85
            // goto 57
            // temp122 <- S6 - temp123
            // goto 58
            // temp124 <- temp122 << 1
            // goto 59
            if (state == 59) begin
                if (guard_59) begin
                    // S12 <- S8[temp124]
                    // goto 60
                    state <= 62;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 882 + (temp124 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp124 & 3)
                        0: state_S12 <= ram_in[15:0];
                        1: state_S12 <= ram_in[23:8];
                        2: state_S12 <= ram_in[31:16];
                        default: state_S12 <= 0;
                    endcase
                end
            end
            // temp127 <- 2 + S5
            // goto 61
            // temp126 <- 86 <= temp127
            // goto 62
            if (state == 62) begin
                if (guard_62) begin
                    // if temp126 then 63 else 68
                    state <= temp126 ? 66 : 70;
                end else begin
                end
            end
            // temp129 <- temp127
            // goto 64
            // temp128 <- temp129 - 86
            // goto 65
            // temp130 <- temp128 << 1
            // goto 66
            if (state == 66) begin
                if (guard_66) begin
                    // S13 <- S4[temp130]
                    // goto 67
                    state <= 75;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp130 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp130 & 3)
                        0: state_S13 <= ram_in[15:0];
                        1: state_S13 <= ram_in[23:8];
                        2: state_S13 <= ram_in[31:16];
                        default: state_S13 <= 0;
                    endcase
                end
            end
            // goto 71
            // temp132 <- temp127
            // goto 69
            // temp133 <- temp132 << 1
            // goto 70
            if (state == 70) begin
                if (guard_70) begin
                    // S13 <- S4[temp133]
                    // goto 71
                    state <= 75;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp133 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp133 & 3)
                        0: state_S13 <= ram_in[15:0];
                        1: state_S13 <= ram_in[23:8];
                        2: state_S13 <= ram_in[31:16];
                        default: state_S13 <= 0;
                    endcase
                end
            end
            // temp137 <- temp85
            // goto 72
            // temp136 <- S6 - temp137
            // goto 73
            // temp135 <- 1 + temp136
            // goto 74
            // temp138 <- temp135 << 1
            // goto 75
            if (state == 75) begin
                if (guard_75) begin
                    // S14 <- S8[temp138]
                    // goto 76
                    state <= 79;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 882 + (temp138 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp138 & 3)
                        0: state_S14 <= ram_in[15:0];
                        1: state_S14 <= ram_in[23:8];
                        2: state_S14 <= ram_in[31:16];
                        default: state_S14 <= 0;
                    endcase
                end
            end
            // temp143 <- temp85
            // temp142 <- temp90
            // goto 77
            // temp141 <- temp142 + temp143
            // goto 78
            // temp140 <- 86 <= temp141
            // goto 79
            if (state == 79) begin
                if (guard_79) begin
                    // if temp140 then 80 else 86
                    state <= temp140 ? 84 : 89;
                end else begin
                end
            end
            // temp147 <- temp85
            // temp146 <- temp90
            // goto 81
            // temp145 <- temp146 + temp147
            // goto 82
            // temp144 <- temp145 - 86
            // goto 83
            // temp148 <- temp144 << 1
            // goto 84
            if (state == 84) begin
                if (guard_84) begin
                    // S15 <- S4[temp148]
                    // goto 85
                    state <= 92;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp148 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp148 & 3)
                        0: state_S15 <= ram_in[15:0];
                        1: state_S15 <= ram_in[23:8];
                        2: state_S15 <= ram_in[31:16];
                        default: state_S15 <= 0;
                    endcase
                end
            end
            // goto 90
            // temp152 <- temp85
            // temp151 <- temp90
            // goto 87
            // temp150 <- temp151 + temp152
            // goto 88
            // temp153 <- temp150 << 1
            // goto 89
            if (state == 89) begin
                if (guard_89) begin
                    // S15 <- S4[temp153]
                    // goto 90
                    state <= 92;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp153 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp153 & 3)
                        0: state_S15 <= ram_in[15:0];
                        1: state_S15 <= ram_in[23:8];
                        2: state_S15 <= ram_in[31:16];
                        default: state_S15 <= 0;
                    endcase
                end
            end
            // temp155 <- S6 - 1
            // goto 91
            // temp156 <- temp155 << 1
            // goto 92
            if (state == 92) begin
                if (guard_92) begin
                    // S16 <- S8[temp156]
                    // goto 93
                    state <= 97;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 882 + (temp156 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp156 & 3)
                        0: state_S16 <= ram_in[15:0];
                        1: state_S16 <= ram_in[23:8];
                        2: state_S16 <= ram_in[31:16];
                        default: state_S16 <= 0;
                    endcase
                end
            end
            // temp162 <- temp85
            // temp161 <- temp90
            // goto 94
            // temp160 <- temp161 + temp162
            // goto 95
            // temp159 <- 2 + temp160
            // goto 96
            // temp158 <- 86 <= temp159
            // goto 97
            if (state == 97) begin
                if (guard_97) begin
                    // if temp158 then 98 else 105
                    state <= temp158 ? 103 : 109;
                end else begin
                end
            end
            // temp166 <- temp90
            // temp167 <- temp85
            // goto 99
            // temp165 <- temp166 + temp167
            // goto 100
            // temp164 <- 2 + temp165
            // goto 101
            // temp163 <- temp164 - 86
            // goto 102
            // temp168 <- temp163 << 1
            // goto 103
            if (state == 103) begin
                if (guard_103) begin
                    // S20 <- S4[temp168]
                    // goto 104
                    state <= 112;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp168 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp168 & 3)
                        0: state_S20 <= ram_in[15:0];
                        1: state_S20 <= ram_in[23:8];
                        2: state_S20 <= ram_in[31:16];
                        default: state_S20 <= 0;
                    endcase
                end
            end
            // goto 110
            // temp173 <- temp85
            // temp172 <- temp90
            // goto 106
            // temp171 <- temp172 + temp173
            // goto 107
            // temp170 <- 2 + temp171
            // goto 108
            // temp174 <- temp170 << 1
            // goto 109
            if (state == 109) begin
                if (guard_109) begin
                    // S20 <- S4[temp174]
                    // goto 110
                    state <= 112;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp174 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp174 & 3)
                        0: state_S20 <= ram_in[15:0];
                        1: state_S20 <= ram_in[23:8];
                        2: state_S20 <= ram_in[31:16];
                        default: state_S20 <= 0;
                    endcase
                end
            end
            // temp176 <- 1 + S6
            // goto 111
            // temp177 <- temp176 << 1
            // goto 112
            if (state == 112) begin
                if (guard_112) begin
                    // S21 <- S8[temp177]
                    // goto 113
                    state <= 115;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 882 + (temp177 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp177 & 3)
                        0: state_S21 <= ram_in[15:0];
                        1: state_S21 <= ram_in[23:8];
                        2: state_S21 <= ram_in[31:16];
                        default: state_S21 <= 0;
                    endcase
                end
            end
            // temp181 <- 1 == S5
            // temp180 <- 0 == S5
            // goto 114
            // temp179 <- temp180 || temp181
            // goto 115
            if (state == 115) begin
                if (guard_115) begin
                    // if temp179 then 116 else 121
                    state <= temp179 ? 119 : 123;
                end else begin
                end
            end
            // temp183 <- 86 + S5
            // goto 117
            // temp182 <- temp183 - 2
            // goto 118
            // temp184 <- temp182 << 1
            // goto 119
            if (state == 119) begin
                if (guard_119) begin
                    // S22 <- S4[temp184]
                    // goto 120
                    state <= 128;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp184 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp184 & 3)
                        0: state_S22 <= ram_in[15:0];
                        1: state_S22 <= ram_in[23:8];
                        2: state_S22 <= ram_in[31:16];
                        default: state_S22 <= 0;
                    endcase
                end
            end
            // goto 124
            // temp186 <- S5 - 2
            // goto 122
            // temp187 <- temp186 << 1
            // goto 123
            if (state == 123) begin
                if (guard_123) begin
                    // S22 <- S4[temp187]
                    // goto 124
                    state <= 128;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp187 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp187 & 3)
                        0: state_S22 <= ram_in[15:0];
                        1: state_S22 <= ram_in[23:8];
                        2: state_S22 <= ram_in[31:16];
                        default: state_S22 <= 0;
                    endcase
                end
            end
            // temp191 <- temp85
            // goto 125
            // temp190 <- S6 + temp191
            // goto 126
            // temp189 <- temp190 - 1
            // goto 127
            // temp192 <- temp189 << 1
            // goto 128
            if (state == 128) begin
                if (guard_128) begin
                    // S23 <- S8[temp192]
                    // goto 129
                    state <= 130;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 882 + (temp192 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp192 & 3)
                        0: state_S23 <= ram_in[15:0];
                        1: state_S23 <= ram_in[23:8];
                        2: state_S23 <= ram_in[31:16];
                        default: state_S23 <= 0;
                    endcase
                end
            end
            // temp194 <- temp180
            // goto 130
            if (state == 130) begin
                if (guard_130) begin
                    // if temp194 then 131 else 134
                    state <= temp194 ? 132 : 136;
                end else begin
                end
            end
            // goto 132
            if (state == 132) begin
                if (guard_132) begin
                    // S24 <- S4[170]
                    // goto 133
                    state <= 140;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (170 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (170 & 3)
                        0: state_S24 <= ram_in[15:0];
                        1: state_S24 <= ram_in[23:8];
                        2: state_S24 <= ram_in[31:16];
                        default: state_S24 <= 0;
                    endcase
                end
            end
            // goto 137
            // temp196 <- S5 - 1
            // goto 135
            // temp197 <- temp196 << 1
            // goto 136
            if (state == 136) begin
                if (guard_136) begin
                    // S24 <- S4[temp197]
                    // goto 137
                    state <= 140;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 1764 + (temp197 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp197 & 3)
                        0: state_S24 <= ram_in[15:0];
                        1: state_S24 <= ram_in[23:8];
                        2: state_S24 <= ram_in[31:16];
                        default: state_S24 <= 0;
                    endcase
                end
            end
            // temp200 <- temp85
            // goto 138
            // temp199 <- S6 + temp200
            // goto 139
            // temp201 <- temp199 << 1
            // goto 140
            if (state == 140) begin
                if (guard_140) begin
                    // S25 <- S8[temp201]
                    // goto 141
                    state <= 145;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 882 + (temp201 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp201 & 3)
                        0: state_S25 <= ram_in[15:0];
                        1: state_S25 <= ram_in[23:8];
                        2: state_S25 <= ram_in[31:16];
                        default: state_S25 <= 0;
                    endcase
                end
            end
            // temp205 <- temp85
            // goto 142
            // temp204 <- S6 + temp205
            // goto 143
            // temp203 <- 1 + temp204
            // goto 144
            // temp206 <- temp203 << 1
            // goto 145
            if (state == 145) begin
                if (guard_145) begin
                    // S27 <- S8[temp206]
                    // goto 146
                    state <= 147;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 0;
                    ram_addr <= 882 + (temp206 >> 2);
                    ram_re <= 1;
                    ram_mask <= {4{1'b1}};
                end
                if (ram_ready && !ram_re && state == last_state && ram_state != 1) begin
                    case (temp206 & 3)
                        0: state_S27 <= ram_in[15:0];
                        1: state_S27 <= ram_in[23:8];
                        2: state_S27 <= ram_in[31:16];
                        default: state_S27 <= 0;
                    endcase
                end
            end
            // temp208 <- S17 < S18
            // goto 147
            if (state == 147) begin
                if (guard_147) begin
                    // if temp208 then 148 else 150
                    state <= temp208 ? 148 : 154;
                end else begin
                end
            end
            if (state == 148) begin
                if (guard_148) begin
                    // output0 <- 0
                    // goto 149
                    state <= 166;
                end else begin
                end
            end
            // goto 163
            // temp219 <- S10 < S9
            // temp221 <- S13 > S14
            // temp224 <- S22 > S23
            // temp218 <- S26 > S27
            // temp222 <- S15 > S16
            // temp220 <- S11 > S12
            // temp225 <- S24 > S25
            // temp223 <- S20 > S21
            // temp217 <- S17 > S19
            // goto 151
            // temp216 <- temp217 || temp218
            // goto 152
            // temp215 <- temp216 || temp219
            // goto 153
            // temp214 <- temp215 || temp220
            // goto 154
            if (state == 154) begin
                if (guard_154) begin
                    // temp213 <- temp214 || temp221
                    temp213 <= temp214 || temp221;
                    // goto 155
                    state <= 159;
                end else begin
                end
            end
            // temp212 <- temp213 || temp222
            // goto 156
            // temp211 <- temp212 || temp223
            // goto 157
            // temp210 <- temp211 || temp224
            // goto 158
            // temp209 <- temp210 || temp225
            // goto 159
            if (state == 159) begin
                if (guard_159) begin
                    // if temp209 then 160 else 162
                    state <= temp209 ? 160 : 162;
                end else begin
                end
            end
            if (state == 160) begin
                if (guard_160) begin
                    // output0 <- S17
                    // goto 161
                    state <= 166;
                end else begin
                end
            end
            // goto 163
            if (state == 162) begin
                if (guard_162) begin
                    // output0 <- 0
                    // goto 163
                    state <= 166;
                end else begin
                end
            end
            // goto 165
            // goto 165
            // temp226 <- S5 << 1
            // goto 166
            if (state == 166) begin
                if (guard_166) begin
                    // S4[temp226] <- S26
                    // goto 167
                    state <= 169;
                end else begin
                end
                if (state != last_state) begin
                    ram_state <= 1;
                    ram_addr <= 1764 + (temp226 >> 2);
                    ram_we <= 1;
                    case (temp226 & 3)
                        0: begin
                            ram_out[15:0] <= state_S26[15:0];
                            ram_mask <= 3;
                        end
                        1: begin
                            ram_out[23:8] <= state_S26[15:0];
                            ram_mask <= 6;
                        end
                        2: begin
                            ram_out[31:16] <= state_S26[15:0];
                            ram_mask <= 12;
                        end
                    endcase
                end
            end
            // temp231 <- 1 + S1
            // temp232 <- 2 + width
            // temp228 <- 1 + S5
            // goto 168
            // temp230 <- temp231 == temp232
            // temp227 <- 86 == temp228
            // goto 169
            if (state == 169) begin
                if (guard_169) begin
                    // if temp227 then 170 else 172
                    state <= temp227 ? 170 : 172;
                end else begin
                end
            end
            if (state == 170) begin
                if (guard_170) begin
                    // S5 <- 0
                    state_S5 <= 0;
                    // goto 171
                    state <= 173;
                end else begin
                end
            end
            // goto 173
            if (state == 172) begin
                if (guard_172) begin
                    // S5 <- temp228
                    state_S5 <= temp228;
                    // goto 173
                    state <= 173;
                end else begin
                end
            end
            if (state == 173) begin
                if (guard_173) begin
                    // if temp230 then 174 else 176
                    state <= temp230 ? 174 : 176;
                end else begin
                end
            end
            if (state == 174) begin
                if (guard_174) begin
                    // S1 <- 0
                    state_S1 <= 0;
                    // goto 175
                    state <= 178;
                end else begin
                end
            end
            // goto 177
            if (state == 176) begin
                if (guard_176) begin
                    // S1 <- temp231
                    state_S1 <= temp231;
                    // goto 177
                    state <= 178;
                end else begin
                end
            end
            // temp234 <- 0 == S1
            // goto 178
            if (state == 178) begin
                if (guard_178) begin
                    // if temp234 then 179 else 191
                    state <= temp234 ? 181 : 1;
                end else begin
                end
            end
            // temp237 <- 2 + height
            // temp236 <- 1 + S2
            // goto 180
            // temp235 <- temp236 == temp237
            // goto 181
            if (state == 181) begin
                if (guard_181) begin
                    // if temp235 then 182 else 189
                    state <= temp235 ? 182 : 189;
                end else begin
                end
            end
            if (state == 182) begin
                if (guard_182) begin
                    // temp239 <- 1 + S3
                    temp239 <= sp_addIx34_result;
                    // S2 <- 0
                    state_S2 <= 0;
                    // goto 183
                    state <= 184;
                end else begin
                end
            end
            // temp238 <- outputCount == temp239
            // goto 184
            if (state == 184) begin
                if (guard_184) begin
                    // if temp238 then 185 else 187
                    state <= temp238 ? 185 : 187;
                end else begin
                end
            end
            if (state == 185) begin
                if (guard_185) begin
                    // S3 <- 0
                    state_S3 <= 0;
                    // goto 186
                    state <= 1;
                end else begin
                end
            end
            // goto 188
            if (state == 187) begin
                if (guard_187) begin
                    // S3 <- temp239
                    state_S3 <= temp239;
                    // goto 188
                    state <= 1;
                end else begin
                end
            end
            // goto 190
            if (state == 189) begin
                if (guard_189) begin
                    // S2 <- temp236
                    state_S2 <= temp236;
                    // goto 190
                    state <= 1;
                end else begin
                end
            end
            // goto 192
            // goto 192
            // goto 1
        end
    end
endmodule
