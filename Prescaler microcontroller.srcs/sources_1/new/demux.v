module demux #(parameter [2:0] N=1)(
    input [N-1:0] in,
    input sel,
    output reg  [N-1:0] out0,
    output reg  [N-1:0] out1
);

always@(*)
    begin
        case(sel)
            0:
                begin
                    out0=in;
                    out1=0;
                end
            1:
                begin
                    out0=0;
                    out1=in;
                end
        endcase
    end
endmodule