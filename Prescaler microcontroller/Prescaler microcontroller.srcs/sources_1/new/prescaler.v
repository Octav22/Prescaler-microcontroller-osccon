module prescaler(
    input clk,
    input [1:0] sel,
    input rst_n,
    output out
    );
    
    wire decoder_0_out01;
    wire decoder_0_out10;
    wire decoder_0_out11;
    
     decoder decoder_0(
        .sel(sel),
        .out01(decoder_0_out01),
        .out10(decoder_0_out10),
        .out11(decoder_0_out11)
    );
    
    wire freq_div_x2_out;
    
    freq_div freq_div_x2(
        .clk(clk),
        .en(decoder_0_out01),
        .rst_n(rst_n),
        .out(freq_div_x2_out)
    );
    
    wire freq_div_x4_out;
    
    freq_div #(.x(2)) freq_div_x4(
        .clk(clk),
        .en(decoder_0_out10),
        .rst_n(rst_n),
        .out(freq_div_x4_out)
    );
    
    wire freq_div_x8_out;
    
    freq_div #(.x(3)) freq_div_x8(
        .clk(clk),
        .en(decoder_0_out11),
        .rst_n(rst_n),
        .out(freq_div_x8_out)
    );
   
    mux mux_0(
        .in0(clk),
        .in1(freq_div_x2_out),
        .in2(freq_div_x4_out),
        .in3(freq_div_x8_out),
        .sel(sel),
        .out(out)
    );
    
endmodule
