module wrap0(
    input wire clk,
    input wire rst,
    output wire running
    , input wire [15:0] din1
    , input wire write1
    , output wire full1
    , output wire [15:0] dout15
    , input wire read15
    , output wire avail15
);

    wire [15:0] data1;
    wire do_write1 = !full1 && write1;
    assign data1[7:0] = din1[15:8];
    assign data1[15:8] = din1[7:0];

    wire [15:0] data15;
    wire do_read15 = avail15 && read15;
    assign dout15[7:0] = data15[15:8];
    assign dout15[15:8] = data15[7:0];

    wire [26:0] ram_addr;
    wire [127:0] ram_data_to_main;
    wire [127:0] ram_data_from_main;
    wire [15:0] ram_mask;
    wire ram_re;
    wire ram_we;
    wire ram_ready;
    sp_ram #(
        .WIDTH(128),
        .DEPTH(6607),
        .ADDR_WIDTH(27)
    ) ram (
        .clk(clk),
        .rst(rst),
        .addr(ram_addr),
        .din(ram_data_to_main),
        .dout(ram_data_from_main),
        .mask(ram_mask),
        .re(ram_re),
        .we(ram_we),
        .ready(ram_ready)
    );
    fpga0 sp(.clk(clk), .rst(rst), .running(running)
        , .ram_addr(ram_addr)
        , .ram_data_from_main(ram_data_from_main)
        , .ram_data_to_main(ram_data_to_main)
        , .ram_mask(ram_mask)
        , .ram_re(ram_re)
        , .ram_we(ram_we)
        , .ram_ready(ram_ready)
        , .input1_data(data1)
        , .input1_write(do_write1)
        , .input1_full(full1)
        , .output15_data(data15)
        , .output15_avail(avail15)
        , .output15_read(do_read15)
    );

endmodule

