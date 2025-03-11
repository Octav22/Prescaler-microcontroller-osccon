module ram_instr(
    input [3:0] rd_addr,
    input save,
    input [3:0] wr_data,
    input [3:0] wr_addr,
    output [3:0] rd_data
    );
    
reg [3:0] memorie_efectiva [0:15];

assign rd_data = memorie_efectiva[rd_addr];


always@(*)
    begin
        if(save)
            begin
                memorie_efectiva[wr_addr]=wr_data;
            end
    end
endmodule
