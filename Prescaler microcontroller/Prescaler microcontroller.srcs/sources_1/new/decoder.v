module decoder(
    input [1:0] sel,
    output reg out01,
    output reg out10,
    output reg out11
    );
    
    always@(*)
        begin
            case(sel)
                2'd0:
                    begin
                        out01=0;
                        out10=0;
                        out11=0;
                     end   
                2'd1:
                 begin
                     out01=1;
                     out10=0;
                     out11=0;
                  end   
                  
                2'd2:
                begin
                    out01=0;
                    out10=1;
                    out11=0;
                 end   
                 
                2'd3:
                begin
                    out01=0;
                    out10=0;
                    out11=1;
                 end       
                        
            endcase
        end
endmodule
