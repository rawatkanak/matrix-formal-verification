module matrix_mul_formal;

logic clk;
logic rst;
logic start;

logic [7:0] a00, a01, a10, a11;
logic [7:0] b00, b01, b10, b11;

logic done;

logic [15:0] c00, c01, c10, c11;

matrix_mul dut (

    .clk(clk),
    .rst(rst),

    .start(start),

    .a00(a00),
    .a01(a01),
    .a10(a10),
    .a11(a11),

    .b00(b00),
    .b01(b01),
    .b10(b10),
    .b11(b11),

    .done(done),

    .c00(c00),
    .c01(c01),
    .c10(c10),
    .c11(c11)
);

always #1 clk = ~clk;

initial begin
    clk = 0;
end

always_ff @(posedge clk) begin

    if (done) begin

        assert(c00 == ((a00*b00)+(a01*b10)));
        assert(c01 == ((a00*b01)+(a01*b11)));

        assert(c10 == ((a10*b00)+(a11*b10)));
        assert(c11 == ((a10*b01)+(a11*b11)));

    end

end

endmodule