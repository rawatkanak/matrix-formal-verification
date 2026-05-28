module matrix_mul (
    input logic clk,
    input logic rst,

    input logic start,

    input logic [7:0] a00, a01,
    input logic [7:0] a10, a11,

    input logic [7:0] b00, b01,
    input logic [7:0] b10, b11,

    output logic done,

    output logic [15:0] c00, c01,
    output logic [15:0] c10, c11
);

typedef enum logic [1:0] {
    IDLE,
    COMPUTE,
    DONE
} state_t;

state_t state;

logic [15:0] temp_c00;
logic [15:0] temp_c01;
logic [15:0] temp_c10;
logic [15:0] temp_c11;

always_ff @(posedge clk) begin

    if (rst) begin

        state <= IDLE;

        done <= 0;

        c00 <= 0;
        c01 <= 0;
        c10 <= 0;
        c11 <= 0;

    end
    else begin

        case(state)

            IDLE: begin

                done <= 0;

                if (start) begin

                    temp_c00 <= (a00*b00) + (a01*b10);
                    temp_c01 <= (a00*b01) + (a01*b11);

                    temp_c10 <= (a10*b00) + (a11*b10);
                    temp_c11 <= (a10*b01) + (a11*b11);

                    state <= COMPUTE;
                end
            end

            COMPUTE: begin

                c00 <= temp_c00;
                c01 <= temp_c01;

                c10 <= temp_c10;
                c11 <= temp_c11;

                state <= DONE;
            end

            DONE: begin

                done <= 1;
                state <= IDLE;
            end

        endcase

    end

end

endmodule