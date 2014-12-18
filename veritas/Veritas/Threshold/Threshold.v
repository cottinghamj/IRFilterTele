module kernel_Threshold(
    input_S1,
    avail_S1,
    read_S1,
    input_S2,
    avail_S2,
    read_S2,
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
    input wire signed [31:0] input_S1;
    input wire avail_S1;
    output wire read_S1;
    input wire signed [31:0] input_S2;
    input wire avail_S2;
    output wire read_S2;
    output wire [15:0] output_S3;
    output wire write_S3;
    input wire full_S3;
    output wire [15:0] output_S4;
    output wire write_S4;
    input wire full_S4;
    output reg running;
    input wire rst;
    input wire clk;
    reg signed [31:0] state_S5;
    reg signed [31:0] state_S6;
    reg signed [31:0] temp336;
    reg signed [31:0] temp337;
    reg [15:0] temp338;
    reg signed [31:0] temp339;
    reg signed [31:0] temp340;
    reg [15:0] temp341;
    reg [31:0] state;
    reg [31:0] last_state;
    reg sp_ftoi32x1_start;
    reg [31:0] sp_ftoi32x1_0;
    wire [31:0] sp_ftoi32x1_result;
    wire sp_ftoi32x1_ready;
    sp_ftoi32 #(.WIDTH(32)) sp_ftoi32x1(clk,
            sp_ftoi32x1_start,
            sp_ftoi32x1_0,
            sp_ftoi32x1_result, sp_ftoi32x1_ready);


    always @(*) begin
        sp_ftoi32x1_start <= 0;
        sp_ftoi32x1_0 <= 1'bx;
        if (state == 4) begin
            sp_ftoi32x1_start <= last_state != state;
            sp_ftoi32x1_0 <= temp336;
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
        if (state == 3) begin
            sp_addF32x0_start <= last_state != state;
            sp_addF32x0_0 <= state_S5;
            sp_addF32x0_1 <= temp340;
        end
    end

    reg sp_mulF32x1_start;
    reg [31:0] sp_mulF32x1_0;
    reg [31:0] sp_mulF32x1_1;
    wire [31:0] sp_mulF32x1_result;
    wire sp_mulF32x1_ready;
    sp_mulF32 #(.WIDTH(32)) sp_mulF32x1(clk,
            sp_mulF32x1_start,
            sp_mulF32x1_0,
            sp_mulF32x1_1,
            sp_mulF32x1_result, sp_mulF32x1_ready);


    always @(*) begin
        sp_mulF32x1_start <= 0;
        sp_mulF32x1_0 <= 1'bx;
        sp_mulF32x1_1 <= 1'bx;
        if (state == 2) begin
            sp_mulF32x1_start <= last_state != state;
            sp_mulF32x1_0 <= 1069547520;
            sp_mulF32x1_1 <= state_S6;
        end
    end

    reg sp_ftoi32x0_start;
    reg [31:0] sp_ftoi32x0_0;
    wire [31:0] sp_ftoi32x0_result;
    wire sp_ftoi32x0_ready;
    sp_ftoi32 #(.WIDTH(32)) sp_ftoi32x0(clk,
            sp_ftoi32x0_start,
            sp_ftoi32x0_0,
            sp_ftoi32x0_result, sp_ftoi32x0_ready);


    always @(*) begin
        sp_ftoi32x0_start <= 0;
        sp_ftoi32x0_0 <= 1'bx;
        if (state == 4) begin
            sp_ftoi32x0_start <= last_state != state;
            sp_ftoi32x0_0 <= temp339;
        end
    end

    reg sp_addF32x1_start;
    reg [31:0] sp_addF32x1_0;
    reg [31:0] sp_addF32x1_1;
    wire [31:0] sp_addF32x1_result;
    wire sp_addF32x1_ready;
    sp_addF32 #(.WIDTH(32)) sp_addF32x1(clk,
            sp_addF32x1_start,
            sp_addF32x1_0,
            sp_addF32x1_1,
            sp_addF32x1_result, sp_addF32x1_ready);


    always @(*) begin
        sp_addF32x1_start <= 0;
        sp_addF32x1_0 <= 1'bx;
        sp_addF32x1_1 <= 1'bx;
        if (state == 3) begin
            sp_addF32x1_start <= last_state != state;
            sp_addF32x1_0 <= state_S5;
            sp_addF32x1_1 <= temp337;
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
        if (state == 2) begin
            sp_mulF32x0_start <= last_state != state;
            sp_mulF32x0_0 <= 1073741824;
            sp_mulF32x0_1 <= state_S6;
        end
    end

    wire guard_2 = (last_state == state) & sp_mulF32x0_ready & sp_mulF32x1_ready;
    wire guard_5 = !full_S4 & !full_S3;
    wire guard_4 = (last_state == state) & sp_ftoi32x0_ready & sp_ftoi32x1_ready;
    wire guard_1 = avail_S1 & avail_S2;
    wire guard_3 = (last_state == state) & sp_addF32x0_ready & sp_addF32x1_ready;
    assign read_S1 = ((state == 1) & guard_1);
    assign read_S2 = ((state == 1) & guard_1);
    assign write_S4 = ((state == 5) & guard_5);
    assign output_S4 = temp341;
    assign write_S3 = ((state == 5) & guard_5);
    assign output_S3 = temp338;


    always @(posedge clk) begin
        if (rst) begin
            temp340 <= 0;
            state_S6 <= 0;
            temp336 <= 0;
            temp341 <= 0;
            temp339 <= 0;
            temp338 <= 0;
            state_S5 <= 0;
            temp337 <= 0;
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
                    // S6 <- input1
                    state_S6 <= input_S2;
                    // goto 2
                    state <= 2;
                end else begin
                    running <= avail_S1 | avail_S2;
                end
            end
            if (state == 2) begin
                if (guard_2) begin
                    // temp340 <- 2.0 * S6
                    temp340 <= sp_mulF32x0_result;
                    // temp337 <- 1.5 * S6
                    temp337 <= sp_mulF32x1_result;
                    // goto 3
                    state <= 3;
                end else begin
                end
            end
            if (state == 3) begin
                if (guard_3) begin
                    // temp339 <- S5 + temp340
                    temp339 <= sp_addF32x0_result;
                    // temp336 <- S5 + temp337
                    temp336 <= sp_addF32x1_result;
                    // goto 4
                    state <= 4;
                end else begin
                end
            end
            if (state == 4) begin
                if (guard_4) begin
                    // temp341 <- convert temp339
                    temp341 <= sp_ftoi32x0_result;
                    // temp338 <- convert temp336
                    temp338 <= sp_ftoi32x1_result;
                    // goto 5
                    state <= 5;
                end else begin
                end
            end
            if (state == 5) begin
                if (guard_5) begin
                    // output1 <- temp341
                    // output0 <- temp338
                    // goto 6
                    state <= 1;
                end else begin
                end
            end
            // goto 1
        end
    end
endmodule
