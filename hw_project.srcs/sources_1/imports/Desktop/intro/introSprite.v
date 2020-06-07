`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2020 05:01:42 PM
// Design Name: 
// Module Name: introSprite
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


module introSprite(
    input wire [9:0] xx, // current x position
    input wire [9:0] yy, // current y position
    input wire aactive, // high during active pixel drawing
    input wire [2:0] state,
    output reg TSpriteOn, // 1=on, 0=off
    output wire [7:0] T_dataout,
    output reg CNameSpriteOn, // 1=on, 0=off
    output wire [7:0] CN_dataout,
    output reg JNameSpriteOn, // 1=on, 0=off
    output wire [7:0] JN_dataout,
    output reg TNameSpriteOn, // 1=on, 0=off
    output wire [7:0] TN_dataout,
    output reg FNameSpriteOn, // 1=on, 0=off
    output wire [7:0] FN_dataout,
    output reg PNameSpriteOn, // 1=on, 0=off
    output wire [7:0] PN_dataout,
    output reg PressSpriteOn, // 1=on, 0=off
    output wire [7:0] Press_dataout,
    input wire Pclk
    
    );
    
    // instantiate BeeRom code
    reg [14:0] T_address; // 2^10 or 1024, need 34 x 27 = 918
    introRom IntroVRom (.i_addr(T_address),.i_clk2(Pclk),.o_data(T_dataout));
    
    // instantiate BeeRom code
    reg [12:0] CN_address; // 2^10 or 1024, need 34 x 27 = 918
    nameRom CNameVRom (.i_addr(CN_address),.i_clk2(Pclk),.o_data(CN_dataout));
    
    // instantiate BeeRom code
    reg [12:0] JN_address; // 2^10 or 1024, need 34 x 27 = 918
    JnameRom JNameVRom (.i_addr(JN_address),.i_clk2(Pclk),.o_data(JN_dataout));
    
    // instantiate BeeRom code
    reg [12:0] TN_address; // 2^10 or 1024, need 34 x 27 = 918
    TnameRom TNameVRom (.i_addr(TN_address),.i_clk2(Pclk),.o_data(TN_dataout));
    
    // instantiate BeeRom code
    reg [12:0] FN_address; // 2^10 or 1024, need 34 x 27 = 918
    FnameRom FNameVRom (.i_addr(FN_address),.i_clk2(Pclk),.o_data(FN_dataout));
    
    // instantiate BeeRom code
    reg [12:0] PN_address; // 2^10 or 1024, need 34 x 27 = 918
    PnameRom PNameVRom (.i_addr(PN_address),.i_clk2(Pclk),.o_data(PN_dataout));
    
    // instantiate BeeRom code
    reg [10:0] P_address; // 2^10 or 1024, need 34 x 27 = 918
    pressRom PressVRom (.i_addr(P_address),.i_clk2(Pclk),.o_data(Press_dataout));
            
    // setup character positions and sizes
    reg [9:0] TitleX = 116; // Bee X start position
    reg [8:0] TitleY = 60; // Bee Y start position
    localparam TitleWidth = 408; // Bee width in pixels
    localparam TitleHeight = 53; // Bee height in pixels
  
    reg [9:0] NameX = 142; // Bee X start position
    reg [8:0] CNameY = 193; // Bee Y start position
    reg [8:0] JNameY = 220; // Bee Y start position
    reg [8:0] TNameY = 247; // Bee Y start position
    reg [8:0] FNameY = 274; // Bee Y start position
    reg [8:0] PNameY = 301; // Bee Y start position
    localparam NameWidth = 356; // Bee width in pixels
    localparam NameHeight = 12; // Bee height in pixels
    
    reg [9:0] PressX = 236; // Bee X start position
    reg [8:0] PressY = 393; // Bee Y start position
    localparam PressWidth = 168; // Bee width in pixels
    localparam PressHeight = 12; // Bee height in pixels
  
  
    always @ (posedge Pclk)
    begin
        if (aactive)
            begin // check if xx,yy are within the confines of the Bee character
                if (xx==TitleX-1 && yy==TitleY)
                    begin
                        T_address <= 0;
                        TSpriteOn <=1;
                    end
                if ((xx>TitleX-1) && (xx<TitleX+TitleWidth) && (yy>TitleY-1) && (yy<TitleY+TitleHeight))
                    begin
                        T_address <= T_address + 1;
                        TSpriteOn <=1;
                    end
                else
                    TSpriteOn <=0;

            
             // check if xx,yy are within the confines of the Bee character
                if (xx==NameX-1 && yy==CNameY)
                    begin
                        CN_address <= 0;
                        CNameSpriteOn <=1;
                    end
                if ((xx>NameX-1) && (xx<NameX+NameWidth) && (yy>CNameY-1) && (yy<CNameY+NameHeight))
                    begin
                        CN_address <= CN_address + 1;
                        CNameSpriteOn <=1;
                    end
                else
                    CNameSpriteOn <=0;
                
                if (xx==NameX-1 && yy==JNameY)
                    begin
                        JN_address <= 0;
                        JNameSpriteOn <=1;
                    end
                if ((xx>NameX-1) && (xx<NameX+NameWidth) && (yy>JNameY-1) && (yy<JNameY+NameHeight))
                    begin
                        JN_address <= JN_address + 1;
                        JNameSpriteOn <=1;
                    end
                else
                    JNameSpriteOn <=0;
                    
                if (xx==NameX-1 && yy==TNameY)
                    begin
                        TN_address <= 0;
                        TNameSpriteOn <=1;
                    end
                if ((xx>NameX-1) && (xx<NameX+NameWidth) && (yy>TNameY-1) && (yy<TNameY+NameHeight))
                    begin
                        TN_address <= TN_address + 1;
                        TNameSpriteOn <=1;
                    end
                else
                    TNameSpriteOn <=0;
         
                if (xx==NameX-1 && yy==FNameY)
                    begin
                        FN_address <= 0;
                        FNameSpriteOn <=1;
                    end
                if ((xx>NameX-1) && (xx<NameX+NameWidth) && (yy>FNameY-1) && (yy<FNameY+NameHeight))
                    begin
                        FN_address <= FN_address + 1;
                        FNameSpriteOn <=1;
                    end
                else
                    FNameSpriteOn <=0;
                    
                    
                if (xx==NameX-1 && yy==PNameY)
                    begin
                        PN_address <= 0;
                        PNameSpriteOn <=1;
                    end
                if ((xx>NameX-1) && (xx<NameX+NameWidth) && (yy>PNameY-1) && (yy<PNameY+NameHeight))
                    begin
                        PN_address <= PN_address + 1;
                        PNameSpriteOn <=1;
                    end
                else
                    PNameSpriteOn <=0;
            
            // check if xx,yy are within the confines of the Bee character
                if (xx==PressX-1 && yy==PressY)
                    begin
                        P_address <= 0;
                        PressSpriteOn <=1;
                    end
                if ((xx>PressX-1) && (xx<PressX+PressWidth) && (yy>PressY-1) && (yy<PressY+PressHeight))
                    begin
                        P_address <= P_address + 1;
                        PressSpriteOn <=1;
                    end
                else
                    PressSpriteOn <=0;
            end
    end
    
    
endmodule
