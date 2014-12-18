module sim_device4;

    reg clk;
    reg rst;
    wire running;
    integer cycles = 0;
    integer rc;

    integer streamedge1;
    integer streamedge15;

    reg active1;
    reg signed [31:0] count1;
    wire [15:0] din1;
    wire write1;
    wire full1;
    wire [15:0] dout15;
    wire read15;
    wire avail15;

    wrap0 dut(.clk(clk), .rst(rst), .running(running)
        , .din1(din1)
        , .write1(write1)
        , .full1(full1)
        , .dout15(dout15)
        , .read15(read15)
        , .avail15(avail15)
    );

    initial begin

        streamedge1 = $fopen("streamedge1", "rb");
        if(streamedge1 == 0) begin
            $display("could not open streamedge1");
            $finish;
        end
        streamedge15 = $fopen("streamedge15", "wb");
        if(streamedge15 == 0) begin
            $display("could not open streamedge15");
            $finish;
        end

        clk <= 0;
        rst <= 1;
        #10 clk <= 1; #10 clk <= 0;
        rst <= 0;

        forever begin
            #10 clk <= !clk;
        end
    end

    reg [2:0] stop_counter;
    wire stopped = stop_counter[2];
    always @(posedge clk) begin
        if (rst | active1 | running) begin
            stop_counter <= 0;
        end else begin
            stop_counter <= stop_counter + 1;
        end
    end
    always @(posedge clk) begin
        if (rst | !stopped) begin
            cycles <= cycles + 1;
            if ((cycles % 1000) == 0) begin
                $display("Cycles: %d", cycles);
            end
        end else begin
            $display("Cycles: %d", cycles);
            rc <= $fputc(0, streamedge15);
            $fflush(streamedge15);
        end
    end
    wire can_read;
    reg [15:0] fifo_in1;
    wire fifo_avail1;
    wire fifo_full1;
    reg fifo_we1;
    sp_fifo #(.WIDTH(16), .DEPTH(65536))
        input1_fifo(
            .clk(clk),
            .rst(rst),
            .din(fifo_in1),
            .dout(din1),
            .re(write1),
            .we(fifo_we1),
            .avail(fifo_avail1),
            .full(fifo_full1)
        );
    assign write1 = fifo_avail1 & !full1;
    always @(posedge clk) begin
        fifo_we1 <= 0;
        if (rst) begin
            count1 <= 0;
            active1 <= 1;
        end else if (!fifo_full1 && count1 > 0) begin
            fifo_in1[15:8] <= $fgetc(streamedge1);
            fifo_in1[7:0] <= $fgetc(streamedge1);
            fifo_we1 <= 1;
            count1 <= count1 - 1;
        end else if (count1 < 0) begin
            active1 <= fifo_avail1;
        end else if (can_read && active1) begin
            count1[7:0] <= $fgetc(streamedge1);
            count1[15:8] <= $fgetc(streamedge1);
            count1[23:16] <= $fgetc(streamedge1);
            count1[31:24] <= $fgetc(streamedge1);
        end
    end

    assign can_read = count1 <= 0;
    always @(posedge clk) begin
        if(!rst & avail15) begin
            rc <= $fputc(1, streamedge15);
            rc <= $fputc(dout15[15:8], streamedge15);
            rc <= $fputc(dout15[7:0], streamedge15);
            $fflush(streamedge15);
        end
    end
    assign read15 = !rst & avail15;

endmodule

