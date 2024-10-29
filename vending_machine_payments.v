`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 11:03:51 PM
// Design Name: 
// Module Name: HW3_VM_payments
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


module HW3_VM_payments(
clk,
reset,
item_price,
dispense_row,
dispense_col,
nickel,
dime,
quarter,
half_dollar,
dollar,
change,
dispense_row_final,
dispense_col_final,
dispense_item,
total_money);

input clk;
input reset;
input [11:0]item_price;
input [3:0]dispense_row;
input [3:0]dispense_col;
input nickel;
input dime;
input quarter;
input half_dollar;
input dollar;


output reg [11:0]change;
output reg [3:0]dispense_row_final;
output reg [3:0]dispense_col_final;
output reg dispense_item;
output reg [11:0]total_money=0;

always@(posedge clk or reset)
begin

if(dispense_item==0 && dispense_row>0 && dispense_col>0)
    total_money <= total_money + (5*nickel) + (10*dime) + (25*quarter) + (50*half_dollar) + (100*dollar);
else
begin
    total_money=0;
    change=0;
end
    
if(reset==1)
begin
dispense_item=0;
dispense_row_final=0;
dispense_col_final=0;
total_money=0;
    
if(total_money>0 && dispense_row>0 && dispense_col>0 )
begin
    change=total_money;
end
end
else
    begin
    if(dispense_row>0 && dispense_col>0 )
    begin
    total_money <= total_money + (5*nickel) + (10*dime) + (25*quarter) + (50*half_dollar) + (100*dollar);
    end
    dispense_item=0;
    dispense_row_final=0;
    dispense_col_final=0;
        if(total_money >= item_price && dispense_row>0 && dispense_col>0 )
            begin
                dispense_row_final=dispense_row;
                dispense_col_final=dispense_col;
                change = total_money - item_price;
                dispense_item=1; 
            end    
    end
end
endmodule

