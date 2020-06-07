`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2020 05:29:20 PM
// Design Name: 
// Module Name: pressRom
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


module pressRom(
    input wire [10:0] i_addr, // (9:0) or 2^10 or 1024, need 34 x 27 = 918
    input wire i_clk2,
    output reg [7:0] o_data // (7:0) 8 bit pixel value from Character.mem
    );
    
    (*ROM_STYLE="block"*) reg [7:0] memory_array [0:2015]; // 8 bit values for 918 pixels of Bee (34 x 27)

    initial begin
            $readmemh("press168x12.mem", memory_array);
    end

    always @ (posedge i_clk2)
            o_data <= memory_array[i_addr];
endmodule
