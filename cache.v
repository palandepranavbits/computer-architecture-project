`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:57:36 11/23/2017 
// Design Name: 
// Module Name:    cache 
// Project Name: 
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
module D_FF(input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ ( negedge clk )
	begin
		if ( reset == 1'b1 )
			q = 0;
		else 
		if(regWrite == 1'b1 && decOut1b == 1'b1)
			q=d;
		end
endmodule

module D_ff_d (input clk, input reset, input regWrite, input decOut1b, input tbwrite, input Hit, input d, input init, output reg q);
	always @ ( negedge clk )
	begin
	if ( reset == 1'b1 )
		q = 0;
	else
		if ( Hit == 1'b0 ) 
		  begin
			 if ( regWrite == 1'b1 && tbwrite == 1'b1 ) begin q = init; end
			end
		else 
		  begin
			 if ( regWrite == 1'b1 && decOut1b == 1'b1 ) begin q=d; end
			end
	end
endmodule

module decoder3x8 (input [2:0] offsetIn,output reg [7:0] decoffsetout );
 always @ (offsetIn)
   begin
	 case (offsetIn)
	  3'b000: decoffsetout = 8'b00000001;
	  3'b001: decoffsetout = 8'b00000010;
	  3'b010: decoffsetout = 8'b00000100;
	  3'b011: decoffsetout = 8'b00001000;
	  3'b100: decoffsetout = 8'b00010000;
	  3'b101: decoffsetout = 8'b00100000;
	  3'b110: decoffsetout = 8'b01000000;
	  3'b111: decoffsetout = 8'b10000000;
     default:  decoffsetout = 8'b00000000;
	 endcase
	 end
endmodule	 

module decoder4x16 (input [3:0] dec_in, output reg [15:0] dec_out);
	always @ ( dec_in )
	 begin
	   case ( dec_in )
			4'b0000: dec_out=16'b0000000000000001; 
			4'b0001: dec_out=16'b0000000000000010;
			4'b0010: dec_out=16'b0000000000000100;
			4'b0011: dec_out=16'b0000000000001000;
			4'b0100: dec_out=16'b0000000000010000;
			4'b0101: dec_out=16'b0000000000100000;
			4'b0110: dec_out=16'b0000000001000000;
			4'b0111: dec_out=16'b0000000010000000;
			4'b1000: dec_out=16'b0000000100000000; 
			4'b1001: dec_out=16'b0000001000000000;
			4'b1010: dec_out=16'b0000010000000000;
			4'b1011: dec_out=16'b0000100000000000;
			4'b1100: dec_out=16'b0001000000000000;
			4'b1101: dec_out=16'b0010000000000000;
			4'b1110: dec_out=16'b0100000000000000;
			4'b1111: dec_out=16'b1000000000000000;
	   endcase
	 end
endmodule


module mux16to1_21bit (input [20:0] outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, 
							  outR12, outR13, outR14, outR15, input [3:0] select, output reg [20:0] outBus );
	always@( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or 
			   outR12 or outR13 or outR14 or outR15 or select )
   begin
   case (select)
		4'b0000: outBus=outR0;
		4'b0001: outBus=outR1;
		4'b0010: outBus=outR2;
		4'b0011: outBus=outR3;
		4'b0100: outBus=outR4;
		4'b0101: outBus=outR5;
		4'b0110: outBus=outR6;
		4'b0111: outBus=outR7;
		4'b1000: outBus=outR8;
		4'b1001: outBus=outR9;
		4'b1010: outBus=outR10;
		4'b1011: outBus=outR11;
		4'b1100: outBus=outR12;
		4'b1101: outBus=outR13;
		4'b1110: outBus=outR14;
		4'b1111: outBus=outR15;
	 endcase
	 end
endmodule

module mux16to1_4bits (input [3:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
							  outR14,outR15, input [3:0] select, output reg [3:0] outBus );
	always@( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or
				outR12 or outR13 or outR14 or outR15 or select)
	 begin
	 case (select)
		4'b0000: outBus=outR0;
		4'b0001: outBus=outR1;
		4'b0010: outBus=outR2;
		4'b0011: outBus=outR3;
		4'b0100: outBus=outR4;
		4'b0101: outBus=outR5;
		4'b0110: outBus=outR6;
		4'b0111: outBus=outR7;
		4'b1000: outBus=outR8;
		4'b1001: outBus=outR9;
		4'b1010: outBus=outR10;
		4'b1011: outBus=outR11;
		4'b1100: outBus=outR12;
		4'b1101: outBus=outR13;
		4'b1110: outBus=outR14;
		4'b1111: outBus=outR15;
	 endcase
	 end
endmodule

module mux16to1_16byte (input [127:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
								outR14,outR15, input [3:0] select, output reg [127:0] outBus );
	always @ (outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or 
				 outR12 or outR13 or outR14 or outR15 or select)
	 begin
	   case (select)
				4'b0000: outBus=outR0;
				4'b0001: outBus=outR1;
				4'b0010: outBus=outR2;
				4'b0011: outBus=outR3;
				4'b0100: outBus=outR4;
				4'b0101: outBus=outR5;
				4'b0110: outBus=outR6;
				4'b0111: outBus=outR7;
				4'b1000: outBus=outR8;
				4'b1001: outBus=outR9;
				4'b1010: outBus=outR10;
				4'b1011: outBus=outR11;
				4'b1100: outBus=outR12;
				4'b1101: outBus=outR13;
				4'b1110: outBus=outR14;
				4'b1111: outBus=outR15;
	   endcase
	 end
endmodule

//*****************
module mux4to1_16byte(input [127:0] in1, in2, in3, in4, input [1:0] select, output reg [127:0] muxOut);
  always @ ( in1 or in2 or in3 or in4 or select)
  begin
      case (select)
      2'b00: muxOut = in1;
      2'b01: muxOut = in2;
		2'b10: muxOut = in3;
      2'b11: muxOut = in4;
      endcase
	end
endmodule

module mux4to1_25bits(input [24:0] in1, in2, in3, in4, input [1:0] select, output reg [24:0] muxOut);
  always @ ( in1 or in2 or in3 or in4 or select)
  begin
      case (select)
      2'b00: muxOut = in1;
      2'b01: muxOut = in2;
		2'b10: muxOut = in3;
      2'b11: muxOut = in4;
      endcase
	end
endmodule




module mux4to1_1bit(input  in1, in2, in3, in4, input [1:0] select, output reg  muxOut);
  always @ ( in1 or in2 or in3 or in4 or select)
  begin
      case (select)
      2'b00: muxOut = in1;
      2'b01: muxOut = in2;
		2'b10: muxOut = in3;
      2'b11: muxOut = in4;
      endcase
	end
endmodule


module mux4to1_32bits(input read,input [31:0] in1, in2, in3, in4, input [1:0] select, output reg [31:0] muxOut);
  always @ ( in1 or in2 or in3 or in4 or select )
  begin
      if(read)
       begin		
      case (select)
      2'b00: muxOut = in1;
      2'b01: muxOut = in2;
		2'b10: muxOut = in3;
      2'b11: muxOut = in4;
      endcase
		end
	end
endmodule



module mux2to1_2bit(input [1:0] in1, in2, input select, output reg [1:0] muxOut);
  always @ ( in1 or in2 or select)
  begin
      case (select)
      1'b0: muxOut = in1;
      1'b1: muxOut = in2;
		
      endcase
	end
endmodule

module mux2to1_1bit(input  in1, in2, input select, output reg muxOut);
  always @ ( in1 or in2 or select)
  begin
      case (select)
      1'b0: muxOut = in1;
      1'b1: muxOut = in2;
		
      endcase
	end
endmodule
/*
module mux16to1_16bits (input [15:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
								outR14,outR15, input [3:0] select, output reg [15:0] outBus );
	always @ (outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or 
				 outR12 or outR13 or outR14 or outR15 or select)
	 begin
	   case (select)
				4'b0000: outBus=outR0;
				4'b0001: outBus=outR1;
				4'b0010: outBus=outR2;
				4'b0011: outBus=outR3;
				4'b0100: outBus=outR4;
				4'b0101: outBus=outR5;
				4'b0110: outBus=outR6;
				4'b0111: outBus=outR7;
				4'b1000: outBus=outR8;
				4'b1001: outBus=outR9;
				4'b1010: outBus=outR10;
				4'b1011: outBus=outR11;
				4'b1100: outBus=outR12;
				4'b1101: outBus=outR13;
				4'b1110: outBus=outR14;
				4'b1111: outBus=outR15;
	   endcase
	 end
endmodule

*/

module mux16to1_1bit (input outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12,
							 outR13, outR14, outR15, input [3:0] select, output reg outBus );
	always @ ( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or
				  outR12 or outR13 or outR14 or outR15 or select)
	 begin
	 case (select) 
		4'b0000: outBus=outR0;
		4'b0001: outBus=outR1;
		4'b0010: outBus=outR2;
		4'b0011: outBus=outR3;
		4'b0100: outBus=outR4;
		4'b0101: outBus=outR5;
		4'b0110: outBus=outR6;
		4'b0111: outBus=outR7;
		4'b1000: outBus=outR8;
		4'b1001: outBus=outR9;
		4'b1010: outBus=outR10;
		4'b1011: outBus=outR11;
		4'b1100: outBus=outR12;
		4'b1101: outBus=outR13;
		4'b1110: outBus=outR14;
		4'b1111: outBus=outR15;
	 endcase
	 end
endmodule



module encoder4_to_2 (input [3:0] in1, output reg [1:0] encOut, output reg Hit );
  always @ (in1)
  begin
		case(in1)
		4'b0000: Hit = 1'b0;
		4'b1000: begin encOut=2'b00; Hit=1'b1; end
		4'b0100: begin encOut=2'b01; Hit=1'b1; end
		4'b0010: begin encOut=2'b10; Hit=1'b1; end
		4'b0001: begin encOut=2'b11; Hit=1'b1; end
		endcase
  end
endmodule


//****************************************

module register1bit (input clk, input reset, input regWrite, input decOut1b, input writeData, output outR);
  D_FF d0 (clk, reset, regWrite, decOut1b, writeData, outR);
endmodule

module register4bit (input clk, input reset, input regWrite, input decOut1b, input [3:0] writeData, output [3:0] outR);
  D_FF d0 ( clk, reset, regWrite, decOut1b, writeData[0], outR[0] );
  D_FF d1 ( clk, reset, regWrite, decOut1b, writeData[1], outR[1] );
  D_FF d2 ( clk, reset, regWrite, decOut1b, writeData[2], outR[2] );
  D_FF d3 ( clk, reset, regWrite, decOut1b, writeData[3], outR[3] );
endmodule

module register21bit (input clk, input reset, input regWrite, input decOut1b, input [20:0] writeData, output [20:0] outR);
  D_FF d0  ( clk, reset, regWrite, decOut1b, writeData[0],  outR[0] );
  D_FF d1  ( clk, reset, regWrite, decOut1b, writeData[1],  outR[1] );
  D_FF d2  ( clk, reset, regWrite, decOut1b, writeData[2],  outR[2] );
  D_FF d3  ( clk, reset, regWrite, decOut1b, writeData[3],  outR[3] );
  D_FF d4  ( clk, reset, regWrite, decOut1b, writeData[4],  outR[4] );
  D_FF d5  ( clk, reset, regWrite, decOut1b, writeData[5],  outR[5] );
  D_FF d6  ( clk, reset, regWrite, decOut1b, writeData[6],  outR[6] );
  D_FF d7  ( clk, reset, regWrite, decOut1b, writeData[7],  outR[7] );
  D_FF d8  ( clk, reset, regWrite, decOut1b, writeData[8],  outR[8] );
  D_FF d9  ( clk, reset, regWrite, decOut1b, writeData[9],  outR[9] );
  D_FF d10 ( clk, reset, regWrite, decOut1b, writeData[10], outR[10] );
  D_FF d11 ( clk, reset, regWrite, decOut1b, writeData[11], outR[11] );
  D_FF d12 ( clk, reset, regWrite, decOut1b, writeData[12], outR[12] );
  D_FF d13 ( clk, reset, regWrite, decOut1b, writeData[13], outR[13] );
  D_FF d14 ( clk, reset, regWrite, decOut1b, writeData[14], outR[14] );
  D_FF d15 ( clk, reset, regWrite, decOut1b, writeData[15], outR[15] );
  D_FF d16 ( clk, reset, regWrite, decOut1b, writeData[16], outR[16] );
  D_FF d17 ( clk, reset, regWrite, decOut1b, writeData[17], outR[17] );
  D_FF d18 ( clk, reset, regWrite, decOut1b, writeData[18], outR[18] );
  D_FF d19 ( clk, reset, regWrite, decOut1b, writeData[19], outR[19] );
  D_FF d20 ( clk, reset, regWrite, decOut1b, writeData[20], outR[20] );
endmodule
//**********************************************

module Halt_Tag_Array (input clk, input reset, input haltTagWrite, input [3:0] select, input [15:0] index, 
input [3:0] haltTagIn,
	output [3:0] haltTagOut0, haltTagOut1, haltTagOut2, haltTagOut3, haltTagOut4, haltTagOut5, haltTagOut6, haltTagOut7, 
	haltTagOut8, haltTagOut9, haltTagOut10, haltTagOut11, haltTagOut12, haltTagOut13, haltTagOut14, haltTagOut15, haltdb);
	
	register4bit rht0  ( clk, reset, haltTagWrite, index[0],  haltTagIn, haltTagOut0 );
	register4bit rht1  ( clk, reset, haltTagWrite, index[1],  haltTagIn, haltTagOut1 );
	register4bit rht2  ( clk, reset, haltTagWrite, index[2],  haltTagIn, haltTagOut2 );
	register4bit rht3  ( clk, reset, haltTagWrite, index[3],  haltTagIn, haltTagOut3 );
	register4bit rht4  ( clk, reset, haltTagWrite, index[4],  haltTagIn, haltTagOut4 );
	register4bit rht5  ( clk, reset, haltTagWrite, index[5],  haltTagIn, haltTagOut5 );
	register4bit rht6  ( clk, reset, haltTagWrite, index[6],  haltTagIn, haltTagOut6 );
	register4bit rht7  ( clk, reset, haltTagWrite, index[7],  haltTagIn, haltTagOut7 );
	register4bit rht8  ( clk, reset, haltTagWrite, index[8],  haltTagIn, haltTagOut8 );
	register4bit rht9  ( clk, reset, haltTagWrite, index[9],  haltTagIn, haltTagOut9 );
	register4bit rht10 ( clk, reset, haltTagWrite, index[10], haltTagIn, haltTagOut10 );
	register4bit rht11 ( clk, reset, haltTagWrite, index[11], haltTagIn, haltTagOut11 );
	register4bit rht12 ( clk, reset, haltTagWrite, index[12], haltTagIn, haltTagOut12 );
	register4bit rht13 ( clk, reset, haltTagWrite, index[13], haltTagIn, haltTagOut13 );
	register4bit rht14 ( clk, reset, haltTagWrite, index[14], haltTagIn, haltTagOut14 );
	register4bit rht15 ( clk, reset, haltTagWrite, index[15], haltTagIn, haltTagOut15 );
	
	mux16to1_4bits haltmux ( haltTagOut0, haltTagOut1, haltTagOut2, haltTagOut3, haltTagOut4, haltTagOut5, haltTagOut6,
	haltTagOut7, haltTagOut8, haltTagOut9, haltTagOut10, haltTagOut11, haltTagOut12, haltTagOut13, haltTagOut14, haltTagOut15,
	select, haltdb );
	
endmodule


// not passing enable for halt tag comparator
module Halt_Tag_Comparator (input [3:0] in1, input [3:0] in2, output reg outC );
  always @ (in1 or in2)
  begin
      if (in1 == in2)
         outC = 1'b1;
      else
			outC = 1'b0;
  end
endmodule

//not passing enable for main tag comparator
module Main_Tag_Comparator (input [20:0] in1, input [20:0] in2, output reg outC );
  always @ (in1 or in2)
  begin
		if ( in1 == in2 )
			outC = 1'b1;
      else
         outC = 1'b0;
  end
endmodule
//

module TwoBytes (input clk, input reset, input regWrite, input decOut1b, input tbwrite, input hit, input [15:0] writeData,
					input [15:0] missData, output [15:0] outR);
  
  D_ff_d d0 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[0], missData[0], outR[0] );
  D_ff_d d1 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[1], missData[1], outR[1] );
  D_ff_d d2 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[2], missData[2], outR[2] );
  D_ff_d d3 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[3], missData[3], outR[3] );
  D_ff_d d4 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[4], missData[4], outR[4] );
  D_ff_d d5 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[5], missData[5], outR[5] );
  D_ff_d d6 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[6], missData[6], outR[6] );
  D_ff_d d7 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[7], missData[7], outR[7] );
  D_ff_d d8 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[8], missData[8], outR[8] );
  D_ff_d d9 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[9], missData[9], outR[9] );
  D_ff_d d10 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[10], missData[10], outR[10] );
  D_ff_d d11 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[11], missData[11], outR[11] );
  D_ff_d d12 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[12], missData[12], outR[12] );
  D_ff_d d13 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[13], missData[13], outR[13] );
  D_ff_d d14 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[14], missData[14], outR[14] );
  D_ff_d d15 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[15], missData[15], outR[15] );


endmodule
/*
module Data_16Byte (input clk, input reset, input dataWrite, input [2:0] selOffset, input [15:0] offset, input tbwrite,
						  input hit, input [15:0] writeData, input [127:0] missData, output [127:0] outD, output [15:0] outByte);
	
	TwoBytes b0  ( clk, reset, dataWrite, offset[0],  tbwrite, hit, writeData, missData[7:0],     outD[7:0]);
	TwoBytes b1  ( clk, reset, dataWrite, offset[1],  tbwrite, hit, writeData, missData[15:8],    outD[15:8]);
	TwoBytes b2  ( clk, reset, dataWrite, offset[2],  tbwrite, hit, writeData, missData[23:16],   outD[23:16]);
	TwoBytes b3  ( clk, reset, dataWrite, offset[3],  tbwrite, hit, writeData, missData[31:24],   outD[31:24]);
	TwoBytes b4  ( clk, reset, dataWrite, offset[4],  tbwrite, hit, writeData, missData[39:32],   outD[39:32]);
	TwoBytes b5  ( clk, reset, dataWrite, offset[5],  tbwrite, hit, writeData, missData[47:40],   outD[47:40]);
	TwoBytes b6  ( clk, reset, dataWrite, offset[6],  tbwrite, hit, writeData, missData[55:48],   outD[55:48]);
	TwoBytes b7  ( clk, reset, dataWrite, offset[7],  tbwrite, hit, writeData, missData[63:56],   outD[63:56]);
	TwoBytes b8  ( clk, reset, dataWrite, offset[8],  tbwrite, hit, writeData, missData[71:64],   outD[71:64]);
	TwoBytes b9  ( clk, reset, dataWrite, offset[9],  tbwrite, hit, writeData, missData[79:72],   outD[79:72]);
	TwoBytes b10 ( clk, reset, dataWrite, offset[10], tbwrite, hit, writeData, missData[87:80],   outD[87:80]);
	TwoBytes b11 ( clk, reset, dataWrite, offset[11], tbwrite, hit, writeData, missData[95:88],   outD[95:88]);
	TwoBytes b12 ( clk, reset, dataWrite, offset[12], tbwrite, hit, writeData, missData[103:96],  outD[103:96]);
	TwoBytes b13 ( clk, reset, dataWrite, offset[13], tbwrite, hit, writeData, missData[111:104], outD[111:104]);
	TwoBytes b14 ( clk, reset, dataWrite, offset[14], tbwrite, hit, writeData, missData[119:112], outD[119:112]);
	TwoBytes b15 ( clk, reset, dataWrite, offset[15], tbwrite, hit, writeData, missData[127:120], outD[127:120]);*/
	
	/*mux16to1_16bits data16mux ( outD[7:0], outD[15:8], outD[23:16], outD[31:24], outD[39:32], outD[47:40], outD[55:48],
	outD[63:56], outD[71:64], outD[79:72], outD[87:80], outD[95:88], outD[103:96], outD[111:104], outD[119:112],
	outD[127:120], selOffset, outByte ); */

//endmodule



module mux2to1_16bits(input [15:0] in1, in2, input select, output reg [15:0] out );
	always @ (in1 or in2 or select)
	begin
		case(select)
			1'b0: out = in1;
			1'b1: out = in2;
		endcase
	end
endmodule

module mux8to1_32bits(input [31:0] in1, in2, in3, in4, in5, in6, in7, in8, input [2:0] select, output reg [31:0] out_Word);
	always @(in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or select) 
	begin
		case(select)
			3'b000: out_Word = in1;
			3'b001: out_Word = in2;
			3'b010: out_Word = in3;
			3'b011: out_Word = in4;
			3'b100: out_Word = in5;
			3'b101: out_Word = in6;
			3'b110: out_Word = in7;
			3'b111: out_Word = in8;
		endcase
	end
endmodule

module Data_16Byte (input clk, input reset, input dataWrite, input [2:0] selOffset, input [7:0] offset,
						  input tbwrite,
						  input hit, input [15:0] writeData, input [127:0] missData, output [127:0] outD,
						  output [31:0] outWord);
	

	/*wire [15:0] towrite_b1, towrite_b2, towrite_b3, towrite_b4, towrite_b5, towrite_b6, towrite_b7;
   
	mux2to1_16bits m1(writeData[15:0], writeData[31:16], offset[1], towrite_b1);
	mux2to1_16bits m2(writeData[15:0], writeData[31:16], offset[2], towrite_b2);
	mux2to1_16bits m3(writeData[15:0], writeData[31:16], offset[3], towrite_b3);
	mux2to1_16bits m4(writeData[15:0], writeData[31:16], offset[4], towrite_b4);
	mux2to1_16bits m5(writeData[15:0], writeData[31:16], offset[5], towrite_b5);
	mux2to1_16bits m6(writeData[15:0], writeData[31:16], offset[6], towrite_b6);
	mux2to1_16bits m7(writeData[15:0], writeData[31:16], offset[7], towrite_b7);
	
	TwoBytes b0  ( clk, reset, dataWrite, offset[0],  tbwrite, hit, writeData[31:16], missData[127:112],  outD[127:112]);
	TwoBytes b1  ( clk, reset, dataWrite, offset[0] | offset[1],  tbwrite, hit, towrite_b1, missData[111:96],    outD[111:96]);
	TwoBytes b2  ( clk, reset, dataWrite, offset[1] | offset[2],  tbwrite, hit, towrite_b2, missData[95:80],   outD[95:80]);
	TwoBytes b3  ( clk, reset, dataWrite, offset[2] | offset[3],  tbwrite, hit, towrite_b3, missData[79:64],   outD[79:64]);
	TwoBytes b4  ( clk, reset, dataWrite, offset[3] | offset[4],  tbwrite, hit, towrite_b4, missData[63:48],   outD[63:48]);
	TwoBytes b5  ( clk, reset, dataWrite, offset[4] | offset[5],  tbwrite, hit, towrite_b5, missData[47:32],   outD[47:32]);
	TwoBytes b6  ( clk, reset, dataWrite, offset[5] | offset[6],  tbwrite, hit, towrite_b6, missData[31:16],   outD[31:16]);
	TwoBytes b7  ( clk, reset, dataWrite, offset[6] | offset[7],  tbwrite, hit, towrite_b7, missData[15:0],   outD[15:0]);
	*/
	TwoBytes b0  ( clk, reset, dataWrite, offset[0],  tbwrite, hit, writeData, missData[15:0],     outD[15:0]);
	TwoBytes b1  ( clk, reset, dataWrite, offset[1],  tbwrite, hit, writeData, missData[31:16],    outD[31:16]);
	TwoBytes b2  ( clk, reset, dataWrite, offset[2],  tbwrite, hit, writeData, missData[47:32],   outD[47:32]);
	TwoBytes b3  ( clk, reset, dataWrite, offset[3],  tbwrite, hit, writeData, missData[63:48],   outD[63:48]);
	TwoBytes b4  ( clk, reset, dataWrite, offset[4],  tbwrite, hit, writeData, missData[79:64],   outD[79:64]);
	TwoBytes b5  ( clk, reset, dataWrite, offset[5],  tbwrite, hit, writeData, missData[95:80],   outD[95:80]);
	TwoBytes b6  ( clk, reset, dataWrite, offset[6],  tbwrite, hit, writeData, missData[111:96],   outD[111:96]);
	TwoBytes b7  ( clk, reset, dataWrite, offset[7],  tbwrite, hit, writeData, missData[127:112],   outD[127:112]);
	
	
	
	mux8to1_32bits mux_out_word(outD[31:0], outD[47:16], outD[63:32], outD[79:48], outD[95:64], outD[111:80], outD[127:96], 
	{outD[127:112],16'd0}, selOffset,	outWord);
	
endmodule

module mux16to1_32bits(input [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
								outR14,outR15, input [3:0] select, output reg [31:0] outBus );
	always @ (outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or 
				 outR12 or outR13 or outR14 or outR15 or select)
	 begin
	   case (select)
				4'b0000: outBus=outR0;
				4'b0001: outBus=outR1;
				4'b0010: outBus=outR2;
				4'b0011: outBus=outR3;
				4'b0100: outBus=outR4;
				4'b0101: outBus=outR5;
				4'b0110: outBus=outR6;
				4'b0111: outBus=outR7;
				4'b1000: outBus=outR8;
				4'b1001: outBus=outR9;
				4'b1010: outBus=outR10;
				4'b1011: outBus=outR11;
				4'b1100: outBus=outR12;
				4'b1101: outBus=outR13;
				4'b1110: outBus=outR14;
				4'b1111: outBus=outR15;
	   endcase
	 end
endmodule	 

module way (input clk, input reset, input mainTagWrite, input enWrite, input validWrite, input dirtyWrite, input dirtyIn, 
				input hit, input [3:0] select, input [15:0] index, input [2:0] addOffset, input [7:0] offset, 
				input [20:0] AddressTag, input [15:0] writeData, input [127:0] missData, output [20:0] mainTagOut0, mainTagOut1,
				mainTagOut2, mainTagOut3, mainTagOut4, mainTagOut5, mainTagOut6, mainTagOut7, mainTagOut8, mainTagOut9,
				mainTagOut10, mainTagOut11, mainTagOut12, mainTagOut13, mainTagOut14, mainTagOut15, maintagdb, output [127:0] outD0,
				outD1, outD2, outD3, outD4, outD5, outD6, outD7, outD8, outD9, outD10, outD11, outD12, outD13, outD14, outD15,
				outdb, output [31:0] outB0, outB1, outB2, outB3, outB4, outB5, outB6, outB7, outB8, outB9, outB10, outB11, outB12,
				outB13, outB14, outB15, outbdb, output validOut0, validOut1, validOut2, validOut3, validOut4, validOut5, validOut6,
				validOut7, validOut8, validOut9, validOut10, validOut11, validOut12, validOut13, validOut14, validOut15, validdb, 
            output dirtyOut0, dirtyOut1, dirtyOut2, dirtyOut3, dirtyOut4, dirtyOut5, dirtyOut6, dirtyOut7, dirtyOut8, dirtyOut9,
				dirtyOut10, dirtyOut11, dirtyOut12, dirtyOut13, dirtyOut14, dirtyOut15, dirtydb);
  
	register21bit rmt0  ( clk, reset, mainTagWrite, index[0],  AddressTag, mainTagOut0 );
	register21bit rmt1  ( clk, reset, mainTagWrite, index[1],  AddressTag, mainTagOut1 );
	register21bit rmt2  ( clk, reset, mainTagWrite, index[2],  AddressTag, mainTagOut2 );
	register21bit rmt3  ( clk, reset, mainTagWrite, index[3],  AddressTag, mainTagOut3 );
	register21bit rmt4  ( clk, reset, mainTagWrite, index[4],  AddressTag, mainTagOut4 );
	register21bit rmt5  ( clk, reset, mainTagWrite, index[5],  AddressTag, mainTagOut5 );
	register21bit rmt6  ( clk, reset, mainTagWrite, index[6],  AddressTag, mainTagOut6 );
	register21bit rmt7  ( clk, reset, mainTagWrite, index[7],  AddressTag, mainTagOut7 );
	register21bit rmt8  ( clk, reset, mainTagWrite, index[8],  AddressTag, mainTagOut8 );
	register21bit rmt9  ( clk, reset, mainTagWrite, index[9],  AddressTag, mainTagOut9 );
	register21bit rmt10 ( clk, reset, mainTagWrite, index[10], AddressTag, mainTagOut10 );
	register21bit rmt11 ( clk, reset, mainTagWrite, index[11], AddressTag, mainTagOut11 );
	register21bit rmt12 ( clk, reset, mainTagWrite, index[12], AddressTag, mainTagOut12 );
	register21bit rmt13 ( clk, reset, mainTagWrite, index[13], AddressTag, mainTagOut13 );
	register21bit rmt14 ( clk, reset, mainTagWrite, index[14], AddressTag, mainTagOut14 );
	register21bit rmt15 ( clk, reset, mainTagWrite, index[15], AddressTag, mainTagOut15 );

	mux16to1_21bit maintagmux ( mainTagOut0, mainTagOut1, mainTagOut2, mainTagOut3, mainTagOut4, mainTagOut5, mainTagOut6,
	mainTagOut7, mainTagOut8, mainTagOut9, mainTagOut10, mainTagOut11, mainTagOut12, mainTagOut13, mainTagOut14, mainTagOut15,
	select, maintagdb);
	
	Data_16Byte db0  (clk, reset, enWrite, addOffset, offset, index[0],  hit, writeData, missData, outD0,  outB0);
	Data_16Byte db1  (clk, reset, enWrite, addOffset, offset, index[1],  hit, writeData, missData, outD1,  outB1);
	Data_16Byte db2  (clk, reset, enWrite, addOffset, offset, index[2],  hit, writeData, missData, outD2,  outB2);
	Data_16Byte db3  (clk, reset, enWrite, addOffset, offset, index[3],  hit, writeData, missData, outD3,  outB3);
	Data_16Byte db4  (clk, reset, enWrite, addOffset, offset, index[4],  hit, writeData, missData, outD4,  outB4);
	Data_16Byte db5  (clk, reset, enWrite, addOffset, offset, index[5],  hit, writeData, missData, outD5,  outB5);
	Data_16Byte db6  (clk, reset, enWrite, addOffset, offset, index[6],  hit, writeData, missData, outD6,  outB6);
	Data_16Byte db7  (clk, reset, enWrite, addOffset, offset, index[7],  hit, writeData, missData, outD7,  outB7);
	Data_16Byte db8  (clk, reset, enWrite, addOffset, offset, index[8],  hit, writeData, missData, outD8,  outB8);
	Data_16Byte db9  (clk, reset, enWrite, addOffset, offset, index[9],  hit, writeData, missData, outD9,  outB9);
	Data_16Byte db10 (clk, reset, enWrite, addOffset, offset, index[10], hit, writeData, missData, outD10, outB10);
	Data_16Byte db11 (clk, reset, enWrite, addOffset, offset, index[11], hit, writeData, missData, outD11, outB11);
	Data_16Byte db12 (clk, reset, enWrite, addOffset, offset, index[12], hit, writeData, missData, outD12, outB12);
	Data_16Byte db13 (clk, reset, enWrite, addOffset, offset, index[13], hit, writeData, missData, outD13, outB13);
	Data_16Byte db14 (clk, reset, enWrite, addOffset, offset, index[14], hit, writeData, missData, outD14, outB14);
	Data_16Byte db15 (clk, reset, enWrite, addOffset, offset, index[15], hit, writeData, missData, outD15, outB15);
	
	mux16to1_16byte data16bytemux ( outD0, outD1, outD2, outD3, outD4, outD5, outD6, outD7, outD8, outD9, outD10, outD11, outD12, outD13, 
		outD14, outD15, select, outdb );
		
	//mux16to1_16bits data2bytemux ( outB0, outB1, outB2, outB3, outB4, outB5, outB6, outB7, outB8, outB9, outB10, outB11, outB12, outB13, 
		//outB14, outB15, select, outbdb );
		
	mux16to1_32bits datawordmux ( outB0, outB1, outB2, outB3, outB4, outB5, outB6, outB7, outB8, outB9, outB10, outB11, outB12, outB13, 
		outB14, outB15, select, outbdb );
	
	register1bit valid0  (clk, reset, validWrite, index[0],  1'b1, validOut0);
	register1bit valid1  (clk, reset, validWrite, index[1],  1'b1, validOut1);
	register1bit valid2  (clk, reset, validWrite, index[2],  1'b1, validOut2);
	register1bit valid3  (clk, reset, validWrite, index[3],  1'b1, validOut3);
	register1bit valid4  (clk, reset, validWrite, index[4],  1'b1, validOut4);
	register1bit valid5  (clk, reset, validWrite, index[5],  1'b1, validOut5);
	register1bit valid6  (clk, reset, validWrite, index[6],  1'b1, validOut6);
	register1bit valid7  (clk, reset, validWrite, index[7],  1'b1, validOut7);
	register1bit valid8  (clk, reset, validWrite, index[8],  1'b1, validOut8);
	register1bit valid9  (clk, reset, validWrite, index[9],  1'b1, validOut9);
	register1bit valid10 (clk, reset, validWrite, index[10], 1'b1, validOut10);
	register1bit valid11 (clk, reset, validWrite, index[11], 1'b1, validOut11);
	register1bit valid12 (clk, reset, validWrite, index[12], 1'b1, validOut12);
	register1bit valid13 (clk, reset, validWrite, index[13], 1'b1, validOut13);
	register1bit valid14 (clk, reset, validWrite, index[14], 1'b1, validOut14);
	register1bit valid15 (clk, reset, validWrite, index[15], 1'b1, validOut15);
	mux16to1_1bit validmux( validOut0, validOut1, validOut2, validOut3, validOut4, validOut5, validOut6, validOut7, validOut8, validOut9, 
		validOut10, validOut11, validOut12, validOut13, validOut14, validOut15, select, validdb);
  
	register1bit dirty0  (clk, reset, dirtyWrite, index[0],  dirtyIn, dirtyOut0);
	register1bit dirty1  (clk, reset, dirtyWrite, index[1],  dirtyIn, dirtyOut1);
	register1bit dirty2  (clk, reset, dirtyWrite, index[2],  dirtyIn, dirtyOut2);
	register1bit dirty3  (clk, reset, dirtyWrite, index[3],  dirtyIn, dirtyOut3);
	register1bit dirty4  (clk, reset, dirtyWrite, index[4],  dirtyIn, dirtyOut4);
	register1bit dirty5  (clk, reset, dirtyWrite, index[5],  dirtyIn, dirtyOut5);
	register1bit dirty6  (clk, reset, dirtyWrite, index[6],  dirtyIn, dirtyOut6);
	register1bit dirty7  (clk, reset, dirtyWrite, index[7],  dirtyIn, dirtyOut7);
	register1bit dirty8  (clk, reset, dirtyWrite, index[8],  dirtyIn, dirtyOut8);
	register1bit dirty9  (clk, reset, dirtyWrite, index[9],  dirtyIn, dirtyOut9);
	register1bit dirty10 (clk, reset, dirtyWrite, index[10], dirtyIn, dirtyOut10);
	register1bit dirty11 (clk, reset, dirtyWrite, index[11], dirtyIn, dirtyOut11);
	register1bit dirty12 (clk, reset, dirtyWrite, index[12], dirtyIn, dirtyOut12);
	register1bit dirty13 (clk, reset, dirtyWrite, index[13], dirtyIn, dirtyOut13);
	register1bit dirty14 (clk, reset, dirtyWrite, index[14], dirtyIn, dirtyOut14);
	register1bit dirty15 (clk, reset, dirtyWrite, index[15], dirtyIn, dirtyOut15);
	
	mux16to1_1bit dirtymux ( dirtyOut0, dirtyOut1, dirtyOut2, dirtyOut3, dirtyOut4, dirtyOut5, dirtyOut6, dirtyOut7, dirtyOut8,
	dirtyOut9, dirtyOut10, dirtyOut11, dirtyOut12, dirtyOut13, dirtyOut14, dirtyOut15, select, dirtydb );

endmodule

module tristatebuffer( input [20:0] in1, input enable, output [20:0] out);
	assign out = enable?in1:'bz;
		
endmodule


module lfsr (input clk, input rst, output reg [1:0] out);

  wire feedback;

  assign feedback = ~(out[1] ^ out[0]);

always @(posedge clk, posedge rst)
  begin
    if (rst)
      out = 2'b0;
    else
      out = {out[0],feedback};
  end

endmodule



module cachecontrol(input clk,input reset, input memread, input memwrite,input easyhit,input hit, 
						  input [1:0] waysel, output reg [3:0] datawrite, output reg [3:0] tagwrite, output reg [3:0] dirtywrite, 
						  output reg [3:0] validwrite, output reg [3:0] dataread);
    
     reg [3:0] state;
     always@(negedge clk)
     begin
     	if(reset)
     	   state = 4'd6;

        else
         begin
        	case(state)
        	  4'd6:state = 4'd0;
        	  4'd0:
        	      begin
	        	      if (easyhit)
	        	         state = 4'd1;
	        	      else   
	        	      	 state = 4'd3;
        	      end
        	  4'd1:
        	      begin
        	         if (hit && memread) 
        	            state = 4'd2;
        	         else if (hit && memwrite)
        	            state  = 4'd4; 
        	         else
        	            state = 4'd3;     	
       	       end 
       	      4'd2:
       	           state = 4'd6;       
              4'd3:
                   if(memread)
                     state = 4'd2;
                   else if(memwrite)
                      state = 4'd4;
              4'd4:
        		  state = 4'd6;
        endcase
		  end
     end

     always @(state)
     begin
      	case(state)
      		4'd6:
      		  begin
      		  end
      		4'd0:
      		  begin  
                //replace = 0; 
                datawrite = 4'b0000; 
                tagwrite = 4'b0000;
                dirtywrite = 4'b0000;
                validwrite = 4'b0000;
                dataread = 4'b0000;
              end
            4'd1:
               begin
                //replace = 0 
                datawrite = 4'b0000; 
                tagwrite = 4'b0000;
                dirtywrite = 4'b0000;
                validwrite = 4'b0000;
                dataread = 4'b0000;
               end
            4'd2:
                begin
                //replace = 0 
                datawrite = 4'b0000;
                tagwrite = 4'b0000;
                dirtywrite = 4'b0000;
                validwrite = 4'b0000;
                dataread = 4'b1111;    	
                end      
             4'd3:
                begin
                case(waysel)
                	2'b00:
                	begin
                		datawrite = 4'b1000;
                		tagwrite = 4'b1000;
                		dirtywrite = 4'b1000;
                		validwrite = 4'b1000;
               		 end
               		 2'b01:
               		 begin
                		datawrite = 4'b0100;
                		tagwrite = 4'b0100;
                		dirtywrite = 4'b0100;
                		validwrite = 4'b0100;
               		 end
               		 2'b10:
               		 begin
                		datawrite = 4'b0010;
                		tagwrite = 4'b0010;
                		dirtywrite = 4'b0010;
                		validwrite = 4'b0010;
               		 end
               		 2'b11:
               		 begin
                		datawrite = 4'b0001;
                		tagwrite = 4'b0001;
                		dirtywrite = 4'b0001;
                		validwrite = 4'b0001;
               		 end
                endcase
                end 
              4'd4:
                begin
                case(waysel)
                	2'b00:
                	begin
                		datawrite = 4'b1000;
                		tagwrite = 4'b1000;
                		dirtywrite = 4'b1000;
                		validwrite = 4'b1000;
               	end
               	2'b01:
               	begin
                		datawrite = 4'b0100;
                		tagwrite = 4'b0100;
                		dirtywrite = 4'b0100;
                		validwrite = 4'b0100;
               	end
               	2'b10:
               	begin
                		datawrite = 4'b0010;
                		tagwrite = 4'b0010;
                		dirtywrite = 4'b0010;
                		validwrite = 4'b0010;
               	end
               	2'b11:
               	begin
                		datawrite = 4'b0001;
                		tagwrite = 4'b0001;
                		dirtywrite = 4'b0001;
                		validwrite = 4'b0001;
               	end
                endcase
                end  
               4'd5:
                begin
                datawrite = 4'b0000; 
                tagwrite = 4'b0000;
                dirtywrite = 4'b0000;
                validwrite = 4'b0000;
                dataread = 4'b0000;
                end       
				endcase
				end

endmodule


module cache ( input clk, input reset, input [15:0]  TwoByteIntoCache, input [127:0] BlockIntoTheCache, input [24:0] tagIn,
				   input [3:0] indexIn, input [2:0] offsetIn, input memWrite, input memRead, output hit, output valid, output dirty,
				   output [1:0] waysel, output [24:0] tag_out, output [127:0] dataGettingReplaced, 
				   output [31:0] WordDataOutFromCache, output writeBackSignalToMainMemory );

	wire [15:0] decindexout;
   decoder4x16 decindex( indexIn, decindexout );
  
   wire [7:0] decoffsetout;
   decoder3x8 decoffset( offsetIn, decoffsetout );
  
	wire tagway1;
	wire [3:0] ht1out0, ht1out1, ht1out2, ht1out3, ht1out4, ht1out5, ht1out6, ht1out7, ht1out8, ht1out9, ht1out10, ht1out11,
	   		  ht1out12, ht1out13, ht1out14, ht1out15, ht1outdb;
	Halt_Tag_Array hta1 ( clk, reset, tagway1, indexIn, decindexout, tagIn[3:0], ht1out0, ht1out1, ht1out2, ht1out3, ht1out4,
		ht1out5, ht1out6, ht1out7, ht1out8, ht1out9, ht1out10, ht1out11, ht1out12, ht1out13, ht1out14, ht1out15, ht1outdb);
  
  
	wire tagway2;
	wire [3:0] ht2out0, ht2out1, ht2out2, ht2out3, ht2out4, ht2out5, ht2out6, ht2out7, ht2out8, ht2out9, ht2out10, ht2out11,
	   		  ht2out12, ht2out13, ht2out14, ht2out15, ht2outdb;
	Halt_Tag_Array hta2 ( clk, reset, tagway2, indexIn, decindexout, tagIn[3:0], ht2out0, ht2out1, ht2out2, ht2out3, ht2out4,
		ht2out5, ht2out6, ht2out7, ht2out8, ht2out9, ht2out10, ht2out11, ht2out12, ht2out13, ht2out14, ht2out15, ht2outdb);
  
  
	wire tagway3;
	wire [3:0] ht3out0, ht3out1, ht3out2, ht3out3, ht3out4, ht3out5, ht3out6, ht3out7, ht3out8, ht3out9, ht3out10, ht3out11, 
	   		  ht3out12, ht3out13, ht3out14, ht3out15, ht3outdb;
	Halt_Tag_Array hta3 ( clk, reset, tagway3, indexIn, decindexout, tagIn[3:0], ht3out0, ht3out1, ht3out2, ht3out3, ht3out4,
		ht3out5, ht3out6, ht3out7, ht3out8, ht3out9, ht3out10, ht3out11, ht3out12, ht3out13, ht3out14, ht3out15, ht3outdb);
  
	wire tagway4;
	wire [3:0] ht4out0, ht4out1, ht4out2, ht4out3, ht4out4, ht4out5, ht4out6, ht4out7, ht4out8, ht4out9, ht4out10, ht4out11,
				  ht4out12, ht4out13, ht4out14, ht4out15, ht4outdb;
	Halt_Tag_Array hta4 ( clk, reset, tagway4, indexIn, decindexout, tagIn[3:0], ht4out0, ht4out1, ht4out2, ht4out3, ht4out4,
      ht4out5, ht4out6, ht4out7, ht4out8, ht4out9, ht4out10, ht4out11, ht4out12, ht4out13, ht4out14, ht4out15, ht4outdb);
  
  
  
  
	wire out1comp0, out1comp1, out1comp2, out1comp3, out1comp4, out1comp5, out1comp6, out1comp7, out1comp8, out1comp9,
	out1comp10, out1comp11, out1comp12, out1comp13, out1comp14, out1comp15;
   Halt_Tag_Comparator ch1t0  ( tagIn[3:0], ht1out0,  out1comp0 );
	Halt_Tag_Comparator ch1t1  ( tagIn[3:0], ht1out1,  out1comp1 );
	Halt_Tag_Comparator ch1t2  (  tagIn[3:0], ht1out2,  out1comp2 );
	Halt_Tag_Comparator ch1t3  ( tagIn[3:0], ht1out3,  out1comp3 );
	Halt_Tag_Comparator ch1t4  ( tagIn[3:0], ht1out4,  out1comp4 );
	Halt_Tag_Comparator ch1t5  ( tagIn[3:0], ht1out5,  out1comp5 );
	Halt_Tag_Comparator ch1t6  ( tagIn[3:0], ht1out6,  out1comp6 );
	Halt_Tag_Comparator ch1t7  ( tagIn[3:0], ht1out7,  out1comp7 );
	Halt_Tag_Comparator ch1t8  ( tagIn[3:0], ht1out8,  out1comp8 );
	Halt_Tag_Comparator ch1t9  ( tagIn[3:0], ht1out9,  out1comp9 );
	Halt_Tag_Comparator ch1t10 ( tagIn[3:0], ht1out10, out1comp10 );
	Halt_Tag_Comparator ch1t11 ( tagIn[3:0], ht1out11, out1comp11 );
	Halt_Tag_Comparator ch1t12 ( tagIn[3:0], ht1out12, out1comp12 );
	Halt_Tag_Comparator ch1t13 ( tagIn[3:0], ht1out13, out1comp13 );
   Halt_Tag_Comparator ch1t14 ( tagIn[3:0], ht1out14, out1comp14 );
	Halt_Tag_Comparator ch1t15 ( tagIn[3:0], ht1out15, out1comp15 );
	
	wire or16inp1;
	 assign or16inp1 = (out1comp0 & decindexout[0]) | (out1comp1 & decindexout[1]) | (out1comp2 & decindexout[2]) |
							 (out1comp3 & decindexout[3]) | (out1comp4 & decindexout[4]) | (out1comp5 & decindexout[5]) |
							 (out1comp6 & decindexout[6]) | (out1comp7 & decindexout[7]) | (out1comp8 & decindexout[8]) |
							 (out1comp9 & decindexout[9]) | (out1comp10 & decindexout[10]) | (out1comp11 & decindexout[11]) |
							 (out1comp12 & decindexout[12]) | (out1comp13 & decindexout[13]) | (out1comp14 & decindexout[14]) |
							 (out1comp15 & decindexout[15]);
	
	
	 wire out2comp0, out2comp1, out2comp2, out2comp3, out2comp4, out2comp5, out2comp6, out2comp7, out2comp8, out2comp9, 
	 out2comp10, out2comp11, out2comp12, out2comp13, out2comp14, out2comp15;
	 Halt_Tag_Comparator ch2t0  (  tagIn[3:0], ht2out0,  out2comp0 );
	 Halt_Tag_Comparator ch2t1  (  tagIn[3:0], ht2out1,  out2comp1 );
	 Halt_Tag_Comparator ch2t2  (  tagIn[3:0], ht2out2,  out2comp2 );
	 Halt_Tag_Comparator ch2t3  (  tagIn[3:0], ht2out3,  out2comp3 );
	 Halt_Tag_Comparator ch2t4  (  tagIn[3:0], ht2out4,  out2comp4 );
	 Halt_Tag_Comparator ch2t5  (  tagIn[3:0], ht2out5,  out2comp5 );
	 Halt_Tag_Comparator ch2t6  (  tagIn[3:0], ht2out6,  out2comp6 );
	 Halt_Tag_Comparator ch2t7  (  tagIn[3:0], ht2out7,  out2comp7 );
	 Halt_Tag_Comparator ch2t8  (  tagIn[3:0], ht2out8,  out2comp8 );
	 Halt_Tag_Comparator ch2t9  (  tagIn[3:0], ht2out9,  out2comp9 );
	 Halt_Tag_Comparator ch2t10 (  tagIn[3:0], ht2out10, out2comp10 );
	 Halt_Tag_Comparator ch2t11 (  tagIn[3:0], ht2out11, out2comp11 );
	 Halt_Tag_Comparator ch2t12 (  tagIn[3:0], ht2out12, out2comp12 );
	 Halt_Tag_Comparator ch2t13 (  tagIn[3:0], ht2out13, out2comp13 );
	 Halt_Tag_Comparator ch2t14 (  tagIn[3:0], ht2out14, out2comp14 );
	 Halt_Tag_Comparator ch2t15 (  tagIn[3:0], ht2out15, out2comp15 );
  
  
    wire or16inp2;
	 assign or16inp2 = (out2comp0 & decindexout[0]) | (out2comp1 & decindexout[1]) | (out2comp2 & decindexout[2]) |
							 (out2comp3 & decindexout[3]) | (out2comp4 & decindexout[4]) | (out2comp5 & decindexout[5]) |
							 (out2comp6 & decindexout[6]) | (out2comp7 & decindexout[7]) | (out2comp8 & decindexout[8]) |
							 (out2comp9 & decindexout[9]) | (out2comp10 & decindexout[10]) | (out2comp11 & decindexout[11]) |
							 (out2comp12 & decindexout[12]) | (out2comp13 & decindexout[13]) | (out2comp14 & decindexout[14]) |
							 (out2comp15 & decindexout[15]);
  
    wire out3comp0,out3comp1,out3comp2,out3comp3,out3comp4,out3comp5,out3comp6,out3comp7,out3comp8,out3comp9,
	 out3comp10,out3comp11,out3comp12,out3comp13,out3comp14, out3comp15;
	 Halt_Tag_Comparator ch3t0  (  tagIn[3:0], ht3out0,  out3comp0 );
	 Halt_Tag_Comparator ch3t1  (  tagIn[3:0], ht3out1,  out3comp1 );
	 Halt_Tag_Comparator ch3t2  (  tagIn[3:0], ht3out2,  out3comp2 );
	 Halt_Tag_Comparator ch3t3  (  tagIn[3:0], ht3out3,  out3comp3 );
	 Halt_Tag_Comparator ch3t4  (  tagIn[3:0], ht3out4,  out3comp4 );
	 Halt_Tag_Comparator ch3t5  (  tagIn[3:0], ht3out5,  out3comp5 );
	 Halt_Tag_Comparator ch3t6  (  tagIn[3:0], ht3out6,  out3comp6 );
	 Halt_Tag_Comparator ch3t7  (  tagIn[3:0], ht3out7,  out3comp7 );
	 Halt_Tag_Comparator ch3t8  (  tagIn[3:0], ht3out8,  out3comp8 );
	 Halt_Tag_Comparator ch3t9  (  tagIn[3:0], ht3out9,  out3comp9 );
	 Halt_Tag_Comparator ch3t10 (  tagIn[3:0], ht3out10, out3comp10 );
	 Halt_Tag_Comparator ch3t11 (  tagIn[3:0], ht3out11, out3comp11 );
	 Halt_Tag_Comparator ch3t12 (  tagIn[3:0], ht3out12, out3comp12 );
	 Halt_Tag_Comparator ch3t13 (  tagIn[3:0], ht3out13, out3comp13 );
	 Halt_Tag_Comparator ch3t14 (  tagIn[3:0], ht3out14, out3comp14 );
	 Halt_Tag_Comparator ch3t15 (  tagIn[3:0], ht3out15, out3comp15 );
	 
	 
	 wire or16inp3;
	 assign or16inp3 = (out3comp0 & decindexout[0]) | (out3comp1 & decindexout[1]) | (out3comp2 & decindexout[2]) |
							 (out3comp3 & decindexout[3]) | (out3comp4 & decindexout[4]) | (out3comp5 & decindexout[5]) |
							 (out3comp6 & decindexout[6]) | (out3comp7 & decindexout[7]) | (out3comp8 & decindexout[8]) |
							 (out3comp9 & decindexout[9]) | (out3comp10 & decindexout[10]) | (out3comp11 & decindexout[11]) |
							 (out3comp12 & decindexout[12]) | (out3comp13 & decindexout[13]) | (out3comp14 & decindexout[14]) |
							 (out3comp15 & decindexout[15]);
	 
	 
    wire out4comp0,out4comp1,out4comp2,out4comp3,out4comp4,out4comp5,out4comp6,out4comp7,out4comp8,out4comp9,
	 out4comp10,out4comp11,out4comp12,out4comp13,out4comp14,out4comp15; 
	 Halt_Tag_Comparator ch4t0  (  tagIn[3:0], ht4out0,  out4comp0 );
	 Halt_Tag_Comparator ch4t1  (  tagIn[3:0], ht4out1,  out4comp1 );
	 Halt_Tag_Comparator ch4t2 (  tagIn[3:0], ht4out2,  out4comp2 );
	 Halt_Tag_Comparator ch4t3  (  tagIn[3:0], ht4out3,  out4comp3 );
	 Halt_Tag_Comparator ch4t4  (  tagIn[3:0], ht4out4,  out4comp4 );
	 Halt_Tag_Comparator ch4t5  (  tagIn[3:0], ht4out5,  out4comp5 );
	 Halt_Tag_Comparator ch4t6  (  tagIn[3:0], ht4out6,  out4comp6 );
	 Halt_Tag_Comparator ch4t7  (  tagIn[3:0], ht4out7,  out4comp7 );
	 Halt_Tag_Comparator ch4t8  (  tagIn[3:0], ht4out8,  out4comp8 );
	 Halt_Tag_Comparator ch4t9  (  tagIn[3:0], ht4out9,  out4comp9 );
	 Halt_Tag_Comparator ch4t10 (  tagIn[3:0], ht4out10, out4comp10 );
	 Halt_Tag_Comparator ch4t11 (  tagIn[3:0], ht4out11, out4comp11 );
	 Halt_Tag_Comparator ch4t12 (  tagIn[3:0], ht4out12, out4comp12 );
	 Halt_Tag_Comparator ch4t13 (  tagIn[3:0], ht4out13, out4comp13 );
	 Halt_Tag_Comparator ch4t14 (  tagIn[3:0], ht4out14, out4comp14 );
	 Halt_Tag_Comparator ch4t15 (  tagIn[3:0], ht4out15, out4comp15 );
  
  
	 wire or16inp4;
	 assign or16inp4 = (out4comp0 & decindexout[0]) | (out4comp1 & decindexout[1]) | (out4comp2 & decindexout[2]) |
							 (out4comp3 & decindexout[3]) | (out4comp4 & decindexout[4]) | (out4comp5 & decindexout[5]) |
							 (out4comp6 & decindexout[6]) | (out4comp7 & decindexout[7]) | (out4comp8 & decindexout[8]) |
							 (out4comp9 & decindexout[9]) | (out4comp10 & decindexout[10]) | (out4comp11 & decindexout[11]) |
							 (out4comp12 & decindexout[12]) | (out4comp13 & decindexout[13]) | (out4comp14 & decindexout[14]) |
							 (out4comp15 & decindexout[15]);
  
  
  //wire counterwrite, counterin; 
  //wire outc0, outc1, outc2, outc3, outc4, outc5, outc6, outc7, outc8, outc9, outc10, outc11, outc12, outc13, outc14, outc15, 
  //outcb;
  //counter c ( clk, reset, counterwrite, indexIn, decindexout, counterin, outc0, outc1, outc2, outc3, outc4, outc5, outc6, 
  //outc7, outc8, outc9, outc10, outc11, outc12, outc13, outc14, outc15, outcb); 
  
  wire dataway1, validway1, dirtyway1, dirtyin1;
  wire [20:0] mt1out0, mt1out1, mt1out2, mt1out3, mt1out4, mt1out5, mt1out6, mt1out7, mt1out8, mt1out9, mt1out10, mt1out11,
  mt1out12, mt1out13, mt1out14, mt1out15, mt1outdb;
  wire [127:0] out1d0, out1d1, out1d2, out1d3, out1d4, out1d5, out1d6, out1d7, out1d8, out1d9, out1d10, out1d11, out1d12,
  out1d13, out1d14, out1d15, out1db;
  wire [31:0] out1b0, out1b1, out1b2, out1b3, out1b4, out1b5, out1b6, out1b7, out1b8, out1b9, out1b10, out1b11, out1b12, out1b13,
  out1b14, out1b15, out1bdb;
  wire v1out0, v1out1, v1out2, v1out3, v1out4, v1out5, v1out6, v1out7, v1out8, v1out9, v1out10, v1out11, v1out12, v1out13,
  v1out14, v1out15, v1outdb;
  wire d1out0, d1out1, d1out2, d1out3, d1out4, d1out5, d1out6, d1out7, d1out8, d1out9, d1out10, d1out11, d1out12, d1out13,
  d1out14, d1out15, d1outdb;
  way way1( clk, reset, tagway1, dataway1, validway1, dirtyway1, dirtyin1, hit, indexIn, decindexout, offsetIn, decoffsetout,
				tagIn[24:4],  TwoByteIntoCache, BlockIntoTheCache, mt1out0, mt1out1, mt1out2, mt1out3, mt1out4, mt1out5, mt1out6,
				mt1out7, mt1out8, mt1out9, mt1out10, mt1out11, mt1out12, mt1out13, mt1out14, mt1out15, mt1outdb, out1d0, out1d1,
				out1d2, out1d3, out1d4, out1d5, out1d6, out1d7, out1d8, out1d9, out1d10, out1d11, out1d12, out1d13, out1d14,
				out1d15, out1db, out1b0, out1b1, out1b2, out1b3, out1b4, out1b5, out1b6, out1b7, out1b8, out1b9, out1b10, out1b11,
				out1b12, out1b13, out1b14, out1b15, out1bdb, v1out0, v1out1, v1out2, v1out3, v1out4, v1out5, v1out6, v1out7, v1out8,
				v1out9, v1out10, v1out11, v1out12, v1out13, v1out14, v1out15, v1outdb, d1out0, d1out1, d1out2, d1out3, d1out4,
				d1out5, d1out6, d1out7, d1out8, d1out9, d1out10, d1out11, d1out12, d1out13, d1out14, d1out15, d1outdb);
  
  
  wire dataway2, validway2, dirtyway2, dirtyin2;
  wire [20:0] mt2out0, mt2out1, mt2out2, mt2out3, mt2out4, mt2out5, mt2out6, mt2out7, mt2out8, mt2out9, mt2out10, mt2out11,
  mt2out12, mt2out13, mt2out14, mt2out15, mt2outdb;
  wire [127:0] out2d0, out2d1, out2d2, out2d3, out2d4, out2d5, out2d6, out2d7, out2d8, out2d9, out2d10, out2d11, out2d12,
  out2d13, out2d14, out2d15, out2db;
  wire [31:0] out2b0, out2b1, out2b2, out2b3, out2b4, out2b5, out2b6, out2b7, out2b8, out2b9, out2b10, out2b11, out2b12, out2b13,
  out2b14, out2b15, out2bdb;
  wire v2out0, v2out1, v2out2, v2out3, v2out4, v2out5, v2out6, v2out7, v2out8, v2out9, v2out10, v2out11, v2out12, v2out13,
  v2out14, v2out15, v2outdb;
  wire d2out0, d2out1, d2out2, d2out3, d2out4, d2out5, d2out6, d2out7, d2out8, d2out9, d2out10, d2out11, d2out12, d2out13,
  d2out14, d2out15, d2outdb;
  way way2( clk, reset, tagway2, dataway2, validway2, dirtyway2, dirtyin2, hit, indexIn, decindexout, offsetIn, decoffsetout,
				tagIn[24:4],  TwoByteIntoCache, BlockIntoTheCache, mt2out0, mt2out1, mt2out2, mt2out3, mt2out4, mt2out5, mt2out6,
				mt2out7, mt2out8, mt2out9, mt2out10, mt2out11, mt2out12, mt2out13, mt2out14, mt2out15, mt2outdb, out2d0, out2d1, 
				out2d2, out2d3, out2d4, out2d5, out2d6, out2d7, out2d8, out2d9, out2d10, out2d11, out2d12, out2d13, out2d14,
				out2d15, out2db, out2b0, out2b1, out2b2, out2b3, out2b4, out2b5, out2b6, out2b7, out2b8, out2b9, out2b10, out2b11,
				out2b12, out2b13, out2b14, out2b15, out2bdb, v2out0, v2out1, v2out2, v2out3,v2out4, v2out5, v2out6, v2out7, v2out8,
				v2out9, v2out10, v2out11, v2out12, v2out13, v2out14, v2out15, v2outdb, d2out0, d2out1, d2out2, d2out3, d2out4, 
				d2out5, d2out6, d2out7, d2out8, d2out9, d2out10, d2out11, d2out12, d2out13, d2out14, d2out15, d2outdb);
  
  
  
  wire dataway3, validway3, dirtyway3, dirtyin3;
  wire [20:0] mt3out0, mt3out1, mt3out2, mt3out3, mt3out4, mt3out5, mt3out6, mt3out7, mt3out8, mt3out9, mt3out10, mt3out11,
  mt3out12, mt3out13, mt3out14, mt3out15, mt3outdb;
  wire [127:0] out3d0, out3d1, out3d2, out3d3, out3d4, out3d5, out3d6, out3d7, out3d8, out3d9, out3d10, out3d11, out3d12,
  out3d13, out3d14, out3d15, out3db;
  wire [31:0] out3b0, out3b1, out3b2, out3b3, out3b4, out3b5, out3b6, out3b7, out3b8, out3b9, out3b10, out3b11, out3b12,
  out3b13, out3b14, out3b15, out3bdb;
  wire v3out0, v3out1, v3out2, v3out3, v3out4, v3out5, v3out6, v3out7, v3out8, v3out9, v3out10, v3out11, v3out12, v3out13,
  v3out14, v3out15, v3outdb;
  wire d3out0, d3out1, d3out2, d3out3, d3out4, d3out5, d3out6,d3out7,d3out8, d3out9, d3out10, d3out11, d3out12, d3out13,
		 d3out14, d3out15, d3outdb;
  way way3( clk, reset, tagway3, dataway3, validway3, dirtyway3, dirtyin3, hit, indexIn, decindexout, offsetIn, decoffsetout,
				tagIn[24:4],  TwoByteIntoCache, BlockIntoTheCache, mt3out0, mt3out1, mt3out2, mt3out3, mt3out4, mt3out5, mt3out6,
				mt3out7, mt3out8, mt3out9, mt3out10, mt3out11, mt3out12, mt3out13, mt3out14, mt3out15, mt3outdb, out3d0, out3d1,
				out3d2, out3d3, out3d4, out3d5, out3d6, out3d7, out3d8, out3d9, out3d10, out3d11, out3d12, out3d13, out3d14,
				out3d15, out3db, out3b0, out3b1, out3b2, out3b3, out3b4, out3b5, out3b6, out3b7, out3b8, out3b9, out3b10, out3b11,
				out3b12, out3b13, out3b14, out3b15, out3bdb, v3out0, v3out1, v3out2, v3out3, v3out4, v3out5, v3out6, v3out7, v3out8,
				v3out9, v3out10, v3out11, v3out12, v3out13, v3out14, v3out15, v3outdb, d3out0, d3out1, d3out2, d3out3, d3out4,
				d3out5, d3out6, d3out7, d3out8, d3out9, d3out10, d3out11, d3out12, d3out13, d3out14, d3out15, d3outdb);
  
  
  wire dataway4, validway4, dirtyway4, dirtyin4;
  wire [20:0] mt4out0, mt4out1, mt4out2, mt4out3, mt4out4, mt4out5, mt4out6, mt4out7, mt4out8, mt4out9, mt4out10, mt4out11,
  mt4out12, mt4out13, mt4out14, mt4out15, mt4outdb;
  wire [127:0] out4d0, out4d1, out4d2, out4d3, out4d4, out4d5, out4d6, out4d7, out4d8, out4d9, out4d10, out4d11, out4d12,
  out4d13, out4d14, out4d15, out4db;
  wire [31:0] out4b0, out4b1, out4b2, out4b3, out4b4, out4b5, out4b6, out4b7, out4b8, out4b9, out4b10, out4b11, out4b12,
  out4b13, out4b14, out4b15, out4bdb;
  wire v4out0, v4out1, v4out2, v4out3, v4out4, v4out5, v4out6, v4out7, v4out8, v4out9, v4out10, v4out11, v4out12, v4out13,
  v4out14, v4out15, v4outdb;
  wire d4out0, d4out1, d4out2, d4out3, d4out4, d4out5, d4out6,d4out7, d4out8, d4out9, d4out10, d4out11, d4out12, d4out13,
			d4out14, d4out15, d4outdb;
  way way4( clk, reset, tagway4, dataway4, validway4, dirtyway4, dirtyin4, hit, indexIn, decindexout, offsetIn, decoffsetout,
				tagIn[24:4],  TwoByteIntoCache, BlockIntoTheCache,mt4out0, mt4out1, mt4out2, mt4out3, mt4out4, mt4out5, mt4out6,
				mt4out7, mt4out8, mt4out9, mt4out10, mt4out11, mt4out12, mt4out13, mt4out14, mt4out15, mt4outdb,out4d0, out4d1,
				out4d2, out4d3, out4d4, out4d5, out4d6, out4d7, out4d8, out4d9, out4d10, out4d11, out4d12, out4d13, out4d14, 
				out4d15, out4db, out4b0, out4b1, out4b2, out4b3, out4b4, out4b5, out4b6, out4b7, out4b8, out4b9, out4b10, out4b11,
				out4b12, out4b13, out4b14, out4b15, out4bdb, v4out0, v4out1, v4out2, v4out3, v4out4, v4out5, v4out6, v4out7, v4out8,
				v4out9, v4out10, v4out11, v4out12, v4out13, v4out14, v4out15, v4outdb, d4out0, d4out1, d4out2, d4out3, d4out4,
				d4out5, d4out6,d4out7, d4out8, d4out9, d4out10, d4out11, d4out12, d4out13,	d4out14, d4out15, d4outdb);   

	wire [20:0] mt1aftertsb;
	wire [20:0] mt2aftertsb;
	wire [20:0] mt3aftertsb;
	wire [20:0] mt4aftertsb;
	tristatebuffer tsb1(mt1outdb, or16inp1, mt1aftertsb);
	tristatebuffer tsb2(mt2outdb, or16inp2, mt2aftertsb);
	tristatebuffer tsb3(mt3outdb, or16inp3, mt3aftertsb);
	tristatebuffer tsb4(mt4outdb, or16inp4, mt4aftertsb);
	
	wire [3:0] outMTC;
   Main_Tag_Comparator mtc1(tagIn[24:4], mt1aftertsb, outMTC[0] );
   Main_Tag_Comparator mtc2(tagIn[24:4], mt2aftertsb, outMTC[1] );
	Main_Tag_Comparator mtc3(tagIn[24:4], mt3aftertsb, outMTC[2] );
	Main_Tag_Comparator mtc4(tagIn[24:4], mt4aftertsb, outMTC[3] );
  
	
  wire [1:0] encout;
	 encoder4_to_2  enc ( {outMTC[3]&&v4outdb ,outMTC[2]&&v3outdb ,outMTC[1]&&v2outdb ,outMTC[0]&&v1outdb},  
	 encout,hit);
	wire easyhit;
	assign easyhit =  or16inp1 || or16inp2 || or16inp3 || or16inp4;
	
	 //mux4to1_16bits bits16finmux ( hit, out1bdb, out2bdb,out3bdb, out4bdb, encout,TwoByteDataOutFromCache);
  
	 //mux4to1_16byte main16ByteMux(out1db, out2db, out3db, out4db, encOut, dataGettingReplaced);
	 wire [3:0] dataread;
	 cachecontrol ctrl(clk, reset, memRead, memWrite, easyhit, hit, waysel, {dataway1,dataway2,dataway3,dataway4},
	 {tagway1,tagway2,tagway3,tagway4},{dirtyway1,dirtyway2,dirtyway3,dirtyway4},{validway1,validway2,validway3,validway4},dataread);
	 
  
	/*wire encout;
	encoder enc ( outm1comp0 | outm1comp1 | outm1comp2 | outm1comp3 | outm1comp4 | outm1comp5 | outm1comp6 | outm1comp7 | outm1comp8 | outm1comp9 | outm1comp10 | outm1comp11 | outm1comp12 | outm1comp13 | outm1comp14 | outm1comp15, 
	 outm2comp0 | outm2comp1 | outm2comp2 | outm2comp3 | outm2comp4 | outm2comp5 | outm2comp6 | outm2comp7 | outm2comp8 | outm2comp9 | outm2comp10 | outm2comp11 | outm2comp12 | outm2comp13 | outm2comp14 | outm2comp15, 
	 encout, hit);*/
	wire [1:0] outcb;
		lfsr ll(clk, reset, outcb);
	//assign outcb = $urandom%4;
	
	mux2to1_2bit themux (outcb, encout, hit, waysel);
	
	//cacheControl cctrl( memRead, memWrite, waysel, hit, 
	 //tagway1, tagway2, counterwrite, counterin, validway1, validway2, dirtyway1, dirtyway2, dirtyin1, dirtyin2, dataway1, dataway2);

  mux4to1_1bit validfinmux ( v1outdb, v2outdb,v3outdb, v4outdb, waysel, valid );
  mux4to1_1bit dirtyfinmux ( d1outdb, d2outdb, d3outdb, d4outdb, waysel, dirty );
  
  mux4to1_32bits bits32finmux ( memRead, out1bdb, out2bdb,out3bdb, out4bdb, waysel, WordDataOutFromCache);
  mux4to1_25bits tagfinmux ( { mt1outdb, ht1outdb}, {mt2outdb, ht2outdb},{ mt3outdb, ht3outdb}, {mt4outdb, ht4outdb}, waysel, tag_out);
   mux4to1_16byte  datablockreplace(out1db, out2db, out3db, out4db,waysel,dataGettingReplaced);
  //mux2to1_256bits byte32finmux ( 1'b1, out1db, out2db, waysel, dataGettingReplaced);
  mux2to1_1bit writeBackSignalToMainMemory1( 1'b0, 1'b1, ~hit && dirty, writeBackSignalToMainMemory);
endmodule


module cacheTestbench;
  
  reg clk;
  reg reset;
  // Input signals to the cache module
  // This is data that is to be fed into the cache. (Assume this comes from memory)
  // In case of a miss, this is the data that replaces the old data in the cache
  reg [127:0] BlockIntoTheCache;
  
  reg [15:0] TwoByteIntoCache;
  
  // Physical address(32-b) gets split and taken as tag-index-offset inside the cache
  // reg [31:0] physicalAddressToCache;

  // IF SPLIT INTO TAG INDEX OFFSET OVER HERE(instead of inside the cache module), we can read four bytes by just changing the offset 
  // in the test bench. 
  reg [24:0] tagIn;
  reg [3:0] indexIn;
  reg [2:0] offsetIn;

  // Signal indicating that some data is to be written to the cache at [physical address] (since write back policy) 
  // This is when the dirty bit is made one inside the cache
  reg memWrite;    
  // Signal indicating that data at [physical address] is to be read from the cache
  reg memRead;
  // Outputs from the cache module
  // these should be ouput depending on what is being accessed inside the cache
  wire hit;   // shows hit or miss
  wire dirty; // shows whether block is modified
  wire valid;   // to know if data was replaced because it was invalid or because of no hit wrt to the tag
  wire [1:0] waysel;
  wire [24:0] tag_out;   // This is to be displayed to indicate which location in memory is to be accessed for an actual write back operation to the memory
  wire [127:0] dataGettingReplaced;   // The 32 B of data that is getting replaced in the cache
  wire [31:0] WordDataOutFromCache;
  wire writeBackSignalToMainMemory;
  cache cache_1(.clk(clk), .reset(reset), .TwoByteIntoCache(TwoByteIntoCache), .BlockIntoTheCache(BlockIntoTheCache),
  .tagIn(tagIn), .indexIn(indexIn), .offsetIn(offsetIn), .memWrite(memWrite), .memRead(memRead), .hit(hit), .valid(valid),
  .dirty(dirty), .tag_out(tag_out), .waysel(waysel), .dataGettingReplaced(dataGettingReplaced),
  .WordDataOutFromCache(WordDataOutFromCache), .writeBackSignalToMainMemory(writeBackSignalToMainMemory));
  
  always
    #5 clk=~clk;
  initial
    begin
      clk=0; reset=1;
      #10  reset=0;                              // t = 10 : reset = 0
      
      #10                                        // t = 20 : Should be a cache miss at set 1 (since, invalid) 
      
      /*
      1. Cache Miss (READ) Set 1  (Data gets written to way1)
      physicalAddressToCache = 32'h00_11_22_33; 
      READ MISS - must take a block from memory and read from that block in the cache
      */
      memRead = 1;  
      memWrite = 0;
      tagIn = 25'b0_0000_0000_0001_0001_0010_0100;
      indexIn = 4'b0001;
      offsetIn = 3'b011;                         // offset = 19 => EE should be printed
      
      //32 B data (that is actually supposed to be in the memory at the above address)  
      BlockIntoTheCache = 128'hAA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22;
      
      //byteIntoTheCache is a don't care as it is a memRead signal
      TwoByteIntoCache = 16'd0;
     
       /*
       2.  Cache Hit (READ) way1, set1 
         physicalAddressToCache = 32'h00_11_22_33;
       */
      #30                                            // t = 50 : Should be a cache hit in way 1 at set 1
      memRead = 1;  
      memWrite = 0; 
      tagIn = 25'b0_0000_0000_0001_0001_0010_0001;     // Same tag and different offset
      indexIn = 4'b0001;
      offsetIn = 3'b000;                         // Offset = 0 => 22 should be printed
            
      /*
      3.  Cache miss (READ) way2, set1
        physicalAddressToCache = 32'h10_11_22_33;  Note: New 'tag' with same index
      */
      
      #30                                            // t = 80 : Should be a cache miss in way 2 at set 1 (since invalid)
      memRead = 1;  
      memWrite = 0;
          
      tagIn = 25'b0_1000_0000_0001_0001_0010_0001;
      indexIn = 4'b0001;
      offsetIn = 5'b000;                             // This must take the new data and print FF
      
      #5                                                // Data is fed in late ; Check if this works
      
      //Feed in the 32 B data (that is actually supposed to be in the memory at the above address) because it is a miss
      BlockIntoTheCache = 128'hAA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_FF;
      
      
      
      //#5 byteIntoTheCache = 8'h17;
      #30                                               // t = 120
      /*
      4. Cache Hit (Write) ; way 1 ; set 1
       t = 110 : Should be a cache hit and byteIntoTheCache(=33) should be written into the cache; dirty = 1 
       
       At this point it won't be written into memory because we have a write-back policy 
       (Only gets written to memory if dirty=1 and hit=0(i.e., cache miss) 
       
       The values shown are only to monitor the inside of the cache.
       */ 
      memRead = 0;      
      memWrite = 1;
      //physicalAddressToCache = 32'h00_11_22_33;
      tagIn = 25'b0_0000_0000_0001_0001_0010_0001;
      indexIn = 4'b0001;
      offsetIn = 3'b000;
      //#5 byteIntoTheCache = 8'h17;
      #5
      
      #25                                           // t = 140
      /*
       5. Cache miss (Write) ; way 2 - set 1
          physicalAddressToCache = 32'h10_11_22_33;  Note: New 'tag' with same index      
      */
      memRead = 0;  
      memWrite = 1;
          
      tagIn = 25'b0_1110_0000_0001_0001_0010_0111;         // Changing the last 3 bits of the tag to check halt-tag array functionality
      indexIn = 4'b0001;
      offsetIn = 3'b110;                             // This must take the new data and write the byteIntoTheCacheValue
      
      //Feed in the 32 B data (that is actually supposed to be in the memory at the above address) because it is a miss
      BlockIntoTheCache = 128'hAA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_99;
      
      // Trying to write a word into the cache
      #5 TwoByteIntoCache = 16'h18_16; offsetIn = 3'b111;   // t = 150
      #15 TwoByteIntoCache = 16'h19_19; offsetIn = 3'b110;   // t = 160
      #10 TwoByteIntoCache = 16'h20_21; offsetIn = 3'b111;   // t = 170
      
      
      #30                                                   // t = 200
      /*
      6. Cache miss (Read) ; set 1 ; To demonstrate FIFO replacement; 
         Way 1 side should be replaced(first-in) because data in way2 was the last-in  
         Also dirty bit was set previously because of a write hit => Write-Back must happen (miss&&dirty == 1)
      */
      
      memRead = 1;  
      memWrite = 0;
          
      tagIn = 25'b0_1111_0000_0001_0001_1111_1111;
      indexIn = 4'b0001;
      offsetIn = 3'b001;  
       
      //Feed in the 32 B data (that is actually supposed to be in the memory at the above address) because it is a miss
      BlockIntoTheCache = 128'hAA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_88_99;

 
        /*
      7. Cache miss (Read) ; set 1 ; To demonstrate FIFO replacement; 
         Way 2 side should be replaced(first-in) because data in way1 was the last-in  (previous operation)
         Also dirty bit was set previously because of a write hit => Write-Back must happen (miss&&dirty == 1)
      */
      #30                                           //t = 230
      memRead = 1;  
      memWrite = 0;
          
      tagIn = 25'b1_1111_1111_0001_1111_1111_1111;
      indexIn = 4'b0001;
      offsetIn = 3'b000;  
       
      //Feed in the 32 B data (that is actually supposed to be in the memory at the above address) because it is a miss
      BlockIntoTheCache = 128'hAA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_11;
       
      #50 $finish; 
    end
    
endmodule
