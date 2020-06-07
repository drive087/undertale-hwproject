`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2020 04:42:55 PM
// Design Name: 
// Module Name: HeartSprite
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


module HeartSprite(
    input wire [9:0] xx, // current x position
    input wire [9:0] yy, // current y position
    input wire aactive, 
    output reg HSpriteOn, 
    output wire [7:0] heart_dataout,
    input wire Pclk,
    input wire [2:0] state
    );
            
    // setup character positions and sizes
    reg [9:0] HeartX = 400; 
    reg [8:0] HeartY = 400; 
    localparam HeartWidth = 15; 
    localparam HeartHeight = 15; 
    
    reg [9:0] address;
    HeartRom HeartRom (.i_addr(address),.i_clk2(Pclk),.heart_dataout(heart_dataout));
    
    always @ (posedge Pclk)
    begin
        
        if (aactive)
            begin 
                  if (xx==HeartX-1 && yy==HeartY)
                    begin
                        address <= 0;
                        HSpriteOn <=1;
                    end
                if ((xx>HeartX-1) && (xx<HeartX+HeartWidth) && (yy>HeartY-1) && (yy<HeartY+HeartHeight))
                    begin
                        address <= address + 1;
                        HSpriteOn <=1;
                    end
                else
                    HSpriteOn <=0;
            end
        begin
        if(HeartX <= 217)
        begin
           HeartX<=HeartX+5;
        end
        if(HeartX >= 402)
        begin
           HeartX<=HeartX-5;
        end
        if(HeartY <= 200)
        begin
            HeartY<=HeartY+5;
        end
        if(HeartY >= 375)
        begin
            HeartY<=HeartY-5;
        end
        case(state)
            3'b000 : HeartY<=HeartY-5;
            3'b001 : HeartY<=HeartY+5;
            3'b010 : HeartX<=HeartX-5;
            3'b011 : HeartX<=HeartX+5;
        endcase
    end
    end
endmodule
