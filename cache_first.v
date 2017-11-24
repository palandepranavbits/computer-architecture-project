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
module mux4to1_16byte(input enable, input [127:0] in1, in2, in3, in4, input select, output reg [127:0] muxOut);
  always @ ( in1 or in2 or in3 or in4 or select)
  begin
    if(enable)
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


module mux16to1_1bit (input outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12,
							 outR13, outR14, outR15, input [3:0] Sel, output reg outBus );
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

module encoder4_to_2 (input [3:0] in1, output reg encOut, output reg Hit );
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

module Halt_Tag_Array (input clk, input reset, input haltTagWrite, input [3:0] select, input [15:0] index, input [3:0] haltTagIn,
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
	TwoBytes b15 ( clk, reset, dataWrite, offset[15], tbwrite, hit, writeData, missData[127:120], outD[127:120]);
	
	mux16to1_16bits data16mux ( outD[7:0], outD[15:8], outD[23:16], outD[31:24], outD[39:32], outD[47:40], outD[55:48],
	outD[63:56], outD[71:64], outD[79:72], outD[87:80], outD[95:88], outD[103:96], outD[111:104], outD[119:112],
	outD[127:120], selOffset, outByte ); 

endmodule


module way (input clk, input reset, input mainTagWrite, input enWrite, input validWrite, input dirtyWrite, input dirtyIn, 
				input hit, input [3:0] select, input [15:0] index, input [2:0] addOffset, input [15:0] offset, 
				input [20:0] AddressTag, input [7:0] writeData, input [127:0] missData, output [20:0] mainTagOut0, mainTagOut1,
				mainTagOut2, mainTagOut3, mainTagOut4, mainTagOut5, mainTagOut6, mainTagOut7, mainTagOut8, mainTagOut9,
				mainTagOut10, mainTagOut11, mainTagOut12, mainTagOut13, mainTagOut14, mainTagOut15, maintagdb, output [127:0] outD0,
				outD1, outD2, outD3, outD4, outD5, outD6, outD7, outD8, outD9, outD10, outD11, outD12, outD13, outD14, outD15,
				outdb, output [7:0] outB0, outB1, outB2, outB3, outB4, outB5, outB6, outB7, outB8, outB9, outB10, outB11, outB12,
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
		
	mux16to1_16bits data2bytemux ( outB0, outB1, outB2, outB3, outB4, outB5, outB6, outB7, outB8, outB9, outB10, outB11, outB12, outB13, 
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

module cache_ctrl_ckt(
	);

module cache(
    );


endmodule
