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

module D_FF_DATA (input clk, input reset, input regWrite, input decOut1b, input blockwrite, input Hit, input d, input init, output reg q);
	always @ ( negedge clk )
	begin
	if ( reset == 1'b1 )
		q = 0;
	else
		if ( Hit == 1'b0 ) 
		  begin
			 if ( regWrite == 1'b1 && blockwrite == 1'b1 ) begin q = init; end
			end
		else 
		  begin
			 if ( regWrite == 1'b1 && decOut1b == 1'b1 ) begin q=d; end
			end
	end
endmodule

module decoder3x8 (input [2:0] offsetIn,output reg [7:0] offsetOut );
 always @ (offsetIn)
   begin
	 case (offsetIn)
	  3'b000: offsetOut = 8'b00000001;
	  3'b001: offsetOut = 8'b00000010;
	  3'b010: offsetOut = 8'b00000100;
	  3'b011: offsetOut = 8'b00001000;
	  3'b100: offsetOut = 8'b00010000;
	  3'b101: offsetOut = 8'b00100000;
	  3'b110: offsetOut = 8'b01000000;
	  3'b111: offsetOut = 8'b10000000;
     default:  offsetOut = 8'b00000000;
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
							  outR12, outR13, outR14, outR15, input [3:0] select, output reg [20:0] out_Wordus );
	always@( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or 
			   outR12 or outR13 or outR14 or outR15 or select )
   begin
   case (select)
		4'b0000: out_Wordus=outR0;
		4'b0001: out_Wordus=outR1;
		4'b0010: out_Wordus=outR2;
		4'b0011: out_Wordus=outR3;
		4'b0100: out_Wordus=outR4;
		4'b0101: out_Wordus=outR5;
		4'b0110: out_Wordus=outR6;
		4'b0111: out_Wordus=outR7;
		4'b1000: out_Wordus=outR8;
		4'b1001: out_Wordus=outR9;
		4'b1010: out_Wordus=outR10;
		4'b1011: out_Wordus=outR11;
		4'b1100: out_Wordus=outR12;
		4'b1101: out_Wordus=outR13;
		4'b1110: out_Wordus=outR14;
		4'b1111: out_Wordus=outR15;
	 endcase
	 end
endmodule

module mux16to1_4bits (input [3:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
							  outR14,outR15, input [3:0] select, output reg [3:0] out_Wordus );
	always@( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or
				outR12 or outR13 or outR14 or outR15 or select)
	 begin
	 case (select)
		4'b0000: out_Wordus=outR0;
		4'b0001: out_Wordus=outR1;
		4'b0010: out_Wordus=outR2;
		4'b0011: out_Wordus=outR3;
		4'b0100: out_Wordus=outR4;
		4'b0101: out_Wordus=outR5;
		4'b0110: out_Wordus=outR6;
		4'b0111: out_Wordus=outR7;
		4'b1000: out_Wordus=outR8;
		4'b1001: out_Wordus=outR9;
		4'b1010: out_Wordus=outR10;
		4'b1011: out_Wordus=outR11;
		4'b1100: out_Wordus=outR12;
		4'b1101: out_Wordus=outR13;
		4'b1110: out_Wordus=outR14;
		4'b1111: out_Wordus=outR15;
	 endcase
	 end
endmodule

module mux16to1_16byte (input [127:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
								outR14,outR15, input [3:0] select, output reg [127:0] out_Wordus );
	always @ (outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or 
				 outR12 or outR13 or outR14 or outR15 or select)
	 begin
	   case (select)
				4'b0000: out_Wordus=outR0;
				4'b0001: out_Wordus=outR1;
				4'b0010: out_Wordus=outR2;
				4'b0011: out_Wordus=outR3;
				4'b0100: out_Wordus=outR4;
				4'b0101: out_Wordus=outR5;
				4'b0110: out_Wordus=outR6;
				4'b0111: out_Wordus=outR7;
				4'b1000: out_Wordus=outR8;
				4'b1001: out_Wordus=outR9;
				4'b1010: out_Wordus=outR10;
				4'b1011: out_Wordus=outR11;
				4'b1100: out_Wordus=outR12;
				4'b1101: out_Wordus=outR13;
				4'b1110: out_Wordus=outR14;
				4'b1111: out_Wordus=outR15;
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
  always @ ( in1 or in2 or in3 or in4 or select or read)
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
								outR14,outR15, input [3:0] select, output reg [15:0] out_Wordus );
	always @ (outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or 
				 outR12 or outR13 or outR14 or outR15 or select)
	 begin
	   case (select)
				4'b0000: out_Wordus=outR0;
				4'b0001: out_Wordus=outR1;
				4'b0010: out_Wordus=outR2;
				4'b0011: out_Wordus=outR3;
				4'b0100: out_Wordus=outR4;
				4'b0101: out_Wordus=outR5;
				4'b0110: out_Wordus=outR6;
				4'b0111: out_Wordus=outR7;
				4'b1000: out_Wordus=outR8;
				4'b1001: out_Wordus=outR9;
				4'b1010: out_Wordus=outR10;
				4'b1011: out_Wordus=outR11;
				4'b1100: out_Wordus=outR12;
				4'b1101: out_Wordus=outR13;
				4'b1110: out_Wordus=outR14;
				4'b1111: out_Wordus=outR15;
	   endcase
	 end
endmodule

*/

module mux16to1_1bit (input outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12,
							 outR13, outR14, outR15, input [3:0] select, output reg out_Wordus );
	always @ ( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or
				  outR12 or outR13 or outR14 or outR15 or select)
	 begin
	 case (select) 
		4'b0000: out_Wordus=outR0;
		4'b0001: out_Wordus=outR1;
		4'b0010: out_Wordus=outR2;
		4'b0011: out_Wordus=outR3;
		4'b0100: out_Wordus=outR4;
		4'b0101: out_Wordus=outR5;
		4'b0110: out_Wordus=outR6;
		4'b0111: out_Wordus=outR7;
		4'b1000: out_Wordus=outR8;
		4'b1001: out_Wordus=outR9;
		4'b1010: out_Wordus=outR10;
		4'b1011: out_Wordus=outR11;
		4'b1100: out_Wordus=outR12;
		4'b1101: out_Wordus=outR13;
		4'b1110: out_Wordus=outR14;
		4'b1111: out_Wordus=outR15;
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

module TwoBytes (input clk, input reset, input regWrite, input decOut1b, input blockwrite, input hit, input [15:0] writeData,
					input [15:0] missData, output [15:0] outR);
  
  D_FF_DATA d0 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[0], missData[0], outR[0] );
  D_FF_DATA d1 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[1], missData[1], outR[1] );
  D_FF_DATA d2 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[2], missData[2], outR[2] );
  D_FF_DATA d3 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[3], missData[3], outR[3] );
  D_FF_DATA d4 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[4], missData[4], outR[4] );
  D_FF_DATA d5 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[5], missData[5], outR[5] );
  D_FF_DATA d6 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[6], missData[6], outR[6] );
  D_FF_DATA d7 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[7], missData[7], outR[7] );
  D_FF_DATA d8 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[8], missData[8], outR[8] );
  D_FF_DATA d9 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[9], missData[9], outR[9] );
  D_FF_DATA d10 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[10], missData[10], outR[10] );
  D_FF_DATA d11 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[11], missData[11], outR[11] );
  D_FF_DATA d12 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[12], missData[12], outR[12] );
  D_FF_DATA d13 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[13], missData[13], outR[13] );
  D_FF_DATA d14 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[14], missData[14], outR[14] );
  D_FF_DATA d15 ( clk, reset, regWrite, decOut1b, blockwrite, hit, writeData[15], missData[15], outR[15] );


endmodule


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
						  input blockwrite,
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
	
	TwoBytes b0  ( clk, reset, dataWrite, offset[0],  blockwrite, hit, writeData[31:16], missData[127:112],  outD[127:112]);
	TwoBytes b1  ( clk, reset, dataWrite, offset[0] | offset[1],  blockwrite, hit, towrite_b1, missData[111:96],    outD[111:96]);
	TwoBytes b2  ( clk, reset, dataWrite, offset[1] | offset[2],  blockwrite, hit, towrite_b2, missData[95:80],   outD[95:80]);
	TwoBytes b3  ( clk, reset, dataWrite, offset[2] | offset[3],  blockwrite, hit, towrite_b3, missData[79:64],   outD[79:64]);
	TwoBytes b4  ( clk, reset, dataWrite, offset[3] | offset[4],  blockwrite, hit, towrite_b4, missData[63:48],   outD[63:48]);
	TwoBytes b5  ( clk, reset, dataWrite, offset[4] | offset[5],  blockwrite, hit, towrite_b5, missData[47:32],   outD[47:32]);
	TwoBytes b6  ( clk, reset, dataWrite, offset[5] | offset[6],  blockwrite, hit, towrite_b6, missData[31:16],   outD[31:16]);
	TwoBytes b7  ( clk, reset, dataWrite, offset[6] | offset[7],  blockwrite, hit, towrite_b7, missData[15:0],   outD[15:0]);
	*/
	TwoBytes b0  ( clk, reset, dataWrite, offset[0],  blockwrite, hit, writeData, missData[15:0],     outD[15:0]);
	TwoBytes b1  ( clk, reset, dataWrite, offset[1],  blockwrite, hit, writeData, missData[31:16],    outD[31:16]);
	TwoBytes b2  ( clk, reset, dataWrite, offset[2],  blockwrite, hit, writeData, missData[47:32],   outD[47:32]);
	TwoBytes b3  ( clk, reset, dataWrite, offset[3],  blockwrite, hit, writeData, missData[63:48],   outD[63:48]);
	TwoBytes b4  ( clk, reset, dataWrite, offset[4],  blockwrite, hit, writeData, missData[79:64],   outD[79:64]);
	TwoBytes b5  ( clk, reset, dataWrite, offset[5],  blockwrite, hit, writeData, missData[95:80],   outD[95:80]);
	TwoBytes b6  ( clk, reset, dataWrite, offset[6],  blockwrite, hit, writeData, missData[111:96],   outD[111:96]);
	TwoBytes b7  ( clk, reset, dataWrite, offset[7],  blockwrite, hit, writeData, missData[127:112],   outD[127:112]);
	
	
	
	mux8to1_32bits mux_out_word({outD[15:0],16'd0}, outD[31:0], outD[47:16], outD[63:32], outD[79:48], outD[95:64], outD[111:80], outD[127:96], 
	selOffset,	outWord);
	
endmodule

module mux16to1_32bits(input [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
								outR14,outR15, input [3:0] select, output reg [31:0] out_Wordus );
	always @ (outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or 
				 outR12 or outR13 or outR14 or outR15 or select)
	 begin
	   case (select)
				4'b0000: out_Wordus=outR0;
				4'b0001: out_Wordus=outR1;
				4'b0010: out_Wordus=outR2;
				4'b0011: out_Wordus=outR3;
				4'b0100: out_Wordus=outR4;
				4'b0101: out_Wordus=outR5;
				4'b0110: out_Wordus=outR6;
				4'b0111: out_Wordus=outR7;
				4'b1000: out_Wordus=outR8;
				4'b1001: out_Wordus=outR9;
				4'b1010: out_Wordus=outR10;
				4'b1011: out_Wordus=outR11;
				4'b1100: out_Wordus=outR12;
				4'b1101: out_Wordus=outR13;
				4'b1110: out_Wordus=outR14;
				4'b1111: out_Wordus=outR15;
	   endcase
	 end
endmodule	 

module way (input clk, input reset, input main_tagWr, input enWrite, input valid_Wr, input dirty_Wr, input dirtyIn, 
				input hit, input [3:0] select, input [15:0] index, input [2:0] addOffset, input [7:0] offset, 
				input [20:0] tag_Address, input [15:0] writeData, input [127:0] missData, output [20:0] main_TagOut0, main_TagOut1,
				main_TagOut2, main_TagOut3, main_TagOut4, main_TagOut5, main_TagOut6, main_TagOut7, main_TagOut8, main_TagOut9,
				main_TagOut10, main_TagOut11, main_TagOut12, main_TagOut13, main_TagOut14, main_TagOut15, main_Tag_muxOut,
				output [127:0] outD0,outD1, outD2, outD3, outD4, outD5, outD6, outD7, outD8, outD9, outD10, outD11, outD12, outD13,
				outD14, outD15, mux_Out, output [31:0] out_Word0, out_Word1, out_Word2, out_Word3, out_Word4, out_Word5, out_Word6, out_Word7, out_Word8, out_Word9, out_Word10, out_Word11, out_Word12,
				out_Word13, out_Word14, out_Word15, out_Worddb, output validOut0, validOut1, validOut2, validOut3, validOut4, validOut5, validOut6,
				validOut7, validOut8, validOut9, validOut10, validOut11, validOut12, validOut13, validOut14, validOut15, validdb, 
            output dirtyOut0, dirtyOut1, dirtyOut2, dirtyOut3, dirtyOut4, dirtyOut5, dirtyOut6, dirtyOut7, dirtyOut8, dirtyOut9,
				dirtyOut10, dirtyOut11, dirtyOut12, dirtyOut13, dirtyOut14, dirtyOut15, dirtydb);
  
	register21bit rmt0  ( clk, reset, main_tagWr, index[0],  tag_Address, main_TagOut0 );
	register21bit rmt1  ( clk, reset, main_tagWr, index[1],  tag_Address, main_TagOut1 );
	register21bit rmt2  ( clk, reset, main_tagWr, index[2],  tag_Address, main_TagOut2 );
	register21bit rmt3  ( clk, reset, main_tagWr, index[3],  tag_Address, main_TagOut3 );
	register21bit rmt4  ( clk, reset, main_tagWr, index[4],  tag_Address, main_TagOut4 );
	register21bit rmt5  ( clk, reset, main_tagWr, index[5],  tag_Address, main_TagOut5 );
	register21bit rmt6  ( clk, reset, main_tagWr, index[6],  tag_Address, main_TagOut6 );
	register21bit rmt7  ( clk, reset, main_tagWr, index[7],  tag_Address, main_TagOut7 );
	register21bit rmt8  ( clk, reset, main_tagWr, index[8],  tag_Address, main_TagOut8 );
	register21bit rmt9  ( clk, reset, main_tagWr, index[9],  tag_Address, main_TagOut9 );
	register21bit rmt10 ( clk, reset, main_tagWr, index[10], tag_Address, main_TagOut10 );
	register21bit rmt11 ( clk, reset, main_tagWr, index[11], tag_Address, main_TagOut11 );
	register21bit rmt12 ( clk, reset, main_tagWr, index[12], tag_Address, main_TagOut12 );
	register21bit rmt13 ( clk, reset, main_tagWr, index[13], tag_Address, main_TagOut13 );
	register21bit rmt14 ( clk, reset, main_tagWr, index[14], tag_Address, main_TagOut14 );
	register21bit rmt15 ( clk, reset, main_tagWr, index[15], tag_Address, main_TagOut15 );

	mux16to1_21bit maintagmux ( main_TagOut0, main_TagOut1, main_TagOut2, main_TagOut3, main_TagOut4, main_TagOut5, main_TagOut6,
	main_TagOut7, main_TagOut8, main_TagOut9, main_TagOut10, main_TagOut11, main_TagOut12, main_TagOut13, main_TagOut14, main_TagOut15,
	select, main_Tag_muxOut);
	
	Data_16Byte db0  (clk, reset, enWrite, addOffset, offset, index[0],  hit, writeData, missData, outD0,  out_Word0);
	Data_16Byte db1  (clk, reset, enWrite, addOffset, offset, index[1],  hit, writeData, missData, outD1,  out_Word1);
	Data_16Byte db2  (clk, reset, enWrite, addOffset, offset, index[2],  hit, writeData, missData, outD2,  out_Word2);
	Data_16Byte db3  (clk, reset, enWrite, addOffset, offset, index[3],  hit, writeData, missData, outD3,  out_Word3);
	Data_16Byte db4  (clk, reset, enWrite, addOffset, offset, index[4],  hit, writeData, missData, outD4,  out_Word4);
	Data_16Byte db5  (clk, reset, enWrite, addOffset, offset, index[5],  hit, writeData, missData, outD5,  out_Word5);
	Data_16Byte db6  (clk, reset, enWrite, addOffset, offset, index[6],  hit, writeData, missData, outD6,  out_Word6);
	Data_16Byte db7  (clk, reset, enWrite, addOffset, offset, index[7],  hit, writeData, missData, outD7,  out_Word7);
	Data_16Byte db8  (clk, reset, enWrite, addOffset, offset, index[8],  hit, writeData, missData, outD8,  out_Word8);
	Data_16Byte db9  (clk, reset, enWrite, addOffset, offset, index[9],  hit, writeData, missData, outD9,  out_Word9);
	Data_16Byte db10 (clk, reset, enWrite, addOffset, offset, index[10], hit, writeData, missData, outD10, out_Word10);
	Data_16Byte db11 (clk, reset, enWrite, addOffset, offset, index[11], hit, writeData, missData, outD11, out_Word11);
	Data_16Byte db12 (clk, reset, enWrite, addOffset, offset, index[12], hit, writeData, missData, outD12, out_Word12);
	Data_16Byte db13 (clk, reset, enWrite, addOffset, offset, index[13], hit, writeData, missData, outD13, out_Word13);
	Data_16Byte db14 (clk, reset, enWrite, addOffset, offset, index[14], hit, writeData, missData, outD14, out_Word14);
	Data_16Byte db15 (clk, reset, enWrite, addOffset, offset, index[15], hit, writeData, missData, outD15, out_Word15);
	
	mux16to1_16byte data16bytemux ( outD0, outD1, outD2, outD3, outD4, outD5, outD6, outD7, outD8, outD9, outD10, outD11, outD12, outD13, 
		outD14, outD15, select, mux_Out );
		
	//mux16to1_16bits data2bytemux ( out_Word0, out_Word1, out_Word2, out_Word3, out_Word4, out_Word5, out_Word6, out_Word7, out_Word8, out_Word9, out_Word10, out_Word11, out_Word12, out_Word13, 
		//out_Word14, out_Word15, select, out_Worddb );
		
	mux16to1_32bits datawordmux ( out_Word0, out_Word1, out_Word2, out_Word3, out_Word4, out_Word5, out_Word6, out_Word7, out_Word8, out_Word9, out_Word10, out_Word11, out_Word12, out_Word13, 
		out_Word14, out_Word15, select, out_Worddb );
	
	register1bit valid0  (clk, reset, valid_Wr, index[0],  1'b1, validOut0);
	register1bit valid1  (clk, reset, valid_Wr, index[1],  1'b1, validOut1);
	register1bit valid2  (clk, reset, valid_Wr, index[2],  1'b1, validOut2);
	register1bit valid3  (clk, reset, valid_Wr, index[3],  1'b1, validOut3);
	register1bit valid4  (clk, reset, valid_Wr, index[4],  1'b1, validOut4);
	register1bit valid5  (clk, reset, valid_Wr, index[5],  1'b1, validOut5);
	register1bit valid6  (clk, reset, valid_Wr, index[6],  1'b1, validOut6);
	register1bit valid7  (clk, reset, valid_Wr, index[7],  1'b1, validOut7);
	register1bit valid8  (clk, reset, valid_Wr, index[8],  1'b1, validOut8);
	register1bit valid9  (clk, reset, valid_Wr, index[9],  1'b1, validOut9);
	register1bit valid10 (clk, reset, valid_Wr, index[10], 1'b1, validOut10);
	register1bit valid11 (clk, reset, valid_Wr, index[11], 1'b1, validOut11);
	register1bit valid12 (clk, reset, valid_Wr, index[12], 1'b1, validOut12);
	register1bit valid13 (clk, reset, valid_Wr, index[13], 1'b1, validOut13);
	register1bit valid14 (clk, reset, valid_Wr, index[14], 1'b1, validOut14);
	register1bit valid15 (clk, reset, valid_Wr, index[15], 1'b1, validOut15);
	mux16to1_1bit validmux( validOut0, validOut1, validOut2, validOut3, validOut4, validOut5, validOut6, validOut7, validOut8, validOut9, 
		validOut10, validOut11, validOut12, validOut13, validOut14, validOut15, select, validdb);
  
	register1bit dirty0  (clk, reset, dirty_Wr, index[0],  dirtyIn, dirtyOut0);
	register1bit dirty1  (clk, reset, dirty_Wr, index[1],  dirtyIn, dirtyOut1);
	register1bit dirty2  (clk, reset, dirty_Wr, index[2],  dirtyIn, dirtyOut2);
	register1bit dirty3  (clk, reset, dirty_Wr, index[3],  dirtyIn, dirtyOut3);
	register1bit dirty4  (clk, reset, dirty_Wr, index[4],  dirtyIn, dirtyOut4);
	register1bit dirty5  (clk, reset, dirty_Wr, index[5],  dirtyIn, dirtyOut5);
	register1bit dirty6  (clk, reset, dirty_Wr, index[6],  dirtyIn, dirtyOut6);
	register1bit dirty7  (clk, reset, dirty_Wr, index[7],  dirtyIn, dirtyOut7);
	register1bit dirty8  (clk, reset, dirty_Wr, index[8],  dirtyIn, dirtyOut8);
	register1bit dirty9  (clk, reset, dirty_Wr, index[9],  dirtyIn, dirtyOut9);
	register1bit dirty10 (clk, reset, dirty_Wr, index[10], dirtyIn, dirtyOut10);
	register1bit dirty11 (clk, reset, dirty_Wr, index[11], dirtyIn, dirtyOut11);
	register1bit dirty12 (clk, reset, dirty_Wr, index[12], dirtyIn, dirtyOut12);
	register1bit dirty13 (clk, reset, dirty_Wr, index[13], dirtyIn, dirtyOut13);
	register1bit dirty14 (clk, reset, dirty_Wr, index[14], dirtyIn, dirtyOut14);
	register1bit dirty15 (clk, reset, dirty_Wr, index[15], dirtyIn, dirtyOut15);
	
	mux16to1_1bit dirtymux ( dirtyOut0, dirtyOut1, dirtyOut2, dirtyOut3, dirtyOut4, dirtyOut5, dirtyOut6, dirtyOut7, dirtyOut8,
	dirtyOut9, dirtyOut10, dirtyOut11, dirtyOut12, dirtyOut13, dirtyOut14, dirtyOut15, select, dirtydb );

endmodule

module tristatebuffer( input [20:0] in1, input enable, output [20:0] out);
	assign out = enable?in1:'bz;
		
endmodule


module lfsr (input clk, input rst, output reg [15:0] out);

  wire feedback;

  assign feedback = ~(out[7] ^ out[0]);

always @(negedge clk)
  begin
    if (rst)
      out = 16'd0;
    else
      out = {out[14:0],feedback};
  end

endmodule

module cachecontrol(input clk,input reset, input memread, input memwrite,input easyhit,input hit, 

						  input [1:0] waysel, output reg [3:0] datawrite, output reg [3:0] tagwrite, output reg [3:0] dirty_Wr, 

						  output reg [3:0] valid_Wr, output reg [3:0] dirtyin);
    
     parameter HTC = 4'd0, MTC = 4'd1, RD = 4'd2, FR = 4'd3, WR = 4'd4, HALT1 = 4'd5, HALT2 = 4'd6, LAMDA = 4'd7;   
     
	  reg [3:0] state;
     always@(negedge clk)
     begin
     	if(reset)
     	   state = LAMDA;

        else
         begin
        	case(state)
        	  LAMDA: state = HTC;
        	  HTC:
        	      begin
	        	      if (easyhit)
	        	         state = MTC;
	        	      else   
	        	      	 state = HALT1;
        	      end
        	  MTC:
        	      begin
        	         if ((hit && memread) || (hit && memwrite)) 
        	            state = HALT2;
        	         else
        	            state = FR;     	
       	      	      end 
       	     	  RD:
       	            state = HTC;       
             	  FR:
	             begin
                   		if (memread)
                     		   state = RD;
                                else if(memwrite)
                                   state = WR;
                     end
             	  WR:
        		  state = HTC;
        	  HALT1:
              		  state = FR;
             	  HALT2: 
             	 	  if(memread)
              	         	state = RD;
              	     	  else if(memwrite)
              	     	        state = WR; 
        	endcase

	 end
     end

     always @(state)
     begin
      	case(state)
      		LAMDA:
      		  begin
      		  end
      		HTC:
      		  begin  
                
                datawrite = 4'b0000; 
                tagwrite = 4'b0000;
                dirty_Wr = 4'b0000;
                valid_Wr = 4'b0000;
                dirtyin = 4'b0000;
              	end
               MTC:
               begin
               
                datawrite = 4'b0000; 
                tagwrite = 4'b0000;
                dirty_Wr = 4'b0000;
                valid_Wr = 4'b0000;
                dirtyin = 4'b0000;
               end
               RD:
                begin
                datawrite = 4'b0000;
                tagwrite = 4'b0000;
                dirty_Wr = 4'b0000;
                valid_Wr = 4'b0000;
                dirtyin = 4'b0000;    	
                end      
             FR:
                begin
                case(waysel)
                	2'b11:
                	begin
                		datawrite = 4'b1000;
                		tagwrite = 4'b1000;
                		dirty_Wr = 4'b1000;
                		valid_Wr = 4'b1000;
               		 end
               		 2'b10:
               		 begin
                		datawrite = 4'b0100;
                		tagwrite = 4'b0100;
                		dirty_Wr = 4'b0100;
                		valid_Wr = 4'b0100;
               		 end
               		 2'b01:
               		 begin
                		datawrite = 4'b0010;
                		tagwrite = 4'b0010;
                		dirty_Wr = 4'b0010;
                		valid_Wr = 4'b0010;
               		 end
               		 2'b00:
               		 begin
                		datawrite = 4'b0001;
                		tagwrite = 4'b0001;
                		dirty_Wr = 4'b0001;
                		valid_Wr = 4'b0001;
               		 end
                endcase
                end 
               WR:
                begin
                case(waysel)
                	2'b11:
                	begin
                		datawrite = 4'b1000;
                		tagwrite = 4'b1000;
                		dirty_Wr = 4'b1000;
                		valid_Wr = 4'b1000;
							dirtyin = 4'b1000;
               	end
               	2'b10:
               	begin
                		datawrite = 4'b0100;
                		tagwrite = 4'b0100;
                		dirty_Wr = 4'b0100;
                		valid_Wr = 4'b0100;
							dirtyin = 4'b0100;
               	end
               	2'b01:
               	begin
                		datawrite = 4'b0010;
                		tagwrite = 4'b0010;
                		dirty_Wr = 4'b0010;
                		valid_Wr = 4'b0010;
							dirtyin = 4'b0010;
               	end
               	2'b00:
               	begin
                		datawrite = 4'b0001;
                		tagwrite = 4'b0001;
                		dirty_Wr = 4'b0001;
                		valid_Wr = 4'b0001;
							dirtyin = 4'b0001;
               	end
                endcase
                end  
               HALT1:
                begin
                datawrite = 4'b0000; 
                tagwrite = 4'b0000;
                dirty_Wr = 4'b0000;
                valid_Wr = 4'b0000;
                dirtyin = 4'b0000;
					 
                end       
				endcase
				end

endmodule


/*
module cachecontrol(input clk,input reset, input memread, input memwrite,input easyhit,input hit, 
						  input [1:0] waysel, output reg [3:0] datawrite, output reg [3:0] tagwrite, output reg [3:0] dirty_Wr, 
						  output reg [3:0] valid_Wr, output reg [3:0] dirtyin);
    
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
       	           state = 4'd0;       
              4'd3:
                   if(memread)
                     state = 4'd2;
                   else if(memwrite)
                      state = 4'd4;
              4'd4:
        		  state = 4'd0;
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
                dirty_Wr = 4'b0000;
                valid_Wr = 4'b0000;
                dirtyin = 4'b0000;
              end
            4'd1:
               begin
                //replace = 0 
                datawrite = 4'b0000; 
                tagwrite = 4'b0000;
                dirty_Wr = 4'b0000;
                valid_Wr = 4'b0000;
                dirtyin = 4'b0000;
               end
            4'd2:
                begin
                //replace = 0 
                datawrite = 4'b0000;
                tagwrite = 4'b0000;
                dirty_Wr = 4'b0000;
                valid_Wr = 4'b1111;
                dirtyin = 4'b1111;    	
                end      
             4'd3:
                begin
                case(waysel)
                	2'b11:
                	begin
                		datawrite = 4'b1000;
                		tagwrite = 4'b1000;
                		dirty_Wr = 4'b1000;
                		valid_Wr = 4'b1000;
							dirtyin = 4'b1000;
               		 end
               		 2'b10:
               		 begin
                		datawrite = 4'b0100;
                		tagwrite = 4'b0100;
                		dirty_Wr = 4'b0100;
                		valid_Wr = 4'b0100;
							dirtyin = 4'b0100;
               		 end
               		 2'b01:
               		 begin
                		datawrite = 4'b0010;
                		tagwrite = 4'b0010;
                		dirty_Wr = 4'b0010;
                		valid_Wr = 4'b0010;
							dirtyin = 4'b0010;
               		 end
               		 2'b00:
               		 begin
                		datawrite = 4'b0001;
                		tagwrite = 4'b0001;
                		dirty_Wr = 4'b0001;
                		valid_Wr = 4'b0001;
							dirtyin = 4'b0001;
               		 end
                endcase
                end 
              4'd4:
                begin
                case(waysel)
                	2'b11:
                	begin
                		datawrite = 4'b1000;
                		tagwrite = 4'b1000;
                		dirty_Wr = 4'b1000;
                		valid_Wr = 4'b1000;
							dirtyin = 4'b1000;
               	end
               	2'b10:
               	begin
                		datawrite = 4'b0100;
                		tagwrite = 4'b0100;
                		dirty_Wr = 4'b0100;
                		valid_Wr = 4'b0100;
							dirtyin = 4'b0100;
               	end
               	2'b01:
               	begin
                		datawrite = 4'b0010;
                		tagwrite = 4'b0010;
                		dirty_Wr = 4'b0010;
                		valid_Wr = 4'b0010;
							dirtyin = 4'b0010;
               	end
               	2'b00:
               	begin
                		datawrite = 4'b0001;
                		tagwrite = 4'b0001;
                		dirty_Wr = 4'b0001;
                		valid_Wr = 4'b0001;
							dirtyin = 4'b0001;
               	end
                endcase
                end  
               4'd5:
                begin
                datawrite = 4'b0000; 
                tagwrite = 4'b0000;
                dirty_Wr = 4'b0000;
                valid_Wr = 4'b0000;
                dirtyin = 4'b0000;
                end       
				endcase
				end

endmodule*/




module cache ( input clk, input reset, input [15:0]  TwoByteIntoCache, input [127:0] BlockIntoTheCache, input [24:0] tagIn,
				   input [3:0] indexIn, input [2:0] offsetIn, input memWrite, input memRead, output hit, output valid, output dirty,
				   output [1:0] waysel, output [24:0] tag_out, output [127:0] BlockGettingReplaced, 
				   output [31:0] WordDataOutFromCache, output writeBackSignalToMainMemory );

	wire [15:0] indexOut;
   decoder4x16 index_decoder( indexIn, indexOut );
  
   wire [7:0] offsetOut;
   decoder3x8 offset_decoder( offsetIn, offsetOut );
  
	wire tagWr1;
	wire [3:0] ht1out0, ht1out1, ht1out2, ht1out3, ht1out4, ht1out5, ht1out6, ht1out7, ht1out8, ht1out9, ht1out10, ht1out11,
	   		  ht1out12, ht1out13, ht1out14, ht1out15, ht1mux_Out;
	Halt_Tag_Array hta1 ( clk, reset, tagWr1, indexIn, indexOut, tagIn[3:0], ht1out0, ht1out1, ht1out2, ht1out3, ht1out4,
		ht1out5, ht1out6, ht1out7, ht1out8, ht1out9, ht1out10, ht1out11, ht1out12, ht1out13, ht1out14, ht1out15, ht1mux_Out);
  
  
	wire tagWr2;
	wire [3:0] ht2out0, ht2out1, ht2out2, ht2out3, ht2out4, ht2out5, ht2out6, ht2out7, ht2out8, ht2out9, ht2out10, ht2out11,
	   		  ht2out12, ht2out13, ht2out14, ht2out15, ht2mux_Out;
	Halt_Tag_Array hta2 ( clk, reset, tagWr2, indexIn, indexOut, tagIn[3:0], ht2out0, ht2out1, ht2out2, ht2out3, ht2out4,
		ht2out5, ht2out6, ht2out7, ht2out8, ht2out9, ht2out10, ht2out11, ht2out12, ht2out13, ht2out14, ht2out15, ht2mux_Out);
  
  
	wire tagWr3;
	wire [3:0] ht3out0, ht3out1, ht3out2, ht3out3, ht3out4, ht3out5, ht3out6, ht3out7, ht3out8, ht3out9, ht3out10, ht3out11, 
	   		  ht3out12, ht3out13, ht3out14, ht3out15, ht3mux_Out;
	Halt_Tag_Array hta3 ( clk, reset, tagWr3, indexIn, indexOut, tagIn[3:0], ht3out0, ht3out1, ht3out2, ht3out3, ht3out4,
		ht3out5, ht3out6, ht3out7, ht3out8, ht3out9, ht3out10, ht3out11, ht3out12, ht3out13, ht3out14, ht3out15, ht3mux_Out);
  
	wire tagWr4;
	wire [3:0] ht4out0, ht4out1, ht4out2, ht4out3, ht4out4, ht4out5, ht4out6, ht4out7, ht4out8, ht4out9, ht4out10, ht4out11,
				  ht4out12, ht4out13, ht4out14, ht4out15, ht4mux_Out;
	Halt_Tag_Array hta4 ( clk, reset, tagWr4, indexIn, indexOut, tagIn[3:0], ht4out0, ht4out1, ht4out2, ht4out3, ht4out4,
      ht4out5, ht4out6, ht4out7, ht4out8, ht4out9, ht4out10, ht4out11, ht4out12, ht4out13, ht4out14, ht4out15, ht4mux_Out);
  
  
  
  
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
	 assign or16inp1 = (out1comp0 & indexOut[0]) | (out1comp1 & indexOut[1]) | (out1comp2 & indexOut[2]) |
							 (out1comp3 & indexOut[3]) | (out1comp4 & indexOut[4]) | (out1comp5 & indexOut[5]) |
							 (out1comp6 & indexOut[6]) | (out1comp7 & indexOut[7]) | (out1comp8 & indexOut[8]) |
							 (out1comp9 & indexOut[9]) | (out1comp10 & indexOut[10]) | (out1comp11 & indexOut[11]) |
							 (out1comp12 & indexOut[12]) | (out1comp13 & indexOut[13]) | (out1comp14 & indexOut[14]) |
							 (out1comp15 & indexOut[15]);
	
	
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
	 assign or16inp2 = (out2comp0 & indexOut[0]) | (out2comp1 & indexOut[1]) | (out2comp2 & indexOut[2]) |
							 (out2comp3 & indexOut[3]) | (out2comp4 & indexOut[4]) | (out2comp5 & indexOut[5]) |
							 (out2comp6 & indexOut[6]) | (out2comp7 & indexOut[7]) | (out2comp8 & indexOut[8]) |
							 (out2comp9 & indexOut[9]) | (out2comp10 & indexOut[10]) | (out2comp11 & indexOut[11]) |
							 (out2comp12 & indexOut[12]) | (out2comp13 & indexOut[13]) | (out2comp14 & indexOut[14]) |
							 (out2comp15 & indexOut[15]);
  
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
	 assign or16inp3 = (out3comp0 & indexOut[0]) | (out3comp1 & indexOut[1]) | (out3comp2 & indexOut[2]) |
							 (out3comp3 & indexOut[3]) | (out3comp4 & indexOut[4]) | (out3comp5 & indexOut[5]) |
							 (out3comp6 & indexOut[6]) | (out3comp7 & indexOut[7]) | (out3comp8 & indexOut[8]) |
							 (out3comp9 & indexOut[9]) | (out3comp10 & indexOut[10]) | (out3comp11 & indexOut[11]) |
							 (out3comp12 & indexOut[12]) | (out3comp13 & indexOut[13]) | (out3comp14 & indexOut[14]) |
							 (out3comp15 & indexOut[15]);
	 
	 
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
	 assign or16inp4 = (out4comp0 & indexOut[0]) | (out4comp1 & indexOut[1]) | (out4comp2 & indexOut[2]) |
							 (out4comp3 & indexOut[3]) | (out4comp4 & indexOut[4]) | (out4comp5 & indexOut[5]) |
							 (out4comp6 & indexOut[6]) | (out4comp7 & indexOut[7]) | (out4comp8 & indexOut[8]) |
							 (out4comp9 & indexOut[9]) | (out4comp10 & indexOut[10]) | (out4comp11 & indexOut[11]) |
							 (out4comp12 & indexOut[12]) | (out4comp13 & indexOut[13]) | (out4comp14 & indexOut[14]) |
							 (out4comp15 & indexOut[15]);
  

  
  wire dataWr1, validWr1, dirtyWr1, dirtyin1;
  wire [20:0] mt1out0, mt1out1, mt1out2, mt1out3, mt1out4, mt1out5, mt1out6, mt1out7, mt1out8, mt1out9, mt1out10, mt1out11,
  mt1out12, mt1out13, mt1out14, mt1out15, mt1mux_Out;
  wire [127:0] out1d0, out1d1, out1d2, out1d3, out1d4, out1d5, out1d6, out1d7, out1d8, out1d9, out1d10, out1d11, out1d12,
  out1d13, out1d14, out1d15, out1db;
  wire [31:0] out1b0, out1b1, out1b2, out1b3, out1b4, out1b5, out1b6, out1b7, out1b8, out1b9, out1b10, out1b11, out1b12, out1b13,
  out1b14, out1b15, out1bdb;
  wire v1out0, v1out1, v1out2, v1out3, v1out4, v1out5, v1out6, v1out7, v1out8, v1out9, v1out10, v1out11, v1out12, v1out13,
  v1out14, v1out15, v1mux_Out;
  wire d1out0, d1out1, d1out2, d1out3, d1out4, d1out5, d1out6, d1out7, d1out8, d1out9, d1out10, d1out11, d1out12, d1out13,
  d1out14, d1out15, d1mux_Out;
  way way1( clk, reset, tagWr1, dataWr1, validWr1, dirtyWr1, dirtyin1, hit, indexIn, indexOut, offsetIn, offsetOut,
				tagIn[24:4],  TwoByteIntoCache, BlockIntoTheCache, mt1out0, mt1out1, mt1out2, mt1out3, mt1out4, mt1out5, mt1out6,
				mt1out7, mt1out8, mt1out9, mt1out10, mt1out11, mt1out12, mt1out13, mt1out14, mt1out15, mt1mux_Out, out1d0, out1d1,
				out1d2, out1d3, out1d4, out1d5, out1d6, out1d7, out1d8, out1d9, out1d10, out1d11, out1d12, out1d13, out1d14,
				out1d15, out1db, out1b0, out1b1, out1b2, out1b3, out1b4, out1b5, out1b6, out1b7, out1b8, out1b9, out1b10, out1b11,
				out1b12, out1b13, out1b14, out1b15, out1bdb, v1out0, v1out1, v1out2, v1out3, v1out4, v1out5, v1out6, v1out7, v1out8,
				v1out9, v1out10, v1out11, v1out12, v1out13, v1out14, v1out15, v1mux_Out, d1out0, d1out1, d1out2, d1out3, d1out4,
				d1out5, d1out6, d1out7, d1out8, d1out9, d1out10, d1out11, d1out12, d1out13, d1out14, d1out15, d1mux_Out);
  
  
  wire dataWr2, validWr2, dirtyWr2, dirtyin2;
  wire [20:0] mt2out0, mt2out1, mt2out2, mt2out3, mt2out4, mt2out5, mt2out6, mt2out7, mt2out8, mt2out9, mt2out10, mt2out11,
  mt2out12, mt2out13, mt2out14, mt2out15, mt2mux_Out;
  wire [127:0] out2d0, out2d1, out2d2, out2d3, out2d4, out2d5, out2d6, out2d7, out2d8, out2d9, out2d10, out2d11, out2d12,
  out2d13, out2d14, out2d15, out2db;
  wire [31:0] out2b0, out2b1, out2b2, out2b3, out2b4, out2b5, out2b6, out2b7, out2b8, out2b9, out2b10, out2b11, out2b12, out2b13,
  out2b14, out2b15, out2bdb;
  wire v2out0, v2out1, v2out2, v2out3, v2out4, v2out5, v2out6, v2out7, v2out8, v2out9, v2out10, v2out11, v2out12, v2out13,
  v2out14, v2out15, v2mux_Out;
  wire d2out0, d2out1, d2out2, d2out3, d2out4, d2out5, d2out6, d2out7, d2out8, d2out9, d2out10, d2out11, d2out12, d2out13,
  d2out14, d2out15, d2mux_Out;
  way way2( clk, reset, tagWr2, dataWr2, validWr2, dirtyWr2, dirtyin2, hit, indexIn, indexOut, offsetIn, offsetOut,
				tagIn[24:4],  TwoByteIntoCache, BlockIntoTheCache, mt2out0, mt2out1, mt2out2, mt2out3, mt2out4, mt2out5, mt2out6,
				mt2out7, mt2out8, mt2out9, mt2out10, mt2out11, mt2out12, mt2out13, mt2out14, mt2out15, mt2mux_Out, out2d0, out2d1, 
				out2d2, out2d3, out2d4, out2d5, out2d6, out2d7, out2d8, out2d9, out2d10, out2d11, out2d12, out2d13, out2d14,
				out2d15, out2db, out2b0, out2b1, out2b2, out2b3, out2b4, out2b5, out2b6, out2b7, out2b8, out2b9, out2b10, out2b11,
				out2b12, out2b13, out2b14, out2b15, out2bdb, v2out0, v2out1, v2out2, v2out3,v2out4, v2out5, v2out6, v2out7, v2out8,
				v2out9, v2out10, v2out11, v2out12, v2out13, v2out14, v2out15, v2mux_Out, d2out0, d2out1, d2out2, d2out3, d2out4, 
				d2out5, d2out6, d2out7, d2out8, d2out9, d2out10, d2out11, d2out12, d2out13, d2out14, d2out15, d2mux_Out);
  
  
  
  wire dataWr3, validWr3, dirtyWr3, dirtyin3;
  wire [20:0] mt3out0, mt3out1, mt3out2, mt3out3, mt3out4, mt3out5, mt3out6, mt3out7, mt3out8, mt3out9, mt3out10, mt3out11,
  mt3out12, mt3out13, mt3out14, mt3out15, mt3mux_Out;
  wire [127:0] out3d0, out3d1, out3d2, out3d3, out3d4, out3d5, out3d6, out3d7, out3d8, out3d9, out3d10, out3d11, out3d12,
  out3d13, out3d14, out3d15, out3db;
  wire [31:0] out3b0, out3b1, out3b2, out3b3, out3b4, out3b5, out3b6, out3b7, out3b8, out3b9, out3b10, out3b11, out3b12,
  out3b13, out3b14, out3b15, out3bdb;
  wire v3out0, v3out1, v3out2, v3out3, v3out4, v3out5, v3out6, v3out7, v3out8, v3out9, v3out10, v3out11, v3out12, v3out13,
  v3out14, v3out15, v3mux_Out;
  wire d3out0, d3out1, d3out2, d3out3, d3out4, d3out5, d3out6,d3out7,d3out8, d3out9, d3out10, d3out11, d3out12, d3out13,
		 d3out14, d3out15, d3mux_Out;
  way way3( clk, reset, tagWr3, dataWr3, validWr3, dirtyWr3, dirtyin3, hit, indexIn, indexOut, offsetIn, offsetOut,
				tagIn[24:4],  TwoByteIntoCache, BlockIntoTheCache, mt3out0, mt3out1, mt3out2, mt3out3, mt3out4, mt3out5, mt3out6,
				mt3out7, mt3out8, mt3out9, mt3out10, mt3out11, mt3out12, mt3out13, mt3out14, mt3out15, mt3mux_Out, out3d0, out3d1,
				out3d2, out3d3, out3d4, out3d5, out3d6, out3d7, out3d8, out3d9, out3d10, out3d11, out3d12, out3d13, out3d14,
				out3d15, out3db, out3b0, out3b1, out3b2, out3b3, out3b4, out3b5, out3b6, out3b7, out3b8, out3b9, out3b10, out3b11,
				out3b12, out3b13, out3b14, out3b15, out3bdb, v3out0, v3out1, v3out2, v3out3, v3out4, v3out5, v3out6, v3out7, v3out8,
				v3out9, v3out10, v3out11, v3out12, v3out13, v3out14, v3out15, v3mux_Out, d3out0, d3out1, d3out2, d3out3, d3out4,
				d3out5, d3out6, d3out7, d3out8, d3out9, d3out10, d3out11, d3out12, d3out13, d3out14, d3out15, d3mux_Out);
  
  
  wire dataWr4, validWr4, dirtyWr4, dirtyin4;
  wire [20:0] mt4out0, mt4out1, mt4out2, mt4out3, mt4out4, mt4out5, mt4out6, mt4out7, mt4out8, mt4out9, mt4out10, mt4out11,
  mt4out12, mt4out13, mt4out14, mt4out15, mt4mux_Out;
  wire [127:0] out4d0, out4d1, out4d2, out4d3, out4d4, out4d5, out4d6, out4d7, out4d8, out4d9, out4d10, out4d11, out4d12,
  out4d13, out4d14, out4d15, out4db;
  wire [31:0] out4b0, out4b1, out4b2, out4b3, out4b4, out4b5, out4b6, out4b7, out4b8, out4b9, out4b10, out4b11, out4b12,
  out4b13, out4b14, out4b15, out4bdb;
  wire v4out0, v4out1, v4out2, v4out3, v4out4, v4out5, v4out6, v4out7, v4out8, v4out9, v4out10, v4out11, v4out12, v4out13,
  v4out14, v4out15, v4mux_Out;
  wire d4out0, d4out1, d4out2, d4out3, d4out4, d4out5, d4out6,d4out7, d4out8, d4out9, d4out10, d4out11, d4out12, d4out13,
			d4out14, d4out15, d4mux_Out;
  way way4( clk, reset, tagWr4, dataWr4, validWr4, dirtyWr4, dirtyin4, hit, indexIn, indexOut, offsetIn, offsetOut,
				tagIn[24:4],  TwoByteIntoCache, BlockIntoTheCache,mt4out0, mt4out1, mt4out2, mt4out3, mt4out4, mt4out5, mt4out6,
				mt4out7, mt4out8, mt4out9, mt4out10, mt4out11, mt4out12, mt4out13, mt4out14, mt4out15, mt4mux_Out,out4d0, out4d1,
				out4d2, out4d3, out4d4, out4d5, out4d6, out4d7, out4d8, out4d9, out4d10, out4d11, out4d12, out4d13, out4d14, 
				out4d15, out4db, out4b0, out4b1, out4b2, out4b3, out4b4, out4b5, out4b6, out4b7, out4b8, out4b9, out4b10, out4b11,
				out4b12, out4b13, out4b14, out4b15, out4bdb, v4out0, v4out1, v4out2, v4out3, v4out4, v4out5, v4out6, v4out7, v4out8,
				v4out9, v4out10, v4out11, v4out12, v4out13, v4out14, v4out15, v4mux_Out, d4out0, d4out1, d4out2, d4out3, d4out4,
				d4out5, d4out6,d4out7, d4out8, d4out9, d4out10, d4out11, d4out12, d4out13,	d4out14, d4out15, d4mux_Out);   

	wire [20:0] mt1aftertsb;
	wire [20:0] mt2aftertsb;
	wire [20:0] mt3aftertsb;
	wire [20:0] mt4aftertsb;
	tristatebuffer tsb1(mt1mux_Out, or16inp1, mt1aftertsb);
	tristatebuffer tsb2(mt2mux_Out, or16inp2, mt2aftertsb);
	tristatebuffer tsb3(mt3mux_Out, or16inp3, mt3aftertsb);
	tristatebuffer tsb4(mt4mux_Out, or16inp4, mt4aftertsb);
	
	wire [3:0] outMTC;
   Main_Tag_Comparator mtc1(tagIn[24:4], mt1aftertsb, outMTC[0] );
   Main_Tag_Comparator mtc2(tagIn[24:4], mt2aftertsb, outMTC[1] );
	Main_Tag_Comparator mtc3(tagIn[24:4], mt3aftertsb, outMTC[2] );
	Main_Tag_Comparator mtc4(tagIn[24:4], mt4aftertsb, outMTC[3] );
  
	
  wire [1:0] encout;
	 encoder4_to_2  enc ( {outMTC[3]&&v4mux_Out ,outMTC[2]&&v3mux_Out ,outMTC[1]&&v2mux_Out ,outMTC[0]&&v1mux_Out},  
	 encout,hit);
	wire easyhit;
	assign easyhit =  or16inp1 || or16inp2 || or16inp3 || or16inp4;
	 wire [3:0] dataread;
	 cachecontrol ctrl(clk, reset, memRead, memWrite, easyhit, hit, waysel, {dataWr1,dataWr2,dataWr3,dataWr4},
	 {tagWr1,tagWr2,tagWr3,tagWr4},{dirtyWr1,dirtyWr2,dirtyWr3,dirtyWr4},{validWr1,validWr2,validWr3,validWr4},
	 {dirtyin1,dirtyin2,dirtyin3,dirtyin4});
	 
	 
	reg [1:0] outcb;
		//lfsr ll(clk, reset, outcb);
	always @(hit)
   begin	
	outcb = $random%4; //2'b00
	end
	
	mux2to1_2bit themux (outcb, encout, hit, waysel);
	
	

  mux4to1_1bit validfinmux ( v4mux_Out, v3mux_Out,v2mux_Out, v1mux_Out, waysel, valid );
  mux4to1_1bit dirtyfinmux ( d4mux_Out, d3mux_Out, d2mux_Out, d1mux_Out, waysel, dirty );
  
  mux4to1_32bits bits32finmux ( memRead, out4bdb, out3bdb,out2bdb, out1bdb, waysel, WordDataOutFromCache);
  mux4to1_25bits tagfinmux ( { mt4mux_Out, ht4mux_Out}, {mt3mux_Out, ht3mux_Out},{ mt2mux_Out, ht2mux_Out}, {mt1mux_Out, ht1mux_Out},
  waysel, tag_out);
   mux4to1_16byte  datablockreplace(out4db, out3db, out2db, out1db,waysel,BlockGettingReplaced);
 
  mux2to1_1bit writeBackSignalToMainMemory1( 1'b0, 1'b1, ~hit && dirty, writeBackSignalToMainMemory);
  
endmodule


module cacheTestbench;
  
  reg clk;
  reg reset;

  reg [127:0] BlockIntoTheCache;
  
  reg [15:0] TwoByteIntoCache;
  reg [24:0] tagIn;
  reg [3:0] indexIn;
  reg [2:0] offsetIn;
  reg memWrite;    
  reg memRead;
  wire hit;   
  wire dirty; 
  wire valid;   
  wire [1:0] waysel;
  wire [24:0] tag_out;  
  wire [127:0] BlockGettingReplaced;   
  wire [31:0] WordDataOutFromCache;
  wire writeBackSignalToMainMemory;
  cache cache_1(.clk(clk), .reset(reset), .TwoByteIntoCache(TwoByteIntoCache), .BlockIntoTheCache(BlockIntoTheCache),
  .tagIn(tagIn), .indexIn(indexIn), .offsetIn(offsetIn), .memWrite(memWrite), .memRead(memRead), .hit(hit), .valid(valid),
  .dirty(dirty), .tag_out(tag_out), .waysel(waysel), .BlockGettingReplaced(BlockGettingReplaced),
  .WordDataOutFromCache(WordDataOutFromCache), .writeBackSignalToMainMemory(writeBackSignalToMainMemory));
  
  always
    #5 clk=~clk;
	 
	 initial begin 
	  clk = 0;
	  reset = 1;
	  
	  #10 reset = 0; 
	  
	  
	  #10
	   memRead = 1;  
      memWrite = 0;
      tagIn = 25'b0_0000_0000_0001_0001_0010_0100;
      indexIn = 4'b0001;
      offsetIn = 3'b011;
		BlockIntoTheCache = 128'hAA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22;
		TwoByteIntoCache = 16'd0;
		
		#30
	   memRead = 1;  
      memWrite = 0;
      tagIn = 25'b0_0000_0000_0001_0001_0010_0101;
      indexIn = 4'b0010;
      offsetIn = 3'b011;
		BlockIntoTheCache = 128'hAA_BB_CC_CC_EE_11_11_EE_AA_BB_FF_DD_EE_00_11_22;
		TwoByteIntoCache = 16'd0;
		
		#40
		memRead = 1;  
      memWrite = 0;
      tagIn = 25'b0_0000_0000_0001_0001_0010_0100;
      indexIn = 4'b0001;
      offsetIn = 3'b010;
		BlockIntoTheCache = 128'hAA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_22_22;
		TwoByteIntoCache = 16'd0;
		
		#40
		
		memRead = 0;  
      memWrite = 1;
      tagIn = 25'b0_0000_0000_0001_0001_0010_0101;
      indexIn = 4'b0010;
      offsetIn = 3'b010;
		BlockIntoTheCache = 128'hAA_BB_CC_CC_EE_11_11_EE_AA_BB_FF_DD_EE_00_11_22;
		TwoByteIntoCache = 16'd0;
		
		#40
		memRead = 1;  
      memWrite = 0;
      tagIn = 25'b0_0000_0000_0001_0001_0010_0101;
      indexIn = 4'b0010;
      offsetIn = 3'b010;
		BlockIntoTheCache = 128'hAA_BB_CC_CC_EE_11_11_EE_AA_BB_FF_DD_EE_00_11_22;
		TwoByteIntoCache = 16'd0;
		
		#40
		memRead = 1;  
      memWrite = 0;
      tagIn = 25'b0_0011_0000_0001_0001_0010_0101;
      indexIn = 4'b0010;
      offsetIn = 3'b010;
		BlockIntoTheCache = 128'hAA_BB_CC_CC_EE_11_11_EE_AA_BB_FF_DD_EE_00_11_22;
		TwoByteIntoCache = 16'd0;
		
		#40
		memRead = 0;  
      memWrite = 1;
      tagIn = 25'b0_0011_0000_0001_1000_0010_0101;
      indexIn = 4'b0010;
      offsetIn = 3'b010;
		BlockIntoTheCache = 128'hAA_BB_CC_CC_EE_11_11_EE_AA_BB_FF_DD_EE_00_11_22;
		TwoByteIntoCache = 16'd0;
		
		
		#40
		memRead = 1;  
      memWrite = 0;
      tagIn = 25'b0_0011_0000_0001_1000_0010_0101;
      indexIn = 4'b0010;
      offsetIn = 3'b010;
		BlockIntoTheCache = 128'hAA_BB_CC_CC_EE_11_11_EE_AA_BB_FF_DD_EE_00_11_22;
		TwoByteIntoCache = 16'd0;
		
	#50 $finish;
   end	

  
    
endmodule
