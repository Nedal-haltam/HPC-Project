`define CYCLE_TIME          (2)
`define HALF_CYCLE          (`CYCLE_TIME / 2)
`define ONE_CYCLE           (2 * `HALF_CYCLE)
`define ADVANCE_N_CYCLE(N)  #(`ONE_CYCLE * N)
`ifndef VSCODE
`timescale 1ns / 1ps
`else
// includes if needed in vs code
`endif
module Dff
#(
    parameter DefualtValue = 0
)
(
    input clk, rst,
    input      [31:0] Input,
    output reg [31:0] Output
);
    always@(posedge clk) begin
        if (rst) begin
            Output <= DefualtValue;
        end
        else begin
            Output <= Input;
        end
    end
endmodule
module PE
#(parameter PECount = 0)
(
    input clk, rst
    ,input      [31:0] InDim0Lane0
    ,output reg [31:0] OutDim0Lane0
    ,input      [31:0] InDim0Lane1
    ,output reg [31:0] OutDim0Lane1
    ,input      [31:0] InDim1Lane0
    ,output reg [31:0] OutDim1Lane0
    ,output reg [31:0] PEValue
);
    reg [31:0] ModPow[15:0];
    always@(posedge clk) begin
        if (rst) begin
            ModPow[0] <= 1;
            ModPow[1] <= 7098;
            ModPow[2] <= 1925;
            ModPow[3] <= 6832;
            ModPow[4] <= 3383;
            ModPow[5] <= 1728;
            ModPow[6] <= 6468;
            ModPow[7] <= 527;
            ModPow[8] <= 7680;
            ModPow[9] <= 583;
            ModPow[10] <= 5756;
            ModPow[11] <= 849;
            ModPow[12] <= 4298;
            ModPow[13] <= 5953;
            ModPow[14] <= 1213;
            ModPow[15] <= 7154;
        end
    end
    always@(posedge clk) begin
        if (rst) begin
            OutDim0Lane0 <= 0;
            OutDim0Lane1 <= 0;
            OutDim1Lane0 <= 0;
            PEValue <= 0;
        end
        else begin
            PEValue <= (InDim0Lane1 * ((ModPow[(InDim0Lane0 * InDim1Lane0) % 16]) % 7681)) % 7681;
            OutDim0Lane0 <= InDim0Lane0;
            OutDim0Lane1 <= InDim0Lane1;
            OutDim1Lane0 <= InDim1Lane0;
        end
    end
endmodule
module SystolicArray
(
    input clk, rst
    ,input [31:0] Dim0Input0Lane0
    ,input [31:0] Dim0Input0Lane1
    ,input [31:0] Dim0Input1Lane0
    ,input [31:0] Dim0Input1Lane1
    ,input [31:0] Dim0Input2Lane0
    ,input [31:0] Dim0Input2Lane1
    ,input [31:0] Dim0Input3Lane0
    ,input [31:0] Dim0Input3Lane1
    ,input [31:0] Dim0Input4Lane0
    ,input [31:0] Dim0Input4Lane1
    ,input [31:0] Dim0Input5Lane0
    ,input [31:0] Dim0Input5Lane1
    ,input [31:0] Dim0Input6Lane0
    ,input [31:0] Dim0Input6Lane1
    ,input [31:0] Dim0Input7Lane0
    ,input [31:0] Dim0Input7Lane1
    ,input [31:0] Dim0Input8Lane0
    ,input [31:0] Dim0Input8Lane1
    ,input [31:0] Dim0Input9Lane0
    ,input [31:0] Dim0Input9Lane1
    ,input [31:0] Dim0Input10Lane0
    ,input [31:0] Dim0Input10Lane1
    ,input [31:0] Dim0Input11Lane0
    ,input [31:0] Dim0Input11Lane1
    ,input [31:0] Dim0Input12Lane0
    ,input [31:0] Dim0Input12Lane1
    ,input [31:0] Dim0Input13Lane0
    ,input [31:0] Dim0Input13Lane1
    ,input [31:0] Dim0Input14Lane0
    ,input [31:0] Dim0Input14Lane1
    ,input [31:0] Dim0Input15Lane0
    ,input [31:0] Dim0Input15Lane1
    ,input [31:0] Dim1Input0Lane0
    ,input [31:0] Dim1Input1Lane0
    ,input [31:0] Dim1Input2Lane0
    ,input [31:0] Dim1Input3Lane0
    ,input [31:0] Dim1Input4Lane0
    ,input [31:0] Dim1Input5Lane0
    ,input [31:0] Dim1Input6Lane0
    ,input [31:0] Dim1Input7Lane0
    ,input [31:0] Dim1Input8Lane0
    ,input [31:0] Dim1Input9Lane0
    ,input [31:0] Dim1Input10Lane0
    ,input [31:0] Dim1Input11Lane0
    ,input [31:0] Dim1Input12Lane0
    ,input [31:0] Dim1Input13Lane0
    ,input [31:0] Dim1Input14Lane0
    ,input [31:0] Dim1Input15Lane0
);
    wire [31:0] PassThroughWires0Lane0[15:0];
    wire [31:0] PassThroughWires0Lane1[15:0];
    wire [31:0] PassThroughWires1Lane0[15:0];
    assign PassThroughWires0Lane0[0] = Dim0Input0Lane0;
    assign PassThroughWires0Lane1[0] = Dim0Input0Lane1;
    assign PassThroughWires0Lane0[1] = Dim0Input1Lane0;
    assign PassThroughWires0Lane1[1] = Dim0Input1Lane1;
    assign PassThroughWires0Lane0[2] = Dim0Input2Lane0;
    assign PassThroughWires0Lane1[2] = Dim0Input2Lane1;
    assign PassThroughWires0Lane0[3] = Dim0Input3Lane0;
    assign PassThroughWires0Lane1[3] = Dim0Input3Lane1;
    assign PassThroughWires0Lane0[4] = Dim0Input4Lane0;
    assign PassThroughWires0Lane1[4] = Dim0Input4Lane1;
    assign PassThroughWires0Lane0[5] = Dim0Input5Lane0;
    assign PassThroughWires0Lane1[5] = Dim0Input5Lane1;
    assign PassThroughWires0Lane0[6] = Dim0Input6Lane0;
    assign PassThroughWires0Lane1[6] = Dim0Input6Lane1;
    assign PassThroughWires0Lane0[7] = Dim0Input7Lane0;
    assign PassThroughWires0Lane1[7] = Dim0Input7Lane1;
    assign PassThroughWires0Lane0[8] = Dim0Input8Lane0;
    assign PassThroughWires0Lane1[8] = Dim0Input8Lane1;
    assign PassThroughWires0Lane0[9] = Dim0Input9Lane0;
    assign PassThroughWires0Lane1[9] = Dim0Input9Lane1;
    assign PassThroughWires0Lane0[10] = Dim0Input10Lane0;
    assign PassThroughWires0Lane1[10] = Dim0Input10Lane1;
    assign PassThroughWires0Lane0[11] = Dim0Input11Lane0;
    assign PassThroughWires0Lane1[11] = Dim0Input11Lane1;
    assign PassThroughWires0Lane0[12] = Dim0Input12Lane0;
    assign PassThroughWires0Lane1[12] = Dim0Input12Lane1;
    assign PassThroughWires0Lane0[13] = Dim0Input13Lane0;
    assign PassThroughWires0Lane1[13] = Dim0Input13Lane1;
    assign PassThroughWires0Lane0[14] = Dim0Input14Lane0;
    assign PassThroughWires0Lane1[14] = Dim0Input14Lane1;
    assign PassThroughWires0Lane0[15] = Dim0Input15Lane0;
    assign PassThroughWires0Lane1[15] = Dim0Input15Lane1;
    assign PassThroughWires1Lane0[0] = Dim1Input0Lane0;
    assign PassThroughWires1Lane0[1] = Dim1Input1Lane0;
    assign PassThroughWires1Lane0[2] = Dim1Input2Lane0;
    assign PassThroughWires1Lane0[3] = Dim1Input3Lane0;
    assign PassThroughWires1Lane0[4] = Dim1Input4Lane0;
    assign PassThroughWires1Lane0[5] = Dim1Input5Lane0;
    assign PassThroughWires1Lane0[6] = Dim1Input6Lane0;
    assign PassThroughWires1Lane0[7] = Dim1Input7Lane0;
    assign PassThroughWires1Lane0[8] = Dim1Input8Lane0;
    assign PassThroughWires1Lane0[9] = Dim1Input9Lane0;
    assign PassThroughWires1Lane0[10] = Dim1Input10Lane0;
    assign PassThroughWires1Lane0[11] = Dim1Input11Lane0;
    assign PassThroughWires1Lane0[12] = Dim1Input12Lane0;
    assign PassThroughWires1Lane0[13] = Dim1Input13Lane0;
    assign PassThroughWires1Lane0[14] = Dim1Input14Lane0;
    assign PassThroughWires1Lane0[15] = Dim1Input15Lane0;
    wire [31:0] PEOutDim0Lane0 [15:0][15:0];
    wire [31:0] PEOutDim0Lane1 [15:0][15:0];
    wire [31:0] PEOutDim1Lane0 [15:0][15:0];
    wire [31:0] PEValues [255:0];
    genvar Dim0Index, Dim1Index, DummyIndex;
    generate
	    for (Dim0Index = 0; Dim0Index < 16; Dim0Index = Dim0Index + 1) begin : Dim0IndexForLoopBlock
		    for (Dim1Index = 0; Dim1Index < 16; Dim1Index = Dim1Index + 1) begin : Dim1IndexForLoopBlock
				localparam PECount = Dim1Index * 16 * 1 + Dim0Index * 1 + 0;
				wire [31:0] InDim0Lane0;
				wire [31:0] InDim0Lane1;
				assign InDim0Lane0 = PassThroughWires0Lane0[Dim0Index];
				assign InDim0Lane1 = PassThroughWires0Lane1[Dim0Index];
				wire [31:0] InDim1Lane0;
				assign InDim1Lane0 = PassThroughWires1Lane0[Dim1Index];
				PE #(.PECount(PECount)) pe
				(
				    .clk(clk),
				    .rst(rst),
				    .InDim0Lane0(InDim0Lane0),
				    .OutDim0Lane0(PEOutDim0Lane0[Dim0Index][Dim1Index]),
				    .InDim0Lane1(InDim0Lane1),
				    .OutDim0Lane1(PEOutDim0Lane1[Dim0Index][Dim1Index]),
				    .InDim1Lane0(InDim1Lane0),
				    .OutDim1Lane0(PEOutDim1Lane0[Dim0Index][Dim1Index]),
				    .PEValue(PEValues[PECount])
				);
		    end
	    end
    endgenerate
    reg [31:0] OutputDim [15:0];
    reg [31:0] i = 0;
    integer index;
    always@(posedge clk) begin
        if (rst) begin
            for (index = 0; index < 16; index = index + 1) begin
                OutputDim[i] <= 0;
            end
            i = 0;
        end
        else begin
            if (i < 2) begin
                for (index = 0; index < 16; index = index + 1) begin
                    OutputDim[index] = (PEValues[(index * 16) + 0] + PEValues[(index * 16) + 1] + PEValues[(index * 16) + 2] + PEValues[(index * 16) + 3] + PEValues[(index * 16) + 4] + PEValues[(index * 16) + 5] + PEValues[(index * 16) + 6] + PEValues[(index * 16) + 7] + PEValues[(index * 16) + 8] + PEValues[(index * 16) + 9] + PEValues[(index * 16) + 10] + PEValues[(index * 16) + 11] + PEValues[(index * 16) + 12] + PEValues[(index * 16) + 13] + PEValues[(index * 16) + 14] + PEValues[(index * 16) + 15] + 0) % 7681;
                end
            end
            i = i + 1;
        end
    end
    integer j;
`ifdef VSCODE
    initial begin
        `ADVANCE_N_CYCLE(5);
        for (j = 0; j < 16; j = j + 1) begin
            $display("Output%-1d : Value = %-1d",j, $signed(OutputDim[j]));
        end
    end 
`endif
endmodule
module TestBench;
    reg clk = 0;
    reg rst = 0;
    reg [31:0] Dim0Input0Lane0;
    reg [31:0] Dim0Input0Lane1;
    reg [31:0] Dim0Input1Lane0;
    reg [31:0] Dim0Input1Lane1;
    reg [31:0] Dim0Input2Lane0;
    reg [31:0] Dim0Input2Lane1;
    reg [31:0] Dim0Input3Lane0;
    reg [31:0] Dim0Input3Lane1;
    reg [31:0] Dim0Input4Lane0;
    reg [31:0] Dim0Input4Lane1;
    reg [31:0] Dim0Input5Lane0;
    reg [31:0] Dim0Input5Lane1;
    reg [31:0] Dim0Input6Lane0;
    reg [31:0] Dim0Input6Lane1;
    reg [31:0] Dim0Input7Lane0;
    reg [31:0] Dim0Input7Lane1;
    reg [31:0] Dim0Input8Lane0;
    reg [31:0] Dim0Input8Lane1;
    reg [31:0] Dim0Input9Lane0;
    reg [31:0] Dim0Input9Lane1;
    reg [31:0] Dim0Input10Lane0;
    reg [31:0] Dim0Input10Lane1;
    reg [31:0] Dim0Input11Lane0;
    reg [31:0] Dim0Input11Lane1;
    reg [31:0] Dim0Input12Lane0;
    reg [31:0] Dim0Input12Lane1;
    reg [31:0] Dim0Input13Lane0;
    reg [31:0] Dim0Input13Lane1;
    reg [31:0] Dim0Input14Lane0;
    reg [31:0] Dim0Input14Lane1;
    reg [31:0] Dim0Input15Lane0;
    reg [31:0] Dim0Input15Lane1;
    reg [31:0] Dim1Input0Lane0;
    reg [31:0] Dim1Input1Lane0;
    reg [31:0] Dim1Input2Lane0;
    reg [31:0] Dim1Input3Lane0;
    reg [31:0] Dim1Input4Lane0;
    reg [31:0] Dim1Input5Lane0;
    reg [31:0] Dim1Input6Lane0;
    reg [31:0] Dim1Input7Lane0;
    reg [31:0] Dim1Input8Lane0;
    reg [31:0] Dim1Input9Lane0;
    reg [31:0] Dim1Input10Lane0;
    reg [31:0] Dim1Input11Lane0;
    reg [31:0] Dim1Input12Lane0;
    reg [31:0] Dim1Input13Lane0;
    reg [31:0] Dim1Input14Lane0;
    reg [31:0] Dim1Input15Lane0;
    SystolicArray dut
    (
        .clk(clk),
        .rst(rst)
        ,.Dim0Input0Lane0(Dim0Input0Lane0)
        ,.Dim0Input0Lane1(Dim0Input0Lane1)
        ,.Dim0Input1Lane0(Dim0Input1Lane0)
        ,.Dim0Input1Lane1(Dim0Input1Lane1)
        ,.Dim0Input2Lane0(Dim0Input2Lane0)
        ,.Dim0Input2Lane1(Dim0Input2Lane1)
        ,.Dim0Input3Lane0(Dim0Input3Lane0)
        ,.Dim0Input3Lane1(Dim0Input3Lane1)
        ,.Dim0Input4Lane0(Dim0Input4Lane0)
        ,.Dim0Input4Lane1(Dim0Input4Lane1)
        ,.Dim0Input5Lane0(Dim0Input5Lane0)
        ,.Dim0Input5Lane1(Dim0Input5Lane1)
        ,.Dim0Input6Lane0(Dim0Input6Lane0)
        ,.Dim0Input6Lane1(Dim0Input6Lane1)
        ,.Dim0Input7Lane0(Dim0Input7Lane0)
        ,.Dim0Input7Lane1(Dim0Input7Lane1)
        ,.Dim0Input8Lane0(Dim0Input8Lane0)
        ,.Dim0Input8Lane1(Dim0Input8Lane1)
        ,.Dim0Input9Lane0(Dim0Input9Lane0)
        ,.Dim0Input9Lane1(Dim0Input9Lane1)
        ,.Dim0Input10Lane0(Dim0Input10Lane0)
        ,.Dim0Input10Lane1(Dim0Input10Lane1)
        ,.Dim0Input11Lane0(Dim0Input11Lane0)
        ,.Dim0Input11Lane1(Dim0Input11Lane1)
        ,.Dim0Input12Lane0(Dim0Input12Lane0)
        ,.Dim0Input12Lane1(Dim0Input12Lane1)
        ,.Dim0Input13Lane0(Dim0Input13Lane0)
        ,.Dim0Input13Lane1(Dim0Input13Lane1)
        ,.Dim0Input14Lane0(Dim0Input14Lane0)
        ,.Dim0Input14Lane1(Dim0Input14Lane1)
        ,.Dim0Input15Lane0(Dim0Input15Lane0)
        ,.Dim0Input15Lane1(Dim0Input15Lane1)
        ,.Dim1Input0Lane0(Dim1Input0Lane0)
        ,.Dim1Input1Lane0(Dim1Input1Lane0)
        ,.Dim1Input2Lane0(Dim1Input2Lane0)
        ,.Dim1Input3Lane0(Dim1Input3Lane0)
        ,.Dim1Input4Lane0(Dim1Input4Lane0)
        ,.Dim1Input5Lane0(Dim1Input5Lane0)
        ,.Dim1Input6Lane0(Dim1Input6Lane0)
        ,.Dim1Input7Lane0(Dim1Input7Lane0)
        ,.Dim1Input8Lane0(Dim1Input8Lane0)
        ,.Dim1Input9Lane0(Dim1Input9Lane0)
        ,.Dim1Input10Lane0(Dim1Input10Lane0)
        ,.Dim1Input11Lane0(Dim1Input11Lane0)
        ,.Dim1Input12Lane0(Dim1Input12Lane0)
        ,.Dim1Input13Lane0(Dim1Input13Lane0)
        ,.Dim1Input14Lane0(Dim1Input14Lane0)
        ,.Dim1Input15Lane0(Dim1Input15Lane0)
    );
    always #(`HALF_CYCLE) clk <= ~clk;
    initial begin
`ifdef VCD_OUT
        $dumpfile(`VCD_OUT);
        $dumpvars;
`endif
        rst = 0; 
        `ADVANCE_N_CYCLE(1);
        rst = 1; 
        `ADVANCE_N_CYCLE(2);
        rst = 0;
        Dim0Input0Lane0 <= 0;
        Dim0Input0Lane1 <= 1;
        Dim0Input1Lane0 <= 1;
        Dim0Input1Lane1 <= 2;
        Dim0Input2Lane0 <= 2;
        Dim0Input2Lane1 <= 3;
        Dim0Input3Lane0 <= 3;
        Dim0Input3Lane1 <= 4;
        Dim0Input4Lane0 <= 4;
        Dim0Input4Lane1 <= 5;
        Dim0Input5Lane0 <= 5;
        Dim0Input5Lane1 <= 6;
        Dim0Input6Lane0 <= 6;
        Dim0Input6Lane1 <= 7;
        Dim0Input7Lane0 <= 7;
        Dim0Input7Lane1 <= 8;
        Dim0Input8Lane0 <= 8;
        Dim0Input8Lane1 <= 9;
        Dim0Input9Lane0 <= 9;
        Dim0Input9Lane1 <= 10;
        Dim0Input10Lane0 <= 10;
        Dim0Input10Lane1 <= 11;
        Dim0Input11Lane0 <= 11;
        Dim0Input11Lane1 <= 12;
        Dim0Input12Lane0 <= 12;
        Dim0Input12Lane1 <= 13;
        Dim0Input13Lane0 <= 13;
        Dim0Input13Lane1 <= 14;
        Dim0Input14Lane0 <= 14;
        Dim0Input14Lane1 <= 15;
        Dim0Input15Lane0 <= 15;
        Dim0Input15Lane1 <= 16;
        Dim1Input0Lane0 <= 0;
        Dim1Input1Lane0 <= 1;
        Dim1Input2Lane0 <= 2;
        Dim1Input3Lane0 <= 3;
        Dim1Input4Lane0 <= 4;
        Dim1Input5Lane0 <= 5;
        Dim1Input6Lane0 <= 6;
        Dim1Input7Lane0 <= 7;
        Dim1Input8Lane0 <= 8;
        Dim1Input9Lane0 <= 9;
        Dim1Input10Lane0 <= 10;
        Dim1Input11Lane0 <= 11;
        Dim1Input12Lane0 <= 12;
        Dim1Input13Lane0 <= 13;
        Dim1Input14Lane0 <= 14;
        Dim1Input15Lane0 <= 15;
        `ADVANCE_N_CYCLE(1);
        Dim0Input0Lane0 <= 0;
        Dim0Input0Lane1 <= 0;
        Dim0Input1Lane0 <= 0;
        Dim0Input1Lane1 <= 0;
        Dim0Input2Lane0 <= 0;
        Dim0Input2Lane1 <= 0;
        Dim0Input3Lane0 <= 0;
        Dim0Input3Lane1 <= 0;
        Dim0Input4Lane0 <= 0;
        Dim0Input4Lane1 <= 0;
        Dim0Input5Lane0 <= 0;
        Dim0Input5Lane1 <= 0;
        Dim0Input6Lane0 <= 0;
        Dim0Input6Lane1 <= 0;
        Dim0Input7Lane0 <= 0;
        Dim0Input7Lane1 <= 0;
        Dim0Input8Lane0 <= 0;
        Dim0Input8Lane1 <= 0;
        Dim0Input9Lane0 <= 0;
        Dim0Input9Lane1 <= 0;
        Dim0Input10Lane0 <= 0;
        Dim0Input10Lane1 <= 0;
        Dim0Input11Lane0 <= 0;
        Dim0Input11Lane1 <= 0;
        Dim0Input12Lane0 <= 0;
        Dim0Input12Lane1 <= 0;
        Dim0Input13Lane0 <= 0;
        Dim0Input13Lane1 <= 0;
        Dim0Input14Lane0 <= 0;
        Dim0Input14Lane1 <= 0;
        Dim0Input15Lane0 <= 0;
        Dim0Input15Lane1 <= 0;
        Dim1Input0Lane0 <= 0;
        Dim1Input1Lane0 <= 0;
        Dim1Input2Lane0 <= 0;
        Dim1Input3Lane0 <= 0;
        Dim1Input4Lane0 <= 0;
        Dim1Input5Lane0 <= 0;
        Dim1Input6Lane0 <= 0;
        Dim1Input7Lane0 <= 0;
        Dim1Input8Lane0 <= 0;
        Dim1Input9Lane0 <= 0;
        Dim1Input10Lane0 <= 0;
        Dim1Input11Lane0 <= 0;
        Dim1Input12Lane0 <= 0;
        Dim1Input13Lane0 <= 0;
        Dim1Input14Lane0 <= 0;
        Dim1Input15Lane0 <= 0;
        `ADVANCE_N_CYCLE(1);
        $finish;
    end
endmodule
