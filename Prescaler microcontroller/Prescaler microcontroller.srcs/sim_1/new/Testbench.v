`timescale 1ns / 1ps

module Testbench(
    );
    
reg clk;
reg rst_n;
reg save_n;
reg sel;
reg [3:0] data;
reg [3:0] wr_addr;
wire [3:0] instructions;
    
    
Top dut(
    .clk(clk),
    .rst_n(rst_n),
    .save_n(save_n),
    .sel(sel),
    .data(data),
    .wr_addr(wr_addr),
    .instructions(instructions)
);
    
initial
    begin
        clk=1;
        forever
            begin
                #5 clk=~clk;
            end
    end    
    
 initial
     begin
     rst_n <= 1;
     #30 rst_n <= 0;
     #40 rst_n <= 1;
     end
     
 initial
     begin
     save_n<=1;
     #70 save_n<=0;
     #40 save_n<=1;
     #10 save_n<=0;
     #10 save_n<=1;
     end
     
 initial
     begin
     sel<=0;
     #70 sel<=1;
     #40 sel<=0;
     end

 initial
     begin
     data<=0;
     #70 data<=1;
     #10 data<=2;
     #20 data<=1;
     #10 data<=0;
     #10 data<=5;
     #10 data<=0;
     end

 initial
     begin
     wr_addr<=0;
     #80 wr_addr<=1;
     #10 wr_addr<=2;
     #10 wr_addr<=3;
     #10 wr_addr<=0;
     end

 initial 
    begin
        #230 $stop();
    end     
endmodule
