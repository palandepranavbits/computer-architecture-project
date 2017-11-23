`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pranav Palande
// 
// Create Date:    13:59:08 11/22/2017 
// Design Name: 	VLIW architecture design
// Module Name:    main 
// Project Name:  Computer Architecture Project
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////	

module D_ff(input clk, input reset, input regWrite, input decOut1b , input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=0;
	else
		if(regWrite == 1 && decOut1b==1)
		begin
			q=d;
		end
	end
endmodule


///////////////////////////////regfile///////////////////////////////////////


//author:pranav
module decoder4to16(input [3:0] destReg, output reg [15:0] decOut);
	always@(destReg)
	begin
		case(destReg)
			4'b0000 : decOut = 16'b0000000000000001;
			4'b0001 : decOut = 16'b0000000000000010;
			4'b0010 : decOut = 16'b0000000000000100;
			4'b0011 : decOut = 16'b0000000000001000;
			4'b0100 : decOut = 16'b0000000000010000;
			4'b0101 : decOut = 16'b0000000000100000;
			4'b0110 : decOut = 16'b0000000001000000;
			4'b0111 : decOut = 16'b0000000010000000;
			4'b1000 : decOut = 16'b0000000100000000;
			4'b1001 : decOut = 16'b0000001000000000;
			4'b1010 : decOut = 16'b0000010000000000;
			4'b1011 : decOut = 16'b0000100000000000;
			4'b1100 : decOut = 16'b0001000000000000;
			4'b1101 : decOut = 16'b0010000000000000;
			4'b1110 : decOut = 16'b0100000000000000;
			4'b1111 : decOut = 16'b1000000000000000;			
		endcase
	end

module mux16to1(input [31:0] outR0, input [31:0] outR1, input [31:0] outR2, input [31:0] outR3,
	input [31:0] outR4, input [31:0] outR5, input [31:0] outR6, input [31:0] outR7,
	input [31:0] outR8, input [31:0] outR9, input [31:0] outR10, input [31:0] outR11,
	input [31:0] outR12, input [31:0] outR13, input [31:0] outR14, input [31:0] outR15,
	input [3:0] Sel, output reg [31:0] outBus);
   
	always@(*)
	begin
		case(Sel)
			4'b0000 : outBus = outR0;
			4'b0001 : outBus = outR1;
			4'b0010 : outBus = outR2;
			4'b0011 : outBus = outR3;
			4'b0100 : outBus = outR4;
			4'b0101 : outBus = outR5;
			4'b0110 : outBus = outR6;
			4'b0111 : outBus = outR7;	
			4'b1000 : outBus = outR8;
			4'b1001 : outBus = outR9;
			4'b1010 : outBus = outR10;
			4'b1011 : outBus = outR11;
			4'b1100 : outBus = outR12;
			4'b1101 : outBus = outR13;
			4'b1110 : outBus = outR14;
			4'b1111 : outBus = outR15;				
		endcase
	end
		
endmodule

module mux2to1_16bits(input [15:0] in0, input [15:0] in1, input Sel, output reg [15:0] outBus);
	
	//Write your code here
	always@(in0,in1,Sel)
	begin
		case(Sel)
			2'b00 : outBus = in0;
			2'b01 : outBus = in1;
		endcase
	end
	
endmodule

module busOutput(input [31:0] reg_rx, input mode, input rx3, output [31:0] rxOut);
	
	//Write your code here
	
	begin
		wire notrx3;
		not(notrx3,rx3);
		wire lowSelect;
		or(lowSelect,notrx3,mode);
		
		//wire [15:0]rxOutconcat1;wire [15:0]rxOutconcat2;
		mux2to1_16bits(16'b0,reg_rx[31:16], mode, rxOut[31:16]);
		mux2to1_16bits(16'b0,reg_rx[15:0], lowSelect, rxOut[15:0]);
		
		//rxOut[31:16] = rxOutconcat1;
		//rxOut[15:0] = rxOutconcat2;
		//rxOut = {rxOutconcat1 , rxOutconcat2}
		
	end
	
endmodule

module registerFile(input clk, input reset, input regWrite, input mode, input [3:0] rs, input [3:0] rt,input [3:0] rd, 
input [31:0] writeData, output [31:0] rsOut, output [31:0] rtOut);
	
	//Write your code here
	
endmodule

//////////////////////////////////////endofregfile////////////////////////////////////////


module main(
    );


endmodule
