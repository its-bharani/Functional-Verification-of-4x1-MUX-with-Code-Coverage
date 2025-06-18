module mux4x1(input [3:0]din,
        input [1:0]sel,
        output reg out);

always@(*)
begin
        case(sel)
                2'b00: out<=din[0];
                2'b01: out<=din[1];
                2'b10: out<=din[2];
                2'b11: out<=din[3];
                default: out<=1'bz;

        endcase
end
endmodule
