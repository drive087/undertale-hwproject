`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2020 07:47:08 PM
// Design Name: 
// Module Name: PnameRom
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


module PnameRom(
    input wire [12:0] i_addr, // (9:0) or 2^10 or 1024, need 34 x 27 = 918
    input wire i_clk2,
    output reg [7:0] o_data // (7:0) 8 bit pixel value from Character.mem
    );
    
    (*ROM_STYLE="block"*) reg [7:0] memory_array [0:4271]; // 8 bit values for 918 pixels of Bee (34 x 27)

    initial begin
            $readmemh("porsche356x12.mem", memory_array);
    end

    always @ (posedge i_clk2)
            o_data <= memory_array[i_addr];
    
endmodule
