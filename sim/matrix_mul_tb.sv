`timescale 1ns/1ps

module matrix_mul_tb;

    reg clk;
    reg rst;

    reg valid_in;

    reg [7:0] a00, a01, a10, a11;
    reg [7:0] b00, b01, b10, b11;

    wire valid_out;

    wire [15:0] c00, c01, c10, c11;

    // DUT
    matrix_mul dut (
        .clk(clk),
        .rst(rst),
        .valid_in(valid_in),

        .a00(a00),
        .a01(a01),
        .a10(a10),
        .a11(a11),

        .b00(b00),
        .b01(b01),
        .b10(b10),
        .b11(b11),

        .valid_out(valid_out),

        .c00(c00),
        .c01(c01),
        .c10(c10),
        .c11(c11)
    );

    // CLOCK GENERATION
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // WAVEFORM DUMP
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, matrix_mul_tb);
    end

    // TEST
    initial begin

        // RESET
        rst = 1;
        valid_in = 0;

        a00 = 0;
        a01 = 0;
        a10 = 0;
        a11 = 0;

        b00 = 0;
        b01 = 0;
        b10 = 0;
        b11 = 0;

        #20;

        rst = 0;

        // MATRIX INPUTS
        // A =
        // [1 2]
        // [3 4]

        // B =
        // [5 6]
        // [7 8]

        @(posedge clk);

        valid_in = 1;

        a00 = 1;
        a01 = 2;
        a10 = 3;
        a11 = 4;

        b00 = 5;
        b01 = 6;
        b10 = 7;
        b11 = 8;

        @(posedge clk);

        valid_in = 0;

        // WAIT FOR PIPELINE
        repeat(5) @(posedge clk);

        // DISPLAY OUTPUTS
        $display("C00 = %d", c00);
        $display("C01 = %d", c01);
        $display("C10 = %d", c10);
        $display("C11 = %d", c11);

        #20;

        $finish;
    end

endmodule