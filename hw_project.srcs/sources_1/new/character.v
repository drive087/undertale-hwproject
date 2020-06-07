`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2020 02:02:15 PM
// Design Name: 
// Module Name: character
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


module character(

    input wire [9:0] xx,
    input wire [9:0] yy,
    input wire aactive, 
    output reg characterOn, 
    output wire [7:0] character_dataout, 
    input wire Pclk 
    );
    
    reg [9:0] address; 
    BeeRom BeeVRom (.i_addr(address),.i_clk2(Pclk),.o_data(character_dataout));
            
    reg [9:0] CharacterX = 300; 
    reg [8:0] CharacterY = 150; 
    localparam CharacterWidth = 34; 
    localparam CharacterHeight = 27; 
    
    always @ (posedge Pclk)
    begin
    if (aactive)
            begin 
                if (xx==CharacterX-1 && yy==CharacterY)
                    begin
                        address <= 0;
                        characterOn <=1;
                    end
                if ((xx>CharacterX-1) && (xx<CharacterX+CharacterWidth) && (yy>CharacterY-1) && (yy<CharacterY+CharacterHeight))
                    begin
                        address <= address + 1;
                        characterOn <=1;
                    end
                else
                    characterOn <=0;
               end
      
    end
    
endmodule
