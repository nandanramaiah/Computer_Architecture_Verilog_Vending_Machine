`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 07:48:34 PM
// Design Name: 
// Module Name: HW3_VM_change_maker
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

//`include "HW3_VM_parameters.vh"

module HW3_VM_change_maker(
clk,
reset,
change,
flag_dollar,
flag_half_dollar,
flag_quarter,
flag_dime,
flag_nickel,
local_change,
flag_once,
change_dollar,
change_half_dollar,
change_quarter,
change_dime,
change_nickel);

input [11:0]change;
input clk;
input reset;
input flag_dollar;
input flag_half_dollar;
input flag_quarter;
input flag_dime;
input flag_nickel;
input flag_once;

output reg [11:0]local_change;


output reg change_dollar;
output reg change_half_dollar;
output reg change_quarter;
output reg change_dime;
output reg change_nickel;
                       
always@(posedge clk or reset)
if(reset && local_change==0)
begin
    change_dollar      =0;
    change_half_dollar =0;
    change_quarter     =0;
    change_dime        =0;
    change_nickel      =0;
end
else
begin
        if(flag_once==1)
            begin
                local_change = change;
            end
        change_dollar      =0;
        change_half_dollar =0;
        change_quarter     =0;
        change_dime        =0;
        change_nickel      =0;
        if     (local_change >= 100   && flag_dollar == 1)
            begin
                local_change       <= local_change - 100;
                change_dollar      <= 1;
            end
        else if(local_change >= 50 && flag_half_dollar > 0)
            begin
                local_change       <= local_change - 50;
                change_half_dollar <= 1;
            end 
        else if(local_change >= 25 && flag_quarter > 0)
            begin
                local_change       <= local_change - 25;
                change_quarter     <= 1;
            end
        else if(local_change >= 10  && flag_dime > 0)
            begin
                local_change       <= local_change - 10;
                change_dime        <= 1;
            end   
        else if(local_change >= 5 && flag_nickel > 0)
            begin
                local_change       <= local_change  - 5;
                change_nickel      <= 1;
            end
end
endmodule
