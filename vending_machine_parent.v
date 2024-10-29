`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2024 01:25:48 PM
// Design Name: 
// Module Name: HW3_VM_parent
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


module HW3_VM_parent(
input clk,
input reset,
input [3:0]row_in,
input [3:0]col_in,
input enter_key,
//output [3:0]row_out,
//output [3:0]col_out,
input [11:0]total_money,
input flag_dollar,
input flag_half_dollar,
input flag_quarter,
input flag_dime,
input flag_nickel,
input flag_once,
input nickel,
input dime,
input quarter,
input half_dollar,
input dollar,
output [11:0]item_price,
output item_selection_valid,
output [3:0]dispense_row,
output [3:0]dispense_col,
output [11:0]change,
output [3:0]dispense_row_final,
output [3:0]dispense_col_final,
output dispense_item,
output [11:0]local_change,
output change_dollar,
output change_half_dollar,
output change_quarter,
output change_dime,
output change_nickel
);

//initialize enums
parameter IDLE=0;
parameter SELECTION=1;
parameter PAYMENT=2;
parameter CHANGE_MAKER=3;

//local signals
reg [1:0]state;
reg [1:0]next_state;

//connecting signals
wire [3:0]row_out;
wire [3:0]col_out;

//initialize modules

HW3_VM_idle idle(
.clk(clk),
.reset(reset),
.row_in(row_in),
.col_in(col_in),
.row_out(row_out),
.col_out(col_out));

HW3_VM_selection selection(
.clk(clk),
.reset(reset),
.row(row_out),
.col(col_out),
.enter_key(enter_key),
.item_selection_valid(item_selection_valid),
.dispense_row(dispense_row),
.dispense_col(dispense_col),
.item_price(item_price)
); 

HW3_VM_payments payment(
.clk(clk),
.reset(reset),
.item_price(item_price),
.nickel(nickel),
.dime(dime),
.quarter(quarter),
.half_dollar(half_dollar),
.dollar(dollar),
.dispense_row(dispense_row),
.dispense_col(dispense_col),
.change(change),
.dispense_row_final(dispense_row_final),
.dispense_col_final(dispense_col_final),
.dispense_item(dispense_item),
.total_money(total_money));

HW3_VM_change_maker change_maker(
.clk(clk),
.reset(reset),
.change(change),
.flag_dollar(flag_dollar),
.flag_half_dollar(flag_half_dollar),
.flag_quarter(flag_quarter),
.flag_dime(flag_dime),
.flag_nickel(flag_nickel),
.local_change(local_change),
.flag_once(flag_once),
.change_dollar(change_dollar),
.change_half_dollar(change_half_dollar),
.change_quarter(change_quarter),
.change_dime(change_dime),
.change_nickel(change_nickel));

//---------------------------------------------------------------------------------------------------
////reset logic
//always@(posedge clk or reset)
//begin
//    if(reset==1)
//        state=IDLE;
//     else
//        state=next_state;   
//end
//---------------------------------------------------------------------------------------------------
////statemachine
//always @* begin
//  case (state)
//    IDLE: next_state = (item_selection_valid) ? SELECTION : IDLE;
//    SELECTION: next_state = (total_money >= item_price) ? PAYMENT : SELECTION;
//    PAYMENT: next_state = CHANGE_MAKER;
//    CHANGE_MAKER: next_state = IDLE;
//    default: next_state = IDLE;
//  endcase
//end
//---------------------------------------------------------------------------------------------------
//module operationa
//always@(*)
//begin
//case(state)
//IDLE:HW3_VM_idle();

//SELECTION: HW3_VM_selection(
//.clk(clk),
//.row(row_out),
//.col(col_out),
//.enter_key(enter_key),
//.item_selection_valid(item_selection_valid),
//.dispense_row(dispense_row),
//.dispense_col(dispense_col),
//.item_price(item_price)
//); 

//PAYMENT:HW3_VM_payment(
//.clk(clk),
//.item_price(item_price),
//.total_money(total_money),
//.dispense_row(dispense_row),
//.dispense_col(dispense_col),
//.change(change),
//.dispense_row_final(dispense_row_final),
//.dispense_col_final(dispense_col_final),
//.dispense_item(dispense_item));

//CHANGE_MAKER: HW3_VM_change_maker(
//.clk(clk),
//.change(change),
//.flag_dollar(flag_dollar),
//.flag_half_dollar(flag_half_dollar),
//.flag_quarter(flag_quarter),
//.flag_dime(flag_dime),
//.flag_nickel(flag_nickel),
//.local_change(local_change),
//.flag_once(flag_once),
//.change_dollar(change_dollar),
//.change_half_dollar(change_half_dollar),
//.change_quarter(change_quarter),
//.change_dime(change_dime),
//.change_nickel(change_nickel));

//default:      
//    begin
//    end
//endcase
//end
endmodule
