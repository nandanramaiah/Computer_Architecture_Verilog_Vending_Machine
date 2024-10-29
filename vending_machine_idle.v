`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2024 11:47:20 AM
// Design Name: 
// Module Name: HW3_VM_idle
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HW3_VM_idle(
clk,
reset,
row_in,
col_in,
row_out,
col_out);

input clk;
input reset;
input [3:0] row_in=0;
input [3:0] col_in=0;

output reg [3:0] row_out;
output reg [3:0] col_out;

always@(posedge clk or reset)
if(reset==1)
    begin
        row_out=0;
        col_out=0;
    end
else
    begin
        if(row_in>0 && col_in>0)
            begin
                row_out=row_in;
                col_out=col_in;
            end
        else
            begin
                row_out=0;
                col_out=0;
            end
    end
endmodule
