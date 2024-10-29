`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 03:10:20 PM
// Design Name: 
// Module Name: HW3_VM_selection
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


module HW3_VM_selection(
clk,
reset,
row,
col,
enter_key,
item_selection_valid,
dispense_row,
dispense_col,
item_price
);

input clk;
input reset;
input [3:0]row;
input [3:0]col;
input enter_key;

reg [11:0]item_prices [1:6][1:6];
reg [11:0]flag_item[1:6][1:6]; 
reg [3:0]total_row=6;
reg [3:0]total_col=6;

output reg item_selection_valid=0;
output reg [3:0]dispense_row=0;
output reg [3:0]dispense_col=0;
output reg [11:0]item_price=0;

initial
begin
  item_prices[1][1] = 250; item_prices[1][2] = 450; item_prices[1][3] = 560; item_prices[1][4] = 710;item_prices[1][5] = 285;item_prices[1][6] = 235;
  item_prices[2][1] = 310; item_prices[2][2] = 580; item_prices[2][3] = 235; item_prices[2][4] = 405;item_prices[2][5] = 250;item_prices[2][6] = 650;
  item_prices[3][1] = 650; item_prices[3][2] = 390; item_prices[3][3] = 595; item_prices[3][4] = 285;item_prices[3][5] = 600;item_prices[3][6] = 650;
  item_prices[4][1] = 175; item_prices[4][2] = 530; item_prices[4][3] = 340; item_prices[4][4] = 600;item_prices[4][5] = 235;item_prices[4][6] = 580;
  item_prices[5][1] = 310; item_prices[5][2] = 580; item_prices[5][3] = 235; item_prices[5][4] = 405;item_prices[5][5] = 285;item_prices[5][6] = 390;
  item_prices[6][1] = 650; item_prices[6][2] = 390; item_prices[6][3] = 595; item_prices[6][4] = 285;item_prices[6][5] = 450;item_prices[6][6] = 285;
  
  
  flag_item[1][1] = 1; flag_item[1][2] = 0; flag_item[1][3] = 1; flag_item[1][4] = 1;flag_item[1][5] = 1; flag_item[1][6] = 1;
  flag_item[2][1] = 1; flag_item[2][2] = 1; flag_item[2][3] = 0; flag_item[2][4] = 1;flag_item[2][5] = 1; flag_item[2][6] = 1;
  flag_item[3][1] = 1; flag_item[3][2] = 1; flag_item[3][3] = 1; flag_item[3][4] = 0;flag_item[3][5] = 1; flag_item[3][6] = 1;
  flag_item[4][1] = 1; flag_item[4][2] = 1; flag_item[4][3] = 1; flag_item[4][4] = 1;flag_item[4][5] = 0; flag_item[4][6] = 1;
  flag_item[5][1] = 1; flag_item[5][2] = 1; flag_item[5][3] = 1; flag_item[5][4] = 1;flag_item[5][5] = 1; flag_item[5][6] = 0;
  flag_item[6][1] = 1; flag_item[6][2] = 1; flag_item[6][3] = 1; flag_item[6][4] = 1;flag_item[6][5] = 1; flag_item[6][6] = 1;
end

always@(posedge clk or reset)
begin
if(reset)
    begin
    item_selection_valid=0;
    dispense_row=0;
    dispense_col=0;
    item_price=0;
    end
else
    begin    
    item_selection_valid=0;
    dispense_row=0;
    dispense_col=0;
    item_price=0;
    if(enter_key==1) // check for valid selection of item
            begin
                if(flag_item[row][col]==1) // check if the item is in stock
                    begin
                        item_selection_valid = 1;
                        dispense_row=row;
                        dispense_col=col;
                        item_price=item_prices[row][col];
                    end    
            end 
    end
end
endmodule
