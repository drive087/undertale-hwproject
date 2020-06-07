//---------------------------------------------------
// BeeRom Module - Single Port ROM : Digilent Basys 3               
// BeeInvaders Tutorial 4 : Onboard clock 100MHz
// VGA Resolution 640x480 @ 60Hz : Pixel Clock 25MHz
//---------------------------------------------------
`timescale 1ns / 1ps

// Setup BeeRom Module
module BeeRom(
    input wire [9:0] i_addr, 
    input wire i_clk2,
    output reg [7:0] o_data 
    );

    (*ROM_STYLE="block"*) reg [10:0] memory_array [0:1223];

    initial begin
            $readmemh("foam2.mem", memory_array);
    end

    always @ (posedge i_clk2)
            o_data <= memory_array[i_addr];     
endmodule
