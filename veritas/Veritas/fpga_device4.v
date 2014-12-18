module fpga0(
    input wire clk,
    input wire rst,
    output wire [26:0] ram_addr,
    input wire [127:0] ram_data_from_main,
    output wire [127:0] ram_data_to_main,
    output wire [15:0] ram_mask,
    output wire ram_re,
    output wire ram_we,
    input wire ram_full,
    input wire ram_avail,
    input wire ram_ready,
    input wire [15:0] input1_data,
    input wire input1_write,
    output wire input1_full,
    output wire [15:0] output15_data,
    output wire output15_avail,
    input wire output15_read,
    output wire running
);

    wire [15:0] edge1_dout;
    wire [15:0] edge1_din;
    wire edge1_avail;
    wire edge1_read;
    wire edge1_write;
    wire edge1_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge1(
            .clk(clk),
            .rst(rst),
            .din(edge1_din),
            .dout(edge1_dout),
            .re(edge1_read),
            .we(edge1_write),
            .avail(edge1_avail),
            .full(edge1_full)
        );
    assign edge1_din = input1_data;
    assign edge1_write = input1_write;
    assign input1_full = edge1_full;

    wire [15:0] edge15_dout;
    wire [15:0] edge15_din;
    wire edge15_avail;
    wire edge15_read;
    wire edge15_write;
    wire edge15_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge15(
            .clk(clk),
            .rst(rst),
            .din(edge15_din),
            .dout(edge15_dout),
            .re(edge15_read),
            .we(edge15_write),
            .avail(edge15_avail),
            .full(edge15_full)
        );
    assign output15_data = edge15_dout;
    assign output15_avail = edge15_avail;
    assign edge15_read = output15_read;

    wire [31:0] edge8_dout;
    wire [31:0] edge8_din;
    wire edge8_avail;
    wire edge8_read;
    wire edge8_write;
    wire edge8_full;
    sp_fifo #(.WIDTH(32), .DEPTH(1))
        fifo_edge8(
            .clk(clk),
            .rst(rst),
            .din(edge8_din),
            .dout(edge8_dout),
            .re(edge8_read),
            .we(edge8_write),
            .avail(edge8_avail),
            .full(edge8_full)
        );

    wire [15:0] edge3_dout;
    wire [15:0] edge3_din;
    wire edge3_avail;
    wire edge3_read;
    wire edge3_write;
    wire edge3_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge3(
            .clk(clk),
            .rst(rst),
            .din(edge3_din),
            .dout(edge3_dout),
            .re(edge3_read),
            .we(edge3_write),
            .avail(edge3_avail),
            .full(edge3_full)
        );

    wire [31:0] edge5_dout;
    wire [31:0] edge5_din;
    wire edge5_avail;
    wire edge5_read;
    wire edge5_write;
    wire edge5_full;
    sp_fifo #(.WIDTH(32), .DEPTH(1))
        fifo_edge5(
            .clk(clk),
            .rst(rst),
            .din(edge5_din),
            .dout(edge5_dout),
            .re(edge5_read),
            .we(edge5_write),
            .avail(edge5_avail),
            .full(edge5_full)
        );

    wire [15:0] edge12_dout;
    wire [15:0] edge12_din;
    wire edge12_avail;
    wire edge12_read;
    wire edge12_write;
    wire edge12_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge12(
            .clk(clk),
            .rst(rst),
            .din(edge12_din),
            .dout(edge12_dout),
            .re(edge12_read),
            .we(edge12_write),
            .avail(edge12_avail),
            .full(edge12_full)
        );

    wire [31:0] edge4_dout;
    wire [31:0] edge4_din;
    wire edge4_avail;
    wire edge4_read;
    wire edge4_write;
    wire edge4_full;
    sp_fifo #(.WIDTH(32), .DEPTH(1))
        fifo_edge4(
            .clk(clk),
            .rst(rst),
            .din(edge4_din),
            .dout(edge4_dout),
            .re(edge4_read),
            .we(edge4_write),
            .avail(edge4_avail),
            .full(edge4_full)
        );

    wire [15:0] edge6_dout;
    wire [15:0] edge6_din;
    wire edge6_avail;
    wire edge6_read;
    wire edge6_write;
    wire edge6_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge6(
            .clk(clk),
            .rst(rst),
            .din(edge6_din),
            .dout(edge6_dout),
            .re(edge6_read),
            .we(edge6_write),
            .avail(edge6_avail),
            .full(edge6_full)
        );

    wire [31:0] edge7_dout;
    wire [31:0] edge7_din;
    wire edge7_avail;
    wire edge7_read;
    wire edge7_write;
    wire edge7_full;
    sp_fifo #(.WIDTH(32), .DEPTH(1))
        fifo_edge7(
            .clk(clk),
            .rst(rst),
            .din(edge7_din),
            .dout(edge7_dout),
            .re(edge7_read),
            .we(edge7_write),
            .avail(edge7_avail),
            .full(edge7_full)
        );

    wire [15:0] edge13_dout;
    wire [15:0] edge13_din;
    wire edge13_avail;
    wire edge13_read;
    wire edge13_write;
    wire edge13_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge13(
            .clk(clk),
            .rst(rst),
            .din(edge13_din),
            .dout(edge13_dout),
            .re(edge13_read),
            .we(edge13_write),
            .avail(edge13_avail),
            .full(edge13_full)
        );

    wire [15:0] edge14_dout;
    wire [15:0] edge14_din;
    wire edge14_avail;
    wire edge14_read;
    wire edge14_write;
    wire edge14_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge14(
            .clk(clk),
            .rst(rst),
            .din(edge14_din),
            .dout(edge14_dout),
            .re(edge14_read),
            .we(edge14_write),
            .avail(edge14_avail),
            .full(edge14_full)
        );

    wire [15:0] edge9_dout;
    wire [15:0] edge9_din;
    wire edge9_avail;
    wire edge9_read;
    wire edge9_write;
    wire edge9_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge9(
            .clk(clk),
            .rst(rst),
            .din(edge9_din),
            .dout(edge9_dout),
            .re(edge9_read),
            .we(edge9_write),
            .avail(edge9_avail),
            .full(edge9_full)
        );

    wire [15:0] edge11_dout;
    wire [15:0] edge11_din;
    wire edge11_avail;
    wire edge11_read;
    wire edge11_write;
    wire edge11_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge11(
            .clk(clk),
            .rst(rst),
            .din(edge11_din),
            .dout(edge11_dout),
            .re(edge11_read),
            .we(edge11_write),
            .avail(edge11_avail),
            .full(edge11_full)
        );

    wire [15:0] edge2_dout;
    wire [15:0] edge2_din;
    wire edge2_avail;
    wire edge2_read;
    wire edge2_write;
    wire edge2_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge2(
            .clk(clk),
            .rst(rst),
            .din(edge2_din),
            .dout(edge2_dout),
            .re(edge2_read),
            .we(edge2_write),
            .avail(edge2_avail),
            .full(edge2_full)
        );

    wire [15:0] edge10_dout;
    wire [15:0] edge10_din;
    wire edge10_avail;
    wire edge10_read;
    wire edge10_write;
    wire edge10_full;
    sp_fifo #(.WIDTH(16), .DEPTH(1))
        fifo_edge10(
            .clk(clk),
            .rst(rst),
            .din(edge10_din),
            .dout(edge10_dout),
            .re(edge10_read),
            .we(edge10_write),
            .avail(edge10_avail),
            .full(edge10_full)
        );

    wire instance2_running;
    kernel_Dup3
        instance2(
            .clk(clk), .rst(rst),
            .running(instance2_running)
            , .input_S1(edge1_dout)
            , .avail_S1(edge1_avail)
            , .read_S1(edge1_read)
            , .output_S2(edge2_din)
            , .write_S2(edge2_write)
            , .full_S2(edge2_full)
            , .output_S3(edge3_din)
            , .write_S3(edge3_write)
            , .full_S3(edge3_full)
            , .output_S4(edge6_din)
            , .write_S4(edge6_write)
            , .full_S4(edge6_full)
        );

    wire instance3_running;
    kernel_BorderExtInput
        instance3(
            .clk(clk), .rst(rst),
            .running(instance3_running)
            , .input_S1(edge2_dout)
            , .avail_S1(edge2_avail)
            , .read_S1(edge2_read)
            , .output_S2(edge11_din)
            , .write_S2(edge11_write)
            , .full_S2(edge11_full)
        );

    wire [29:0] ram_instance4_addr;
    wire [31:0] ram_instance4_in;
    wire [31:0] ram_instance4_out;
    wire [3:0] ram_instance4_mask;
    wire ram_instance4_re;
    wire ram_instance4_we;
    wire ram_instance4_ready;
    wire instance4_running;
    kernel_Mean
        instance4(
            .clk(clk), .rst(rst),
            .running(instance4_running)
            , .input_S1(edge3_dout)
            , .avail_S1(edge3_avail)
            , .read_S1(edge3_read)
            , .output_S2(edge4_din)
            , .write_S2(edge4_write)
            , .full_S2(edge4_full)
            , .ram_addr(ram_instance4_addr)
            , .ram_in(ram_instance4_out)
            , .ram_out(ram_instance4_in)
            , .ram_mask(ram_instance4_mask)
            , .ram_re(ram_instance4_re)
            , .ram_we(ram_instance4_we)
            , .ram_ready(ram_instance4_ready)
        );
    sp_ram #(.WIDTH(32), .DEPTH(1600), .ADDR_WIDTH(30))
        ram_instance4 (
            .clk(clk),
            .rst(rst),
            .addr(ram_instance4_addr),
            .din(ram_instance4_in),
            .dout(ram_instance4_out),
            .mask(ram_instance4_mask),
            .re(ram_instance4_re),
            .we(ram_instance4_we),
            .ready(ram_instance4_ready)
        );

    wire instance5_running;
    kernel_Dup2
        instance5(
            .clk(clk), .rst(rst),
            .running(instance5_running)
            , .input_S1(edge4_dout)
            , .avail_S1(edge4_avail)
            , .read_S1(edge4_read)
            , .output_S2(edge5_din)
            , .write_S2(edge5_write)
            , .full_S2(edge5_full)
            , .output_S3(edge7_din)
            , .write_S3(edge7_write)
            , .full_S3(edge7_full)
        );

    wire [29:0] ram_instance6_addr;
    wire [31:0] ram_instance6_in;
    wire [31:0] ram_instance6_out;
    wire [3:0] ram_instance6_mask;
    wire ram_instance6_re;
    wire ram_instance6_we;
    wire ram_instance6_ready;
    wire instance6_running;
    kernel_StdDev
        instance6(
            .clk(clk), .rst(rst),
            .running(instance6_running)
            , .input_S1(edge5_dout)
            , .avail_S1(edge5_avail)
            , .read_S1(edge5_read)
            , .input_S2(edge6_dout)
            , .avail_S2(edge6_avail)
            , .read_S2(edge6_read)
            , .output_S3(edge8_din)
            , .write_S3(edge8_write)
            , .full_S3(edge8_full)
            , .ram_addr(ram_instance6_addr)
            , .ram_in(ram_instance6_out)
            , .ram_out(ram_instance6_in)
            , .ram_mask(ram_instance6_mask)
            , .ram_re(ram_instance6_re)
            , .ram_we(ram_instance6_we)
            , .ram_ready(ram_instance6_ready)
        );
    sp_ram #(.WIDTH(32), .DEPTH(3200), .ADDR_WIDTH(30))
        ram_instance6 (
            .clk(clk),
            .rst(rst),
            .addr(ram_instance6_addr),
            .din(ram_instance6_in),
            .dout(ram_instance6_out),
            .mask(ram_instance6_mask),
            .re(ram_instance6_re),
            .we(ram_instance6_we),
            .ready(ram_instance6_ready)
        );

    wire instance7_running;
    kernel_Threshold
        instance7(
            .clk(clk), .rst(rst),
            .running(instance7_running)
            , .input_S1(edge7_dout)
            , .avail_S1(edge7_avail)
            , .read_S1(edge7_read)
            , .input_S2(edge8_dout)
            , .avail_S2(edge8_avail)
            , .read_S2(edge8_read)
            , .output_S3(edge9_din)
            , .write_S3(edge9_write)
            , .full_S3(edge9_full)
            , .output_S4(edge10_din)
            , .write_S4(edge10_write)
            , .full_S4(edge10_full)
        );

    wire instance8_running;
    kernel_BorderExtLoThreshold
        instance8(
            .clk(clk), .rst(rst),
            .running(instance8_running)
            , .input_S1(edge9_dout)
            , .avail_S1(edge9_avail)
            , .read_S1(edge9_read)
            , .output_S2(edge12_din)
            , .write_S2(edge12_write)
            , .full_S2(edge12_full)
        );

    wire instance9_running;
    kernel_BorderExtHiThreshold
        instance9(
            .clk(clk), .rst(rst),
            .running(instance9_running)
            , .input_S1(edge10_dout)
            , .avail_S1(edge10_avail)
            , .read_S1(edge10_read)
            , .output_S2(edge13_din)
            , .write_S2(edge13_write)
            , .full_S2(edge13_full)
        );

    wire [29:0] ram_instance10_addr;
    wire [31:0] ram_instance10_in;
    wire [31:0] ram_instance10_out;
    wire [3:0] ram_instance10_mask;
    wire ram_instance10_re;
    wire ram_instance10_we;
    wire ram_instance10_ready;
    wire instance10_running;
    kernel_PrimaryFilter
        #(.outputCount(1), .width(40), .height(40))
        instance10(
            .clk(clk), .rst(rst),
            .running(instance10_running)
            , .input_pixelIn(edge11_dout)
            , .avail_pixelIn(edge11_avail)
            , .read_pixelIn(edge11_read)
            , .input_lowThreshIn(edge12_dout)
            , .avail_lowThreshIn(edge12_avail)
            , .read_lowThreshIn(edge12_read)
            , .input_highThreshIn(edge13_dout)
            , .avail_highThreshIn(edge13_avail)
            , .read_highThreshIn(edge13_read)
            , .output_pixelOut(edge14_din)
            , .write_pixelOut(edge14_write)
            , .full_pixelOut(edge14_full)
            , .ram_addr(ram_instance10_addr)
            , .ram_in(ram_instance10_out)
            , .ram_out(ram_instance10_in)
            , .ram_mask(ram_instance10_mask)
            , .ram_re(ram_instance10_re)
            , .ram_we(ram_instance10_we)
            , .ram_ready(ram_instance10_ready)
        );
    sp_ram #(.WIDTH(32), .DEPTH(1807), .ADDR_WIDTH(30))
        ram_instance10 (
            .clk(clk),
            .rst(rst),
            .addr(ram_instance10_addr),
            .din(ram_instance10_in),
            .dout(ram_instance10_out),
            .mask(ram_instance10_mask),
            .re(ram_instance10_re),
            .we(ram_instance10_we),
            .ready(ram_instance10_ready)
        );

    wire instance11_running;
    kernel_RunLengthEncode
        instance11(
            .clk(clk), .rst(rst),
            .running(instance11_running)
            , .input_S1(edge14_dout)
            , .avail_S1(edge14_avail)
            , .read_S1(edge14_read)
            , .output_S2(edge15_din)
            , .write_S2(edge15_write)
            , .full_S2(edge15_full)
        );

    assign running = instance2_running|instance3_running|instance4_running|instance5_running|instance6_running|instance7_running|instance8_running|instance9_running|instance10_running|instance11_running|ram_full;
    assign ram_addr = 1'bx;
    assign ram_din = 1'bx;
    assign ram_re = 1'b0;
    assign ram_we = 1'b0;
    assign ram_mask = 1'bx;
endmodule

