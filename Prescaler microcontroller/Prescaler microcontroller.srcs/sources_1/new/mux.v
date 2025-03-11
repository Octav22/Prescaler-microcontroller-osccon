module mux(
    input in0,
    input in1,
    input in2,
    input in3,
    input [1:0] sel,
    output reg out
    );
    always@(*)
        begin
            case(sel)
                0: 
                    out=in0;
                1:
                    out=in1;
                2: 
                    out=in2;
                3: 
                    out=in3;
                default:
                    out=0;
            endcase      
        end 
        
endmodule
