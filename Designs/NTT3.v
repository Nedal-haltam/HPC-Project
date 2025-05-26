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
    ,output reg [31:0] PEValue
    ,input InternalRegisterEnable
    ,input [31:0] InternalRegisterInputValue0
    ,input [31:0] InternalRegisterInputValue1
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
    reg [31:0] InternalRegister0;
    reg [31:0] InternalRegister1;
    always@(posedge clk) begin
        if (InternalRegisterEnable) begin
            InternalRegister0 <= InternalRegisterInputValue0;
            InternalRegister1 <= InternalRegisterInputValue1;
        end
    end
    always@(posedge clk) begin
        if (rst) begin
            OutDim0Lane0 <= 0;
            PEValue <= 0;
        end
        else begin
            PEValue <= (((InternalRegister1 * ModPow[(InDim0Lane0 * InternalRegister0) % 16]) % 7681)) % 7681;
            OutDim0Lane0 <= InDim0Lane0;
        end
    end
endmodule
module SystolicArray
(
    input clk, rst
    ,input [31:0] Dim0InputLane0
    ,input [31:0] InternalRegisterEnableIndex
    ,input [31:0] InternalRegisterInputValue0
    ,input [31:0] InternalRegisterInputValue1
);
    wire [31:0] PassThroughWires0Lane0;
    assign PassThroughWires0Lane0 = Dim0InputLane0;
    wire [31:0] PEOutDim0Lane0 [15:0];
    wire [31:0] PEValues [15:0];
    genvar Dim0Index, DummyIndex;
    generate
	    for (Dim0Index = 0; Dim0Index < 16; Dim0Index = Dim0Index + 1) begin : Dim0IndexForLoopBlock
			localparam PECount = Dim0Index * 1 + 0;
			wire [31:0] InDim0Lane0;
			assign InDim0Lane0 = PassThroughWires0Lane0;
			PE #(.PECount(PECount)) pe
			(
			    .clk(clk),
			    .rst(rst),
			    .InDim0Lane0(InDim0Lane0),
			    .OutDim0Lane0(PEOutDim0Lane0[Dim0Index]),
			    .PEValue(PEValues[PECount])
			    ,.InternalRegisterEnable(InternalRegisterEnableIndex == PECount+1)
			    ,.InternalRegisterInputValue0(InternalRegisterInputValue0)
			    ,.InternalRegisterInputValue1(InternalRegisterInputValue1)
			);
	    end
    endgenerate
    reg [31:0] OutputDim [15:0];
    reg [31:0] i = 0;
    integer ii;
    always@(posedge clk) begin
        if (rst) begin
            for (ii = 0; ii < 16; ii = ii + 1) begin
                OutputDim[i] <= 0;
            end
            i = 0;
        end
        else begin
            if (i < 17) begin
                OutputDim[i-1] = (PEValues[0] + PEValues[1] + PEValues[2] + PEValues[3] + PEValues[4] + PEValues[5] + PEValues[6] + PEValues[7] + PEValues[8] + PEValues[9] + PEValues[10] + PEValues[11] + PEValues[12] + PEValues[13] + PEValues[14] + PEValues[15] + 0) % 7681;
            end
            i = i + 1;
        end
    end
    integer j;
`ifdef VSCODE
    initial begin
        `ADVANCE_N_CYCLE(54);
        for (j = 0; j < 16; j = j + 1) begin
            $display("Output%-1d : Value = %-1d",j, $signed(OutputDim[j]));
        end
    end 
`endif
endmodule
module TestBench;
    reg clk = 0;
    reg rst = 0;
    reg [31:0] Dim0InputLane0;
    reg [31:0] InternalRegisterEnableIndex;
    reg [31:0] InternalRegisterInputValue0;
    reg [31:0] InternalRegisterInputValue1;
    SystolicArray dut
    (
        .clk(clk),
        .rst(rst)
        ,.Dim0InputLane0(Dim0InputLane0)
        ,.InternalRegisterEnableIndex(InternalRegisterEnableIndex)
        ,.InternalRegisterInputValue0(InternalRegisterInputValue0)
        ,.InternalRegisterInputValue1(InternalRegisterInputValue1)
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
        rst = 1;
        InternalRegisterEnableIndex <= 1;
        InternalRegisterInputValue0 <= 0;
        InternalRegisterInputValue1 <= 1;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 2;
        InternalRegisterInputValue0 <= 1;
        InternalRegisterInputValue1 <= 2;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 3;
        InternalRegisterInputValue0 <= 2;
        InternalRegisterInputValue1 <= 3;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 4;
        InternalRegisterInputValue0 <= 3;
        InternalRegisterInputValue1 <= 4;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 5;
        InternalRegisterInputValue0 <= 4;
        InternalRegisterInputValue1 <= 5;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 6;
        InternalRegisterInputValue0 <= 5;
        InternalRegisterInputValue1 <= 6;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 7;
        InternalRegisterInputValue0 <= 6;
        InternalRegisterInputValue1 <= 7;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 8;
        InternalRegisterInputValue0 <= 7;
        InternalRegisterInputValue1 <= 8;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 9;
        InternalRegisterInputValue0 <= 8;
        InternalRegisterInputValue1 <= 9;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 10;
        InternalRegisterInputValue0 <= 9;
        InternalRegisterInputValue1 <= 10;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 11;
        InternalRegisterInputValue0 <= 10;
        InternalRegisterInputValue1 <= 11;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 12;
        InternalRegisterInputValue0 <= 11;
        InternalRegisterInputValue1 <= 12;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 13;
        InternalRegisterInputValue0 <= 12;
        InternalRegisterInputValue1 <= 13;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 14;
        InternalRegisterInputValue0 <= 13;
        InternalRegisterInputValue1 <= 14;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 15;
        InternalRegisterInputValue0 <= 14;
        InternalRegisterInputValue1 <= 15;
        `ADVANCE_N_CYCLE(1);
        InternalRegisterEnableIndex <= 16;
        InternalRegisterInputValue0 <= 15;
        InternalRegisterInputValue1 <= 16;
        `ADVANCE_N_CYCLE(1);
        rst = 0;
        Dim0InputLane0 <= 0;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 1;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 2;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 3;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 4;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 5;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 6;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 7;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 8;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 9;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 10;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 11;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 12;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 13;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 14;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 15;
        `ADVANCE_N_CYCLE(1);
        Dim0InputLane0 <= 0;
        `ADVANCE_N_CYCLE(2000);
        $finish;
    end
endmodule
