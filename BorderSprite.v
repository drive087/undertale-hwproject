`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2020 02:36:36 PM
// Design Name: 
// Module Name: BorderSprite
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


module BorderSprite(
    input wire [9:0] xx,
    input wire [9:0] yy, 
    input wire aactive, 
    output reg BorderSpriteOn, 
    input wire Pclk 
    );
    
    always @(posedge Pclk)
        begin
            if (((xx>215 && xx<425) && (yy>195 && yy<201))||((xx>215 && xx<425) && (yy>389 && yy<395))||((xx>211 && xx<217) && (yy>195 && yy<395))||((xx>425 && xx<431) && (yy>195 && yy<395)))
                begin
                BorderSpriteOn <= 1;
                end
            
            else
                begin
                BorderSpriteOn <= 0;
                end
        end
endmodule
