module freq_div #(parameter [1:0] x=1)(
    input clk,
    input en,
    input rst_n,
    output reg out
    );
    
reg [x-1:0] count;

always@(posedge clk)
    begin
        if(rst_n==0)
            begin
                count<=0;
                out<=0;
            end
        else
            begin
                count<=count+1;
                out<=count[x-1];
            end
    end
endmodule
