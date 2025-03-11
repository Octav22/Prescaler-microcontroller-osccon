module osccon_reg(
    input clk,
    input save,
    input [3:0] data,
    input rst_n,
    output reg [1:0] out
    );

reg [3:0] data_saved;

always@(posedge clk)
    begin
        if(rst_n==0)
            data_saved<=0;
        else 
        begin  
            if(save)
                data_saved<=data;
            out<=data_saved[1:0]; 
        end 
    end 
endmodule
