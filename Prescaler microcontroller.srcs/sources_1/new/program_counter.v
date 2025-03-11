module program_counter(
    input intrare,
    input rst,
    output reg [3:0] iesire
    );


always@(posedge intrare or negedge rst)
    begin
        if(rst==0)
            begin
                iesire<=0;
            end
        else 
            begin
                iesire<=iesire+1;
            end
               
    end
endmodule
