module Top(
    input clk,
    input rst_n,
    input save_n,
    input sel,
    input [3:0] data,
    input [3:0] wr_addr,
    output [3:0] instructions
    );
    
    
    wire demux2_0_out0;
    wire demux2_0_out1;

    demux demux2_0(
        .in(~save_n),
        .sel(sel),
        .out0(demux2_0_out0),
        .out1(demux2_0_out1)
    );
    
    wire [3:0] demux2_1_out0;
    wire [3:0] demux2_1_out1;
    
    demux #(.N(4)) demux2_1(
        .in(data),
        .sel(sel),
        .out0(demux2_1_out0),
        .out1(demux2_1_out1)
    );
    
     wire [1:0] osccon_reg_0_out;
     
     osccon_reg osccon_reg_0(
        .clk(clk),
        .save(demux2_0_out0),
        .data(demux2_1_out0),
        .rst_n(rst_n),
        .out(osccon_reg_0_out)
    );
    
    wire prescaler_0_out;
    
    prescaler prescaler_0(
       .clk(clk),
        .sel(osccon_reg_0_out),
        .rst_n(rst_n),
        .out(prescaler_0_out)
    );
    
    wire [3:0] program_counter_0_out;
    
    program_counter program_counter_0(
        .intrare(prescaler_0_out),
        .rst(rst_n),
        .iesire(program_counter_0_out)
    );
    
    ram_instr ram_instr_0(
        .rd_addr(program_counter_0_out),
        .save(demux2_0_out1),
        .wr_data(demux2_1_out1),
        .wr_addr(wr_addr),
        .rd_data(instructions)
    );
endmodule
