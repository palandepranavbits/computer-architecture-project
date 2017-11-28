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


/////////////////////////////////IM begins////////////////////////////////////////

module D_ff_IM (input clk, input reset, input d, output reg q);
	always@(reset or negedge clk)
		begin
			if(reset)
			q=d;
		end
endmodule 

module register_IM(input clk, input reset, input[31:0] d_input, output[31:0] q_output);
	
	D_ff_IM d_00(clk, reset, d_input[0], q_output[0]);
	D_ff_IM d_01(clk, reset, d_input[1], q_output[1]);
	D_ff_IM d_02(clk, reset, d_input[2], q_output[2]);
	D_ff_IM d_03(clk, reset, d_input[3], q_output[3]);
	D_ff_IM d_04(clk, reset, d_input[4], q_output[4]);
	D_ff_IM d_05(clk, reset, d_input[5], q_output[5]);
	D_ff_IM d_06(clk, reset, d_input[6], q_output[6]);
	D_ff_IM d_07(clk, reset, d_input[7], q_output[7]);
	D_ff_IM d_08(clk, reset, d_input[8], q_output[8]);
	D_ff_IM d_09(clk, reset, d_input[9], q_output[9]);
	D_ff_IM d_10(clk, reset, d_input[10], q_output[10]);
	D_ff_IM d_11(clk, reset, d_input[11], q_output[11]);
	D_ff_IM d_12(clk, reset, d_input[12], q_output[12]);
	D_ff_IM d_13(clk, reset, d_input[13], q_output[13]);
	D_ff_IM d_14(clk, reset, d_input[14], q_output[14]);
	D_ff_IM d_15(clk, reset, d_input[15], q_output[15]);
	D_ff_IM d_16(clk, reset, d_input[16], q_output[16]);
	D_ff_IM d_17(clk, reset, d_input[17], q_output[17]);
	D_ff_IM d_18(clk, reset, d_input[18], q_output[18]);
	D_ff_IM d_19(clk, reset, d_input[19], q_output[19]);
	D_ff_IM d_20(clk, reset, d_input[20], q_output[20]);
	D_ff_IM d_21(clk, reset, d_input[21], q_output[21]);
	D_ff_IM d_22(clk, reset, d_input[22], q_output[22]);
	D_ff_IM d_23(clk, reset, d_input[23], q_output[23]);
	D_ff_IM d_24(clk, reset, d_input[24], q_output[24]);
	D_ff_IM d_25(clk, reset, d_input[25], q_output[25]);
	D_ff_IM d_26(clk, reset, d_input[26], q_output[26]);
	D_ff_IM d_27(clk, reset, d_input[27], q_output[27]);
	D_ff_IM d_28(clk, reset, d_input[28], q_output[28]);
	D_ff_IM d_29(clk, reset, d_input[29], q_output[29]);
	D_ff_IM d_30(clk, reset, d_input[30], q_output[30]);
	D_ff_IM d_31(clk, reset, d_input[31], q_output[31]);

endmodule

module mux32to1_IM(input [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
	outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,outR32,outR33,
	outR34,outR35,outR36,outR37,outR38,outR39,outR40,outR41,outR42,outR43,outR44,outR45,outR46,outR47,outR48,outR49,outR50,outR51,
	outR52,outR53,outR54,outR55,outR56,outR57,outR58,outR59,outR60,outR61,outR62,outR63,
	input [4:0] Sel, output reg [63:0] outBus );
	
	always@(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
		outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,outR32,outR33,
	outR34,outR35,outR36,outR37,outR38,outR39,outR40,outR41,outR42,outR43,outR44,outR45,outR46,outR47,outR48,outR49,outR50,outR51,
	outR52,outR53,outR54,outR55,outR56,outR57,outR58,outR59,outR60,outR61,outR62,outR63,
		Sel)
		case (Sel)
			5'd0: outBus = {outR0,outR1};
			5'd1: outBus = {outR2,outR3};
			5'd2: outBus = {outR4,outR5};
			5'd3: outBus = {outR6,outR7};
			5'd4: outBus = {outR8,outR9};
			5'd5: outBus = {outR10,outR11};
			5'd6: outBus = {outR12,outR13};
			5'd7: outBus = {outR14,outR15};
			5'd8: outBus = {outR16,outR17};
			5'd9: outBus = {outR18,outR19};
			5'd10: outBus = {outR20,outR21};
			5'd11: outBus = {outR22,outR23};
			5'd12: outBus = {outR24,outR25};
			5'd13: outBus = {outR26,outR27};
			5'd14: outBus = {outR28,outR29};
			5'd15: outBus = {outR30,outR31};
			5'd16: outBus = {outR32,outR33};
			5'd17: outBus = {outR34,outR35};
			5'd18: outBus = {outR36,outR37};
			5'd19: outBus = {outR38,outR39};
			5'd20: outBus = {outR40,outR41};
			5'd21: outBus = {outR42,outR43};
			5'd22: outBus = {outR44,outR45};
			5'd23: outBus = {outR46,outR47};
			5'd24: outBus = {outR48,outR49};
			5'd25: outBus = {outR50,outR51};
			5'd26: outBus = {outR52,outR53};
			5'd27: outBus = {outR54,outR55};
			5'd28: outBus = {outR56,outR57};
			5'd29: outBus = {outR58,outR59};
			5'd30: outBus = {outR60,outR61};
			5'd31: outBus = {outR62,outR63};
		endcase
endmodule
 
module IM(input clk, input reset, input[5:0] PC_Sel, output[63:0] IR);
	wire [31:0] Qout00, Qout01, Qout02, Qout03, Qout04, Qout05, Qout06, Qout07,
					Qout08, Qout09, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,
					Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23,
					Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31,
					Qout32, Qout33, Qout34, Qout35, Qout36, Qout37, Qout38, Qout39,
					Qout40, Qout41, Qout42, Qout43, Qout44, Qout45, Qout46, Qout47,
					Qout48, Qout49, Qout50, Qout51, Qout52, Qout53, Qout54, Qout55,
					Qout56, Qout57, Qout58, Qout59, Qout60, Qout61, Qout62, Qout63;
	
	register_IM reg62(clk, reset, 32'h0000_0000, Qout62);
	register_IM reg63(clk, reset, 32'h0000_0000, Qout63);
	register_IM reg00(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout00);
	register_IM reg01(clk, reset, 32'b0000_0000_0000_0000_010_0_00001_00100_01, Qout01); //C.LI $1 000100
	register_IM reg02(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout02); 
	register_IM reg03(clk, reset, 32'b0000_0000_0000_0000_010_1_00010_10110_01, Qout03); //C.LI $2 110110
	register_IM reg04(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout04);
	register_IM reg05(clk, reset, 32'b0000_0000_0000_0000_010_1_00011_11010_01, Qout05); //C.LI $3 111010
	register_IM reg06(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout06);
	register_IM reg07(clk, reset, 32'b0000_0000_0000_0000_1000_00100_00001_10, Qout07); //C.MV $4 $1
	register_IM reg08(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout08);
	register_IM reg09(clk, reset, 32'b0000_0000_0000_0000_1000_00101_00010_10, Qout09); //C.MV $5 $2
	register_IM reg10(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout10);
	register_IM reg11(clk, reset, 32'b0000_0000_0000_0000_1000_00110_00011_10, Qout11); //C.MV $6 $3
	register_IM reg12(clk, reset, 32'b0100000_00010_00001_101_00100_0010011, Qout12); //srai $1 $4 00010
	register_IM reg13(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout13); 
	register_IM reg14(clk, reset, 32'b0000000_00011_00100_000_00010_0110011, Qout14); //add $2 $4 $3
	register_IM reg15(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout15);
	register_IM reg16(clk, reset, 32'b111111000000_0111_000_00011_1100111, Qout16); //jalr $3 $7 1111_1100_0000
	register_IM reg17(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout17);
	register_IM reg18(clk, reset, 32'b111000111000_00001_110_00110_0010011, Qout18); // andi $1 $6 111000111000
	register_IM reg19(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout19);
	register_IM reg20(clk, reset, 32'b1100110_00010_00101_001_01100_0100011, Qout20); // sh $5 $2 110011001100
	register_IM reg21(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout21);
	register_IM reg22(clk, reset, 32'b1_111100_00110_00010_101_0000_1_1100011, Qout22); // bge $2 $6 111111000000 
	register_IM reg23(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout23);
	register_IM reg24(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout24);
	register_IM reg25(clk, reset, 32'b0000_0000_0000_0000_010_010_011_11_110_00, Qout25); //C.LW $6 $3 10101
	register_IM reg26(clk, reset, 32'h0000_0000, Qout26);
	register_IM reg27(clk, reset, 32'h0000_0000, Qout27);
	register_IM reg28(clk, reset, 32'h0000_0000, Qout28);
	register_IM reg29(clk, reset, 32'h0000_0000, Qout29);
	register_IM reg30(clk, reset, 32'h0000_0000, Qout30);
	register_IM reg31(clk, reset, 32'h0000_0000, Qout31);
	register_IM reg32(clk, reset, 32'h0000_0000, Qout32);
	register_IM reg33(clk, reset, 32'h0000_0000, Qout33);
	register_IM reg34(clk, reset, 32'h0000_0000, Qout34);
	register_IM reg35(clk, reset, 32'h0000_0000, Qout35);
	register_IM reg36(clk, reset, 32'h0000_0000, Qout36);
	register_IM reg37(clk, reset, 32'h0000_0000, Qout37);
	register_IM reg38(clk, reset, 32'h0000_0000, Qout38);
	register_IM reg39(clk, reset, 32'h0000_0000, Qout39);
	register_IM reg40(clk, reset, 32'h0000_0000, Qout40);
	register_IM reg41(clk, reset, 32'h0000_0000, Qout41);
	register_IM reg42(clk, reset, 32'h0000_0000, Qout42);
	register_IM reg43(clk, reset, 32'h0000_0000, Qout43);
	register_IM reg44(clk, reset, 32'h0000_0000, Qout44);
	register_IM reg45(clk, reset, 32'h0000_0000, Qout45);
	register_IM reg46(clk, reset, 32'h0000_0000, Qout46);
	register_IM reg47(clk, reset, 32'h0000_0000, Qout47);
	register_IM reg48(clk, reset, 32'h0000_0000, Qout48);
	register_IM reg49(clk, reset, 32'h0000_0000, Qout49);
	register_IM reg50(clk, reset, 32'h0000_0000, Qout50);
	register_IM reg51(clk, reset, 32'h0000_0000, Qout51);
	register_IM reg52(clk, reset, 32'h0000_0000, Qout52);
	register_IM reg53(clk, reset, 32'h0000_0000, Qout53);
	register_IM reg54(clk, reset, 32'h0000_0000, Qout54);
	register_IM reg55(clk, reset, 32'h0000_0000, Qout55);
	register_IM reg56(clk, reset, 32'h0000_0000, Qout56);
	register_IM reg57(clk, reset, 32'h0000_0000, Qout57);
	register_IM reg58(clk, reset, 32'h0000_0000, Qout58);
	register_IM reg59(clk, reset, 32'h0000_0000, Qout59);
	register_IM reg60(clk, reset, 32'h0000_0000, Qout60);
	register_IM reg61(clk, reset, 32'h0000_0000, Qout61);
	
	
	mux32to1_IM IM_Mux( Qout62, Qout63, Qout00, Qout01, Qout02, Qout03, Qout04, Qout05, Qout06, Qout07,
					Qout08, Qout09, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,
					Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23,
					Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31,
					Qout32, Qout33, Qout34, Qout35, Qout36, Qout37, Qout38, Qout39,
					Qout40, Qout41, Qout42, Qout43, Qout44, Qout45, Qout46, Qout47,
					Qout48, Qout49, Qout50, Qout51, Qout52, Qout53, Qout54, Qout55,
					Qout56, Qout57, Qout58, Qout59, Qout60, Qout61, {1'b0,PC_Sel[5:2]}, IR);
					
endmodule
	


/////////////////////////////////IM ends//////////////////////////////////////////

 
///////////////////////////////////Data memory begins//////////////////////////////

module D_ff_DM(input clk, input reset, input MemWr, input MemWrComp, input start, input in, output reg D_out);
	
	always@(negedge clk)
		begin
		if(reset==1)
			D_out=start;
		else
			if(MemWr==1||MemWrComp==1)
				D_out=in;
		end
endmodule


module Register_DM(input clk, input reset, input MemWr, input MemWrComp, input[31:0] start, input[31:0] in,
				output[31:0] RegOut);

	D_ff_DM D_00(clk, reset, MemWr, MemWrComp, start[0], in[0], RegOut[0]);
	D_ff_DM D_01(clk, reset, MemWr, MemWrComp, start[1], in[1], RegOut[1]);
	D_ff_DM D_02(clk, reset, MemWr, MemWrComp, start[2], in[2], RegOut[2]);
	D_ff_DM D_03(clk, reset, MemWr, MemWrComp, start[3], in[3], RegOut[3]);
	D_ff_DM D_04(clk, reset, MemWr, MemWrComp, start[4], in[4], RegOut[4]);
	D_ff_DM D_05(clk, reset, MemWr, MemWrComp, start[5], in[5], RegOut[5]);
	D_ff_DM D_06(clk, reset, MemWr, MemWrComp, start[6], in[6], RegOut[6]);
	D_ff_DM D_07(clk, reset, MemWr, MemWrComp, start[7], in[7], RegOut[7]);
	D_ff_DM D_08(clk, reset, MemWr, MemWrComp, start[8], in[8], RegOut[8]);
	D_ff_DM D_09(clk, reset, MemWr, MemWrComp, start[9], in[9], RegOut[9]);
	D_ff_DM D_10(clk, reset, MemWr, MemWrComp, start[10], in[10], RegOut[10]);
	D_ff_DM D_11(clk, reset, MemWr, MemWrComp, start[11], in[11], RegOut[11]);
	D_ff_DM D_12(clk, reset, MemWr, MemWrComp, start[12], in[12], RegOut[12]);
	D_ff_DM D_13(clk, reset, MemWr, MemWrComp, start[13], in[13], RegOut[13]);
	D_ff_DM D_14(clk, reset, MemWr, MemWrComp, start[14], in[14], RegOut[14]);
	D_ff_DM D_15(clk, reset, MemWr, MemWrComp, start[15], in[15], RegOut[15]);
	D_ff_DM D_16(clk, reset, MemWr, MemWrComp, start[16], in[16], RegOut[16]);
	D_ff_DM D_17(clk, reset, MemWr, MemWrComp, start[17], in[17], RegOut[17]);
	D_ff_DM D_18(clk, reset, MemWr, MemWrComp, start[18], in[18], RegOut[18]);
	D_ff_DM D_19(clk, reset, MemWr, MemWrComp, start[19], in[19], RegOut[19]);
	D_ff_DM D_20(clk, reset, MemWr, MemWrComp, start[20], in[20], RegOut[20]);
	D_ff_DM D_21(clk, reset, MemWr, MemWrComp, start[21], in[11], RegOut[21]);
	D_ff_DM D_22(clk, reset, MemWr, MemWrComp, start[22], in[22], RegOut[22]);
	D_ff_DM D_23(clk, reset, MemWr, MemWrComp, start[23], in[23], RegOut[23]);
	D_ff_DM D_24(clk, reset, MemWr, MemWrComp, start[24], in[24], RegOut[24]);
	D_ff_DM D_25(clk, reset, MemWr, MemWrComp, start[25], in[25], RegOut[25]);
	D_ff_DM D_26(clk, reset, MemWr, MemWrComp, start[26], in[26], RegOut[26]);
	D_ff_DM D_27(clk, reset, MemWr, MemWrComp, start[27], in[27], RegOut[27]);
	D_ff_DM D_28(clk, reset, MemWr, MemWrComp, start[28], in[28], RegOut[28]);
	D_ff_DM D_29(clk, reset, MemWr, MemWrComp, start[29], in[29], RegOut[29]);
	D_ff_DM D_30(clk, reset, MemWr, MemWrComp, start[30], in[30], RegOut[30]);
	D_ff_DM D_31(clk, reset, MemWr, MemWrComp, start[31], in[31], RegOut[31]);
	
endmodule




module Mux16to1(input[31:0] Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, 
					Out09, Out10, Out11, Out12, Out13, Out14, Out15, input[3:0] Sel,input MemRd, output reg [31:0] MuxOut);
	always@(Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, Out10, Out11, Out12, Out13, 
	Out14, Out15, Sel)
		begin
		if(MemRd == 1)
			begin
				case(Sel)
					4'b0000:MuxOut=Out00;
					4'b0001:MuxOut=Out01;
					4'b0010:MuxOut=Out02;
					4'b0011:MuxOut=Out03;
					4'b0100:MuxOut=Out04;
					4'b0101:MuxOut=Out05;
					4'b0110:MuxOut=Out06;
					4'b0111:MuxOut=Out07;
					4'b1000:MuxOut=Out08;
					4'b1001:MuxOut=Out09;
					4'b1010:MuxOut=Out10;
					4'b1011:MuxOut=Out11;
					4'b1100:MuxOut=Out12;
					4'b1101:MuxOut=Out13;
					4'b1110:MuxOut=Out14;
					4'b1111:MuxOut=Out15;
				endcase 
			end
		else
			MuxOut=32'b0;
		end

endmodule

module Decoder4to16(input[3:0]in, output reg [15:0]decOut);

always@(in)
begin
	case(in)
	4'd0:decOut=16'b0000_0000_0000_0001;
	4'd1:decOut=16'b0000_0000_0000_0010;
	4'd2:decOut=16'b0000_0000_0000_0100;
	4'd3:decOut=16'b0000_0000_0000_1000;
	4'd4:decOut=16'b0000_0000_0001_0000;
	4'd5:decOut=16'b0000_0000_0010_0000;
	4'd6:decOut=16'b0000_0000_0100_0000;
	4'd7:decOut=16'b0000_0000_1000_0000;
	4'd8:decOut=16'b0000_0001_0000_0000;
	4'd9:decOut=16'b0000_0010_0000_0000;
	4'd10:decOut=16'b0000_0100_0000_0000;
	4'd11:decOut=16'b0000_1000_0000_0000;
	4'd12:decOut=16'b0001_0000_0000_0000;
	4'd13:decOut=16'b0010_0000_0000_0000; 
	4'd14:decOut=16'b0100_0000_0000_0000;
	4'd15:decOut=16'b1000_0000_0000_0000;
	endcase
end
endmodule


module DM(input clk, input reset,input MemRd, input MemRdComp, input MemWr, input MemWrComp, input[31:0] in, input[31:0] addr, 
		input[31:0] addr_c, output[31:0] DM_out);

	wire[31:0] Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, Out10, Out11, Out12, Out13,
	Out14, Out15;
	wire[15:0] decOut, decOut_c;
	
	
	Decoder4to16 dec1(addr[5:2],decOut);
	Decoder4to16 dec2(addr_c[5:2],decOut_c);
	

	Register_DM Reg00(clk, reset, decOut[0]&MemWr, decOut_c[0]&MemWrComp, 32'd12, in, Out00);
	Register_DM Reg01(clk, reset, decOut[1]&MemWr, decOut_c[1]&MemWrComp, 32'd32, in, Out01);
	Register_DM Reg02(clk, reset, decOut[2]&MemWr, decOut_c[2]&MemWrComp, 32'd4, in, Out02);
	Register_DM Reg03(clk, reset, decOut[3]&MemWr, decOut_c[3]&MemWrComp, 32'd5, in, Out03);
	Register_DM Reg04(clk, reset, decOut[4]&MemWr, decOut_c[4]&MemWrComp, 32'd45, in, Out04);
	Register_DM Reg05(clk, reset, decOut[5]&MemWr, decOut_c[5]&MemWrComp, 32'd12, in, Out05);
	Register_DM Reg06(clk, reset, decOut[6]&MemWr, decOut_c[6]&MemWrComp, 32'd42, in, Out06);
	Register_DM Reg07(clk, reset, decOut[7]&MemWr, decOut_c[7]&MemWrComp, 32'd13, in, Out07);
	Register_DM Reg08(clk, reset, decOut[8]&MemWr, decOut_c[8]&MemWrComp, 32'd34, in, Out08);
	Register_DM Reg09(clk, reset, decOut[9]&MemWr, decOut_c[9]&MemWrComp, 32'd9, in, Out09);
	Register_DM Reg10(clk, reset, decOut[10]&MemWr, decOut_c[10]&MemWrComp, 32'd23, in, Out10);
	Register_DM Reg11(clk, reset, decOut[11]&MemWr, decOut_c[11]&MemWrComp, 32'd76, in, Out11);
	Register_DM Reg12(clk, reset, decOut[12]&MemWr, decOut_c[12]&MemWrComp, 32'd17, in, Out12);
	Register_DM Reg13(clk, reset, decOut[13]&MemWr, decOut_c[13]&MemWrComp, 32'd13, in, Out13);
	Register_DM Reg14(clk, reset, decOut[14]&MemWr, decOut_c[14]&MemWrComp, 32'd33, in, Out14);
	Register_DM Reg15(clk, reset, decOut[15]&MemWr, decOut_c[15]&MemWrComp, 32'd21, in, Out15);
	
	Mux16to1 Mux1(Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, Out10, Out11, 
	Out12, Out13, Out14, Out15, addr[5:2], MemRd | MemRdComp,DM_out);
	
endmodule





///////////////////////////////////Data Memory ends/////////////////////////////////// 
 
///////////////////////////////regfile///////////////////////////////////////


module D_ff(input clk, input reset, input regWrite, input regWrite_c , input decOut , input decOut_c ,
			input d, input d_c, output reg q);
	always @ (negedge clk)
	begin
		if(reset == 1'b1)
			q = 1'b0;
		else
			if(regWrite == 1'b1 && decOut == 1'b1)
				begin
					q = d;
				end
			else if(regWrite_c == 1'b1 && decOut_c == 1'b1)
				begin
					q = d_c;
				end

	end
endmodule


module decoder5to32(input [4:0] destReg, output reg [31:0] decOut);
	always@(destReg)
	begin
		case(destReg)
			5'd0  : decOut = 32'b00000000000000000000000000000001;
			5'd1  : decOut = 32'b00000000000000000000000000000010;
			5'd2  : decOut = 32'b00000000000000000000000000000100;
			5'd3  : decOut = 32'b00000000000000000000000000001000;
			5'd4  : decOut = 32'b00000000000000000000000000010000;
			5'd5  : decOut = 32'b00000000000000000000000000100000;
			5'd6  : decOut = 32'b00000000000000000000000001000000;
			5'd7  : decOut = 32'b00000000000000000000000010000000;
			5'd8  : decOut = 32'b00000000000000000000000100000000;
			5'd9  : decOut = 32'b00000000000000000000001000000000;
			5'd10 : decOut = 32'b00000000000000000000010000000000;
			5'd11 : decOut = 32'b00000000000000000000100000000000;
			5'd12 : decOut = 32'b00000000000000000001000000000000;
			5'd13 : decOut = 32'b00000000000000000010000000000000;
			5'd14 : decOut = 32'b00000000000000000100000000000000;
			5'd15 : decOut = 32'b00000000000000001000000000000000;
			5'd16 : decOut = 32'b00000000000000010000000000000000;
			5'd17 : decOut = 32'b00000000000000100000000000000000;
			5'd18 : decOut = 32'b00000000000001000000000000000000;
			5'd19 : decOut = 32'b00000000000010000000000000000000;
			5'd20 : decOut = 32'b00000000000100000000000000000000;
			5'd21 : decOut = 32'b00000000001000000000000000000000;
			5'd22 : decOut = 32'b00000000010000000000000000000000;
			5'd23 : decOut = 32'b00000000100000000000000000000000;
			5'd24 : decOut = 32'b00000001000000000000000000000000;
			5'd25 : decOut = 32'b00000010000000000000000000000000;
			5'd26 : decOut = 32'b00000100000000000000000000000000;
			5'd27 : decOut = 32'b00001000000000000000000000000000;
			5'd28 : decOut = 32'b00010000000000000000000000000000;
			5'd29 : decOut = 32'b00100000000000000000000000000000;
			5'd30 : decOut = 32'b01000000000000000000000000000000;
			5'd31 : decOut = 32'b10000000000000000000000000000000;
		endcase
	end
endmodule

module mux32to1(input [31:0] outR0, input [31:0] outR1, input [31:0] outR2, input [31:0] outR3,
	input [31:0] outR4, input [31:0] outR5, input [31:0] outR6, input [31:0] outR7,
	input [31:0] outR8, input [31:0] outR9, input [31:0] outR10, input [31:0] outR11,
	input [31:0] outR12, input [31:0] outR13, input [31:0] outR14, input [31:0] outR15,
	input [31:0] outR16, input [31:0] outR17, input [31:0] outR18, input [31:0] outR19,
	input [31:0] outR20, input [31:0] outR21, input [31:0] outR22, input [31:0] outR23,
	input [31:0] outR24, input [31:0] outR25, input [31:0] outR26, input [31:0] outR27,
	input [31:0] outR28, input [31:0] outR29, input [31:0] outR30, input [31:0] outR31,
	input [4:0] Sel, output reg [31:0] outBus);

	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9
	or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or outR16 or outR17 or outR18 or outR19
	or outR20 or outR21 or outR22 or outR23 or outR24 or outR25 or outR26 or outR27 or outR28 or outR29
	or	outR30 or outR31 or Sel)
	begin
		case(Sel)
			5'd0  : outBus = outR0;
			5'd1  : outBus = outR1;
			5'd2  : outBus = outR2;
			5'd3  : outBus = outR3;
			5'd4  : outBus = outR4;
			5'd5  : outBus = outR5;
			5'd6  : outBus = outR6;
			5'd7  : outBus = outR7;
			5'd8  : outBus = outR8;
			5'd9  : outBus = outR9;
			5'd10 : outBus = outR10;
			5'd11 : outBus = outR11;
			5'd12 : outBus = outR12;
			5'd13 : outBus = outR13;
			5'd14 : outBus = outR14;
			5'd15 : outBus = outR15;
			5'd16 : outBus = outR16;
			5'd17 : outBus = outR17;
			5'd18 : outBus = outR18;
			5'd19 : outBus = outR19;
			5'd20 : outBus = outR20;
			5'd21 : outBus = outR21;
			5'd22 : outBus = outR22;
			5'd23 : outBus = outR23;
			5'd24 : outBus = outR24;
			5'd25 : outBus = outR25;
			5'd26 : outBus = outR26;
			5'd27 : outBus = outR27;
			5'd28 : outBus = outR28;
			5'd29 : outBus = outR29;
			5'd30 : outBus = outR30;
			5'd31 : outBus = outR31;
		endcase
	end

endmodule
/*
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
*/
/*
module busOutput(input [31:0] reg_rx, input mode, input rx3, output [31:0] rxOut);

	//Write your code here

	begin
		wire notrx3;
		not(notrx3,rx3);
		wire lowSelect;
		or(lowSelect,notrx3,mode);

		
		mux2to1_16bits(16'b0,reg_rx[15:0], lowSelect, rxOut[15:0]);//wire [15:0]rxOutconcat1;wire [15:0]rxOutconcat2;
		mux2to1_16bits(16'b0,reg_rx[31:16], mode, rxOut[31:16]);

	end

endmodule
*/
module register32bit( input clk, input reset, input regWrite, input decOut, input regWrite_c, input decOut_c,
	input [31:0] writeData, input [31:0] writeData_c, output  [31:0] outR );

	/*D_ff(input clk, input reset, input regWrite, input regWrite_c , input decOut , input decOut_c ,
			input d, input d_c, output reg q);*/

	D_ff d00_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[0],  writeData_c[0],  outR[0]);
	D_ff d01_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[1],  writeData_c[1],  outR[1]);
	D_ff d02_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[2],  writeData_c[2],  outR[2]);
	D_ff d03_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[3],  writeData_c[3],  outR[3]);
	D_ff d04_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[4],  writeData_c[4],  outR[4]);
	D_ff d05_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[5],  writeData_c[5],  outR[5]);
	D_ff d06_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[6],  writeData_c[6],  outR[6]);
	D_ff d07_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[7],  writeData_c[7],  outR[7]);
	D_ff d08_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[8],  writeData_c[8],  outR[8]);
	D_ff d09_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[9],  writeData_c[9],  outR[9]);
	D_ff d10_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[10], writeData_c[10], outR[10]);
	D_ff d11_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[11], writeData_c[11], outR[11]);
	D_ff d12_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[12], writeData_c[12], outR[12]);
	D_ff d13_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[13], writeData_c[13], outR[13]);
	D_ff d14_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[14], writeData_c[14], outR[14]);
	D_ff d15_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[15], writeData_c[15], outR[15]);
   D_ff d16_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[16], writeData_c[16], outR[16]);
	D_ff d17_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[17], writeData_c[17], outR[17]);
	D_ff d18_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[18], writeData_c[18], outR[18]);
	D_ff d19_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[19], writeData_c[19], outR[19]);
	D_ff d20_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[20], writeData_c[20], outR[20]);
	D_ff d21_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[21], writeData_c[21], outR[21]);
	D_ff d22_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[22], writeData_c[22], outR[22]);
	D_ff d23_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[23], writeData_c[23], outR[23]);
   D_ff d24_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[24], writeData_c[24], outR[24]);
	D_ff d25_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[25], writeData_c[25], outR[25]);
	D_ff d26_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[26], writeData_c[26], outR[26]);
	D_ff d27_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[27], writeData_c[27], outR[27]);
	D_ff d28_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[28], writeData_c[28], outR[28]);
	D_ff d29_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[29], writeData_c[29], outR[29]);
	D_ff d30_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[30], writeData_c[30], outR[30]);
	D_ff d31_rf(clk, reset, regWrite, regWrite_c, decOut, decOut_c, writeData[31], writeData_c[31], outR[31]);

endmodule

module registerSet( input clk, input reset, input regWrite, input [31:0] decOut, input regWrite_c, input [31:0] decOut_c,
	input [31:0] writeData, input [31:0] writeData_c, output [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,
		outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,
		outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31);
		
		/*register32bit( input clk, input reset, input regWrite, input decOut, input regWrite_c, input decOut_c,
	input [31:0] writeData, input [31:0] writeData_c, output  [31:0] outR );
*/
		register32bit r00_rf( clk, reset, regWrite, decOut[0],  regWrite_c, decOut_c[0],  writeData, writeData_c, outR0 );
		register32bit r01_rf( clk, reset, regWrite, decOut[1],  regWrite_c, decOut_c[1],  writeData, writeData_c, outR1 );
		register32bit r02_rf( clk, reset, regWrite, decOut[2],  regWrite_c, decOut_c[2],  writeData, writeData_c, outR2 );
		register32bit r03_rf( clk, reset, regWrite, decOut[3],  regWrite_c, decOut_c[3],  writeData, writeData_c, outR3 );
		register32bit r04_rf( clk, reset, regWrite, decOut[4],  regWrite_c, decOut_c[4],  writeData, writeData_c, outR4 );
		register32bit r05_rf( clk, reset, regWrite, decOut[5],  regWrite_c, decOut_c[5],  writeData, writeData_c, outR5 );
		register32bit r06_rf( clk, reset, regWrite, decOut[6],  regWrite_c, decOut_c[6],  writeData, writeData_c, outR6 );
		register32bit r07_rf( clk, reset, regWrite, decOut[7],  regWrite_c, decOut_c[7],  writeData, writeData_c, outR7 );
		register32bit r08_rf( clk, reset, regWrite, decOut[8],  regWrite_c, decOut_c[8],  writeData, writeData_c, outR8 );
		register32bit r09_rf( clk, reset, regWrite, decOut[9],  regWrite_c, decOut_c[9],  writeData, writeData_c, outR9 );
		register32bit r10_rf( clk, reset, regWrite, decOut[10], regWrite_c, decOut_c[10], writeData, writeData_c, outR10 );
		register32bit r11_rf( clk, reset, regWrite, decOut[11], regWrite_c, decOut_c[11], writeData, writeData_c, outR11 );
		register32bit r12_rf( clk, reset, regWrite, decOut[12], regWrite_c, decOut_c[12], writeData, writeData_c, outR12 );
		register32bit r13_rf( clk, reset, regWrite, decOut[13], regWrite_c, decOut_c[13], writeData, writeData_c, outR13 );
		register32bit r14_rf( clk, reset, regWrite, decOut[14], regWrite_c, decOut_c[14], writeData, writeData_c, outR14 );
		register32bit r15_rf( clk, reset, regWrite, decOut[15], regWrite_c, decOut_c[15], writeData, writeData_c, outR15 );
		register32bit r16_rf( clk, reset, regWrite, decOut[16], regWrite_c, decOut_c[16], writeData, writeData_c, outR16 );
		register32bit r17_rf( clk, reset, regWrite, decOut[17], regWrite_c, decOut_c[17], writeData, writeData_c, outR17 );
		register32bit r18_rf( clk, reset, regWrite, decOut[18], regWrite_c, decOut_c[18], writeData, writeData_c, outR18 );
		register32bit r19_rf( clk, reset, regWrite, decOut[19], regWrite_c, decOut_c[19], writeData, writeData_c, outR19 );
		register32bit r20_rf( clk, reset, regWrite, decOut[20], regWrite_c, decOut_c[20], writeData, writeData_c, outR20 );
		register32bit r21_rf( clk, reset, regWrite, decOut[21], regWrite_c, decOut_c[21], writeData, writeData_c, outR21 );
		register32bit r22_rf( clk, reset, regWrite, decOut[22], regWrite_c, decOut_c[22], writeData, writeData_c, outR22 );
		register32bit r23_rf( clk, reset, regWrite, decOut[23], regWrite_c, decOut_c[23], writeData, writeData_c, outR23 );
		register32bit r24_rf( clk, reset, regWrite, decOut[24], regWrite_c, decOut_c[24], writeData, writeData_c, outR24 );
		register32bit r25_rf( clk, reset, regWrite, decOut[25], regWrite_c, decOut_c[25], writeData, writeData_c, outR25 );
		register32bit r26_rf( clk, reset, regWrite, decOut[26], regWrite_c, decOut_c[26], writeData, writeData_c, outR26 );
		register32bit r27_rf( clk, reset, regWrite, decOut[27], regWrite_c, decOut_c[27], writeData, writeData_c, outR27 );
		register32bit r28_rf( clk, reset, regWrite, decOut[28], regWrite_c, decOut_c[28], writeData, writeData_c, outR28 );
		register32bit r29_rf( clk, reset, regWrite, decOut[29], regWrite_c, decOut_c[29], writeData, writeData_c, outR29 );
		register32bit r30_rf( clk, reset, regWrite, decOut[30], regWrite_c, decOut_c[30], writeData, writeData_c, outR30 );
		register32bit r31_rf( clk, reset, regWrite, decOut[31], regWrite_c, decOut_c[31], writeData, writeData_c, outR31 );


endmodule
module registerFile(input clk, input reset, input regWrite, input regWrite_c, input [4:0] rs, input [4:0] rt,
		input [4:0] rd, input [4:0] rs_c, input [4:0] rt_c, input [4:0] rd_c, input [31:0] writeData, input [31:0] writeData_c,
		output [31:0] rsOut, output [31:0] rtOut,output [31:0] rsOut_c, output [31:0] rtOut_c);

	//Write your code here
	/*mux32to1(input [31:0] outR0, input [31:0] outR1, input [31:0] outR2, input [31:0] outR3,
	input [31:0] outR4, input [31:0] outR5, input [31:0] outR6, input [31:0] outR7,
	input [31:0] outR8, input [31:0] outR9, input [31:0] outR10, input [31:0] outR11,
	input [31:0] outR12, input [31:0] outR13, input [31:0] outR14, input [31:0] outR15,
	input [31:0] outR16, input [31:0] outR17, input [31:0] outR18, input [31:0] outR19,
	input [31:0] outR20, input [31:0] outR21, input [31:0] outR22, input [31:0] outR23,
	input [31:0] outR24, input [31:0] outR25, input [31:0] outR26, input [31:0] outR27,
	input [31:0] outR28, input [31:0] outR29, input [31:0] outR30, input [31:0] outR31,
	input [3:0] Sel, output reg [31:0] outBus);*/

	/*registerSet( input clk, input reset, input regWrite, input [31:0] decOut1, input regWrite_c, input [31:0] decOut,
	input [31:0] writeData, input [31:0] writeData_c, output [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,
		outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,
		outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31);*/

	//decoder5to32(input [4:0] destReg, output reg [31:0] decOut);

	/*mux32to1(input [31:0] outR0, input [31:0] outR1, input [31:0] outR2, input [31:0] outR3,
	input [31:0] outR4, input [31:0] outR5, input [31:0] outR6, input [31:0] outR7,
	input [31:0] outR8, input [31:0] outR9, input [31:0] outR10, input [31:0] outR11,
	input [31:0] outR12, input [31:0] outR13, input [31:0] outR14, input [31:0] outR15,
	input [31:0] outR16, input [31:0] outR17, input [31:0] outR18, input [31:0] outR19,
	input [31:0] outR20, input [31:0] outR21, input [31:0] outR22, input [31:0] outR23,
	input [31:0] outR24, input [31:0] outR25, input [31:0] outR26, input [31:0] outR27,
	input [31:0] outR28, input [31:0] outR29, input [31:0] outR30, input [31:0] outR31,
	input [3:0] Sel, output reg [31:0] outBus);*/

	wire [31:0] decOut,decOut_c;
	decoder5to32 decoder1_rf(rd, decOut);
	decoder5to32 decoder2_rf(rd_c, decOut_c);

	wire [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
					outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,
					outR27,outR28,outR29,outR30,outR31;
	registerSet registerSet1_rf(clk,reset, regWrite, decOut, regWrite_c, decOut_c, writeData, writeData_c,
									outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,
									outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,
									outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31);
	//for rsOut
	mux32to1 mux32to1_1_rf(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,
	outR12, outR13, outR14, outR15, outR16, outR17, outR18,outR19, outR20, outR21, outR22,outR23,
	outR24, outR25, outR26,outR27, outR28, outR29, outR30,outR31,
	rs, rsOut);
	//for rtOut
	mux32to1 mux32to1_2_rf(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,
	outR12, outR13, outR14, outR15, outR16, outR17, outR18,outR19, outR20, outR21, outR22,outR23,
	outR24, outR25, outR26,outR27, outR28, outR29, outR30,outR31,
	rt, rtOut);
	//for rsOut_c
	mux32to1 mux32to1_3_rf(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,
	outR12, outR13, outR14, outR15, outR16, outR17, outR18,outR19, outR20, outR21, outR22,outR23,
	outR24, outR25, outR26,outR27, outR28, outR29, outR30,outR31,
	rs_c, rsOut_c);
   //for rtOut_c
	mux32to1 mux32to1_4_rf(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,
	outR12, outR13, outR14, outR15, outR16, outR17, outR18,outR19, outR20, outR21, outR22,outR23,
	outR24, outR25, outR26,outR27, outR28, outR29, outR30,outR31,
	rt_c, rtOut_c);

endmodule

//////////////////////////////////////end_of_regfile////////////////////////////////////////

/////////////////////////////////////id_pipeline//////////////////////////////////////////

module ctrlckt(input [6:0] opcode, input [2:0] fun3,output reg [1:0]alusrcB, output reg [1:0]aluOp, output reg memRd,
 output reg memWr, output reg regData,output reg branch, output reg regWrite, output reg jumpR);
					
	always@(opcode or fun3)
		begin
			//srai
			if(opcode == 7'b0010011 && fun3 == 3'b101)
				begin
					alusrcB = 2'd1;
					aluOp = 2'd2;
					memRd = 1'b0;
					memWr = 1'b0;
					regData = 1'b0;
					regWrite = 1'b1;
					branch = 1'b0;
					jumpR = 1'b0;
				end
			//add	
			else if(opcode == 7'b0110011)
				begin
					alusrcB = 2'd0;
					aluOp = 2'd0;
					memRd = 1'b0;
					memWr = 1'b0;
					regData = 1'b0;
					regWrite = 1'b1;
					branch = 1'b0;
					jumpR = 1'b0;
				end
			//jalr	
			else if(opcode == 7'b1100111)
				begin
					alusrcB = 2'd2;
					aluOp = 2'd0;
					memRd = 1'b0;
					memWr = 1'b0;
					regData = 1'b1;
					regWrite = 1'b1;
					branch = 1'b0;
					jumpR = 1'b1;
				end
			//andi	
			else if(opcode == 7'b0010011 && fun3 == 3'b110)
				begin
					alusrcB = 2'd2;
					aluOp = 2'd1;
					memRd = 1'b0;
					memWr = 1'b0;
					regData = 1'b0;
					regWrite = 1'b1;
					branch = 1'b0;
					jumpR = 1'b0;
				end
			//sh	
			else if(opcode == 7'b0100011)
				begin
					alusrcB = 2'd2;
					aluOp = 2'd0;
					memRd = 1'b0;
					memWr = 1'b1;
					regData = 1'b0;
					regWrite = 1'b1;
					branch = 1'b0;
					jumpR = 1'b0;
				end
			//bge	
			else if(opcode == 7'b1100011)
				begin
					alusrcB = 2'bxx;
					aluOp = 2'bxx;
					memRd = 1'b0;
					memWr = 1'b0;
					regData = 1'bx;
					regWrite = 1'b0;
					branch = 1'b1;
					jumpR = 1'b0;
				end
		   else
           begin
            	alusrcB = 2'd0;
					aluOp = 2'd0;
					memRd = 1'b0;
					memWr = 1'b0;
					regData = 1'b0;
					regWrite = 1'b0;
					branch = 1'b0;
					jumpR = 1'b0;		  
		     end	
		end
		
					
endmodule					

module ctrlckt_c(input [1:0] opcode_c, output reg memRd_c,  output reg memWr_c, output reg [1:0] regData_c, 
output reg regWrite_c);
	always@(opcode_c)
		begin
			case(opcode_c)
					//c.mv
					2'b10: 
						begin
							memRd_c = 0;
							memWr_c = 0;
							regData_c = 2'b00;
							regWrite_c = 1;
				
						end	
					//c.li	
					2'b01: 
						begin
							memRd_c = 0;
							memWr_c = 0;
							regData_c = 2'b10;
							regWrite_c = 1;
							
						end
					//c.lw			
					2'b00: 
						begin
							memRd_c = 1;
							memWr_c = 0;
							regData_c = 2'b01;
							regWrite_c = 1;
							
						end		
				  default: begin
				            memRd_c = 0;
							memWr_c = 0;
							regData_c = 2'b00;
							regWrite_c = 0;
							end
			endcase
		end
endmodule

module mux2to1_32bits(input [31:0] muxIn1, input [31:0] muxIn2, input Sel, output reg [31:0] muxOut);
	always@(muxIn1 or muxIn2 or Sel)
		begin
			case(Sel)
				1'b0 : muxOut = muxIn1;
				1'b1 : muxOut = muxIn2;
			endcase
		end
endmodule

module mux2to1_5bits(input [4:0] muxIn1, input [4:0] muxIn2, input Sel, output reg [4:0] muxOut);
	always@(muxIn1 or muxIn2 or Sel)
		begin
			case(Sel)
				1'b0 : muxOut = muxIn1;
				1'b1 : muxOut = muxIn2;
			endcase
		end
endmodule


module mux2to1_6bits(input [5:0] muxIn1, input [5:0] muxIn2, input Sel, output reg [5:0] muxOut);
	always@(muxIn1 or muxIn2 or Sel)
		begin
			case(Sel)
				1'b0 : muxOut = muxIn1;
				1'b1 : muxOut = muxIn2;
			endcase
		end
endmodule


module zeroext5to32(input [4:0] in, output reg [31:0] out);
	always@(in)
		begin
			out = {27'b0,in};
			
		end
endmodule

module zeroext22to32(input [21:0] in, output reg [31:0] out);
	always@(in)
		begin
			out = {10'b0,in};
			
		end
endmodule

module signext6to32(input [5:0] in, output reg [31:0] out);
	always@(in)
		begin
			//out = {27'b0,in};
			//TODO check in debugging
			//out = $signed(in);
			out = {{26{in[5]}},in};
		end
endmodule

module zeroext3to5(input [2:0] in, output reg [4:0] out);
	always@(in)
		begin
			out = {2'b0,in};
			 
		end
endmodule

module signext12to32(input [11:0] in, output reg [31:0] out);
	always@(in)
		begin
			//out={20{in[11]},in};
			//TODO check in debugging
			//out = $signed(in);
			out = {{20{in[11]}},in};
		end
endmodule
// TODO check if wire rd actually goes into id module in instantiation

module id_pipeline(input clk, input reset, input [31:0] pcplus4_if_id, input [31:0]instruction, input [15:0] instruction_c,
						 input [4:0] rd,
						 input [4:0] rd_c, input [31:0] regWrData, input [31:0] regWrData_c,
						 output [1:0] alusrcB, output [1:0] aluOp, output memRd, output memWr, output regWr,
						 output memRd_c, output memWr_c, output [1:0] regData_c, output regWr_c,
						 output [31:0] reg_rs_id_ex, output [31:0] reg_rt_id_ex, output [31:0] reg_rs_c_id_ex,
						 output [31:0] reg_rt_c_id_ex,
						 output [31:0] zeroext22to32_cl, output [31:0] zeroext5to32_id_ex, output reg [31:0] signext5to32_id_ex,
						 output [31:0] signext12to32_id_ex, output reg [4:0] rd_id_ex, output reg [4:0] rd_c_id_ex,
						 output branch, output jumpR, output reg [31:0] pcplus4_id_ex, output [31:0] signext12to32_sh,
						 output [4:0] rd_c_zeroext3to5_id_ex, output  reg mux2to1_5bits_signal_id_ex, 
						 output [31:0] signext6to32_c_li,output regData_id_ex, output [31:0]signext12to32_bge,
						 output reg greaterThanEqual);
						 
		

			//wire regData;
			//wire [31:0] mux2to1Out;
			wire [4:0] rs_c_zeroext3to5_id_ex;
			
			/*ctrlckt(input [6:0] opcode, input [2:0] fun3,output reg [1:0]alusrcB, output reg [1:0]aluOp, output reg memRd,
 output reg memWr, output reg regData,output reg branch, output reg regWrite, output reg jumpR);*/
			ctrlckt ctrrlckt1(instruction[6:0], instruction[14:12], alusrcB, aluOp, memRd, memWr, regData_id_ex,
									branch, regWr, jumpR);	
			/*ctrlckt_c(input [1:0] opcode_c, output reg memRd_c,  output reg memWr_c, output reg [1:0] regData_c, 
output reg regWrite_c);*/
						
			ctrlckt_c ctrlckt_c1(instruction_c[1:0], memRd_c, memWr_c, regData_c, regWr_c);
			
			//or(mux2to1_5bits_signal_id_ex, instruction_c[1], instruction_c[0]);
			always@(instruction_c)
			begin
				mux2to1_5bits_signal_id_ex = instruction_c[1] | instruction_c[0];
			end
			//wire [4:0] rd_c_in_muxout; wire [4:0] rs_c_in_muxout;
			//wire [4:0] rd_c_zeroext;
			
			//for c.l
			zeroext3to5 zeroext3to5_rd_c(instruction_c[4:2],rd_c_zeroext3to5_id_ex);
			zeroext3to5 zeroext3to5_rs_c(instruction_c[9:7],rs_c_zeroext3to5_id_ex);
			 
			//mux2to1_5bits mux2to1_5bits_rs_c_in(rs_c_zeroext,instruction_c[6:2] , mux2to1_5bits_signal,rs_c_in_muxout );
			//mux2to1_5bits mux2to1_5bits_rd_c_in(rd_c_zeroext,instruction_c[11:7] , mux2to1_5bits_signal,rd_c_in_muxout );
		
		/*registerFile(input clk, input reset, input regWrite, input regWrite_c, input [4:0] rs, input [4:0] rt,
		input [4:0] rd, input [4:0] rs_c, input [4:0] rt_c, input [4:0] rd_c, input [31:0] writeData, input [31:0] writeData_c,
		output [31:0] rsOut, output [31:0] rtOut,output [31:0] rsOut_c, output [31:0] rtOut_c);*/
		
		registerFile registerFile1(clk, reset,regWr, regWr_c, instruction[19:15] , instruction[24:20],
		rd, rs_c_zeroext3to5_id_ex, /*instruction_c[11:7]*/instruction_c[6:2], rd_c, regWrData,
		regWrData_c, reg_rs_id_ex, reg_rt_id_ex , reg_rs_c_id_ex, reg_rt_c_id_ex);
		
		//24:20 shamt
		zeroext5to32 zeroext5to32_1(instruction[24:20], zeroext5to32_id_ex);
		
		//jalr and andi
		signext12to32 signext12to32_1(instruction[31:20], signext12to32_id_ex);
		//bge
		signext12to32 signext12to32_2({instruction[31],instruction[7],instruction[30:25],instruction[11:8]}, signext12to32_bge);
		//sh
		signext12to32 signext12to32_3({instruction[31:25],instruction[11:7]}, signext12to32_sh);
		//c.li
		signext6to32 signext6to32_4({instruction_c[12],instruction_c[6:2]},signext6to32_c_li);
		//c.l
		zeroext22to32 zeroext22to32_1({15'b0,instruction_c[5],instruction_c[12:10],instruction_c[6],2'b0},zeroext22to32_cl);
		
		//reg_rs_id_ex, reg_rt_id_ex
		
		//wire greaterThanEqual;
		
		always@(pcplus4_if_id, instruction, instruction_c)
		if(reg_rs_id_ex >= reg_rt_id_ex)
			greaterThanEqual=1;
		else
			greaterThanEqual=0;
		always@(pcplus4_if_id, instruction, instruction_c)
		begin
			pcplus4_id_ex = pcplus4_if_id;	
			//output [4:0] rd_id_ex, output [4:0] rd_c_id_ex
			rd_id_ex = instruction[11:7];
			rd_c_id_ex = instruction_c[11:7];
		end
		
		
				

	
endmodule
/////////////////////////////////////end of id_pipeline///////////////////////////////////

/////////////////////////////////////ex_pipeline//////////////////////////////////////////


module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [1:0] aluOp, output reg [31:0] aluOut);
	always@(aluIn1 or aluIn2 or aluOp)
		begin
			case(aluOp)
				//addition
				2'b00: aluOut = aluIn1 + aluIn2;
				//anding
				2'b01: aluOut = aluIn1 & aluIn2;
				//shift right arithmetic
				2'b10: aluOut = aluIn1 >>> aluIn2;
				
			endcase
		end
endmodule


module alu_c(input [31:0] aluIn1, input [31:0] aluIn2, output reg [31:0] aluOut);
	always@(aluIn1 or aluIn2)
		begin
			aluOut = aluIn1 + aluIn2;
		end
endmodule

module mux4to1_32bit(input [31:0] in1, input [31:0] in2, input [31:0] in3, input [1:0] sel,
	output reg [31:0] muxOut);
	always@(in1,in2,in3,sel)
		begin
			case(sel)
				2'b00: muxOut = in1;
				2'b01: muxOut = in2;
				2'b10: muxOut = in3;
				2'b11: muxOut = 32'b0;
			endcase
		end	
endmodule


module ex_pipeline(input clk, input reset,input  [1:0] alusrcB,input  [1:0] aluOp,input  memRd,input  memWr,input  regData,
		input  branch,input regWrite,input  jumpR,input  memRd_c, input  memWr_c,
		input  [1:0] regData_c,	input  regWrite_c, input  [31:0] reg_rs, input  [31:0] reg_rt,
		input  [31:0] reg_rs_c,input  [4:0] rd, input  [4:0] rd_c, 
		input  [31:0] reg_rt_c, input  [31:0] zeroext22to32_cl,input  [31:0] zeroext5to32_srai, input  [31:0]signext5to32,
		input  [31:0] signext12to32_andi_jalr,
		input  [31:0] pcplus4, input  [31:0] signext6to32_cli_id_ex, input[4:0] rd_c_signext3to5_id_ex,
		input mux2to1_5bits_signal_id_ex,input regData_id_ex,
		output reg [31:0] signext6to32_cli_ex_mem,output [4:0] rd_c_ex_mem,
		output reg [4:0] rd_ex_mem, output reg memRd_ex_mem, 
		output reg memWr_ex_mem, output reg regData_ex_mem,output reg branch_ex_mem,output reg regWrite_ex_mem,
		output reg jumpR_ex_mem,output reg memRd_c_ex_mem, output reg memWr_c_ex_mem,
		output reg [1:0] regData_c_ex_mem, output reg regWrite_c_ex_mem, output [31:0] aluOut_ex_mem,
		output [31:0] aluOut_c_ex_mem, output reg [31:0] pcplus4_ex_mem,output reg [31:0] reg_rt_c_ex_mem,
		output reg [31:0] reg_rt_ex_mem);
/*ctrlckt(input [6:0] opcode, input [2:0] fun3,output reg [1:0]alusrcB, output reg [1:0]aluOp, output reg memRd,
 output reg memWr, output reg regData,output reg branch, output reg regWrite, output reg jumpR);*/
 /*ctrlckt_c(input [1:0] opcode_c, output reg memRd_c,  output reg memWr_c, output reg [1:0] regData_c, 
output reg regWrite_c);*/
	//aluIn2
	wire [31:0] aluIn2;
	//calling alusrcB mux
	mux4to1_32bit mux4to1_32bit_alusrcB(reg_rt,zeroext5to32_srai,signext12to32_andi_jalr,alusrcB, aluIn2);
	//calling main alu
	alu alu1(reg_rs,aluIn2,aluOp,aluOut_ex_mem);
	//calling main alu_c
	alu_c alu_c1(reg_rs_c,zeroext22to32_cl,aluOut_c_ex_mem);
	
	//mux2to1_5bits mux2to1_5bits_rd_c_in(rd_c_zeroext,instruction_c[11:7] , mux2to1_5bits_signal,rd_c_in_muxout );
	//input[4:0] rs_c_zeroext3to5_id_ex, input mux2to1_5bits_signal_id_ex
	mux2to1_5bits mux2to1_5bit_rd(rd_c_signext3to5_id_ex, rd_c, mux2to1_5bits_signal_id_ex,rd_c_ex_mem );

	//Propogating parameters remaining same across the pipeline
	//TODO replace * with sensitivity list
	
	/*module ex_pipeline(input  [1:0] alusrcB,input  [1:0] aluOp,input  memRd,input  memWr,input  regData,
		input  branch,input regWrite,input  jumpR,input  memRd_c, input  memWr_c,
		input  [1:0] regData_c,	input  regWrite_c, input  [31:0] reg_rs, input  [31:0] reg_rt,
		input  [31:0] reg_rs_c,input  [4:0] rd, input  [4:0] rd_c, 
		input  [31:0] reg_rt_c, input  [31:0] zeroext22to32_cl,input  [31:0] zeroext5to32_srai, input  [31:0]signext5to32,
		input  [31:0] signext12to32_andi_jalr,
		input  [5:0] pcplus4, input  [31:0] signext6to32_cli_id_ex, input[4:0] rd_c_signext3to5_id_ex,
		input mux2to1_5bits_signal_id_ex,input regData_id_ex,
		output reg [31:0] signext6to32_cli_ex_mem,output reg [4:0] rd_c_ex_mem,
		output reg [4:0] rd_ex_mem, output reg memRd_ex_mem, 
		output reg memWr_ex_mem, output reg regData_ex_mem,output reg branch_ex_mem,output reg regWrite_ex_mem,
		output reg jumpR_ex_mem,output reg memRd_c_ex_mem, output reg memWr_c_ex_mem,
		output reg [1:0] regData_c_ex_mem, output reg regWrite_c_ex_mem, output reg [31:0] aluOut_ex_mem,
		output reg [31:0] aluOut_c_ex_mem, output reg [5:0] pcplus4_ex_mem,output reg [31:0] reg_rt_c_ex_mem
		);*/
	
	always@(clk,reset,memWr,memRd,memRd_c,memWr_c,branch,jumpR,pcplus4,regWrite,regWrite_c,rd,reg_rt_c,signext6to32_cli_id_ex,
			regData,regData_c,reg_rt)
		begin
			memRd_ex_mem = memRd;
			memWr_ex_mem = memWr;
			memRd_c_ex_mem = memRd_c;
			memWr_c_ex_mem = memWr_c;
			branch_ex_mem = branch;
			jumpR_ex_mem = jumpR;
			pcplus4_ex_mem = pcplus4;
			regWrite_ex_mem = regWrite;
			regWrite_c_ex_mem = regWrite_c;
			rd_ex_mem = rd;
			//rd_c_ex_mem = rd_c;
			reg_rt_c_ex_mem = reg_rt_c;
			signext6to32_cli_ex_mem = signext6to32_cli_id_ex;
			regData_ex_mem = regData;
			regData_c_ex_mem = regData_c;
			reg_rt_ex_mem = reg_rt;
			//regDataOut_id_ex = regDataOut_ex_mem;
			//regDataOut_c_id_ex = regDataOut_c_ex_mem;
			//wire_rd_id_ex = wire_rd_ex_mem;
			//wire_rd_c_id_ex = wire_rd_c_ex_mem;
		end
	
	
	
	
	

endmodule


/////////////////////////////////////end of ex_pipeline///////////////////////////////////


/////////////////////////////////////mem_pipeline///////////////////////////////////

module mem_pipeline(input clk, input reset,input regWrite, input regWrite_c,input  memRd,input  memWr, input  memRd_c,
						  input  memWr_c, 
						  input  [1:0] regData_c, input  [4:0] rd, input  [4:0] rd_c, input [31:0] signext6to32_cli_ex_mem,
						  input  [31:0] reg_rt_c,input [31:0] aluOut_ex_mem, input [31:0] aluOut_c_ex_mem, 
						  input [31:0] pcplus4_ex_mem, input regData_ex_mem,
						  output reg regWrite_mem_id,output reg regWrite_c_mem_id,input [31:0] reg_rt_ex_mem,
						  output reg [31:0] pcplus4_mem_if,
						  output reg [31:0] aluOut_c_mem_id, output reg [31:0] aluOut_mem_id, output [31:0] dmOut,
						  output reg [31:0] reg_rt_mem_mux, output reg [1:0] regData_c_mem_mux, output reg [4:0] rd_mem_mux,
						  output reg [4:0] rd_c_mem_mux, output reg [31:0] signext6to32_cli_mem_mux,
						  output reg [31:0] reg_rt_c_mem_mux, output reg regData_mem_mux);
			
			//TODO insert cache
			
			/*module DM(input clk, input reset,input MemRd, input MemRdComp, input MemWr, input MemWrComp, input[31:0] in, 
			input[31:0] addr, 
		input[31:0] addr_c, output reg [31:0] DM_out);*/
		
		//TODO memory to be made 16 bits from 32 bits
		DM dm1(clk, reset,memRd, memRd_c, memWr, memWr_c, {16'b0,reg_rt_ex_mem[15:0]}, aluOut_ex_mem, 
		aluOut_c_ex_mem, dmOut);
			
			//TODO remove * with sensitivity list			  
				always@( clk,  reset, regWrite,  regWrite_c,  memRd,  memWr,   memRd_c,
						    memWr_c, 
						    regData_c,   rd,  rd_c,  signext6to32_cli_ex_mem,
						     reg_rt_c, aluOut_ex_mem,  aluOut_c_ex_mem, 
						    pcplus4_ex_mem,  regData_ex_mem)
					begin
						reg_rt_c_mem_mux = reg_rt_c;
						rd_c_mem_mux = rd_c;
						rd_mem_mux = rd;
						signext6to32_cli_mem_mux = signext6to32_cli_ex_mem;
						aluOut_c_mem_id = aluOut_c_ex_mem;
						aluOut_mem_id = aluOut_ex_mem;
						pcplus4_mem_if = pcplus4_ex_mem;
						regWrite_c_mem_id = regWrite_c;
						regWrite_mem_id = regWrite;
						regData_c_mem_mux = regData_c;
						regData_mem_mux = regData_ex_mem;
					end
					
					
						  
endmodule

/////////////////////////////////////end of mem_pipeline///////////////////////////////////

module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] out1);
	always@(in1 or in2)
		begin
			out1 = in1 + in2;
		end
endmodule


module main(input clk, input reset,output [31:0] regWrData, output [31:0] regWrData_c, output [31:0] aluOut_ex_mem
				,output [31:0] aluOut_c_ex_mem);
		/*input clk, input reset, input [5:0] pcplus4_if_id, input [31:0]instruction, input [15:0] instruction_c,
						 input [4:0] rd,
						 input [4:0] rd_c, input [31:0] regWrData, input [31:0] regWrData_c*/
		//if_id pipeline
	//wire pcsrc;
	wire [31:0] pc;
	wire pcsrc;
	wire [31:0] branch_jumpR;
	//signext12to32_bge
	wire [31:0] signext12to32_bge; wire greaterThanEqual; 
	wire branch_jumpR_signal_mux; wire  branch_id_pc; wire jumpR_id_pc;
	or(pcsrc,branch_id_pc,jumpR_id_pc);
	and(branch_jumpR_signal_mux,greaterThanEqual,branch_id_pc);
	
	//wire [31:0] pcplus4_if_id;
	//wire [31:0] instruction;
	//wire [31:0]regWrData_if_id, regWrData_c_if_id;
		//wire [15:0] instruction_c;
		//wire [4:0] rd, rd_c;
		//wire [31:0] regWrData; wire [31:0] regWrData_c;
		
		 
		
		//_id_ex pipeline
		wire  [1:0] alusrcB_id_ex;wire  [1:0] aluOp_id_ex;wire  memRd_id_ex;wire  memWr_id_ex;
		wire regWrite_id_ex;wire  memRd_c_id_ex; wire  memWr_c_id_ex;
		wire  [1:0] regData_c_id_ex;	wire  regWrite_c_id_ex; wire  [31:0] reg_rs_id_ex; wire  [31:0] reg_rt_id_ex;
		wire  [31:0] reg_rs_c_id_ex;wire  [4:0] rd_id_ex; wire  [4:0] rd_c_id_ex; 
		wire  [31:0] reg_rt_c_id_ex; wire  [31:0] zeroext22to32_cl_id_ex;wire  [31:0] zeroext5to32_id_ex; wire  [31:0]signext5to32_id_ex;
		wire  [31:0] signext12to32_id_ex;
		wire  [31:0] pcplus4_id_ex; wire [31:0] regDataOut_ex_mem_id_ex; 
		wire  [31:0] sext5to32_c_id_ex;
		wire [31:0] signext6to32_cli_id_ex; wire [31:0] signext12to32_sh; wire [4:0] rd_c_zeroext3to5_id_ex;
		wire mux2to1_5bits_signal_id_ex;wire regData_id_ex;
		wire regData_ex_mem; wire [31:0] reg_rt_ex_mem;
		
		//_ex_mem pipeline
		wire [31:0] signext6to32_cli_ex_mem; wire [4:0] rd_c_ex_mem;
		wire [4:0] rd_ex_mem;  wire memRd_ex_mem; 
		wire memWr_ex_mem; wire branch_ex_mem; wire regWrite_ex_mem;
		wire jumpR_ex_mem; wire memRd_c_ex_mem;  wire memWr_c_ex_mem;
		wire [1:0] regData_c_ex_mem;  wire regWrite_c_ex_mem;  //wire [31:0] aluOut_ex_mem;
		//wire [31:0] aluOut_c_ex_mem;  
		wire [31:0] pcplus4_ex_mem; wire [31:0] reg_rt_c_ex_mem; wire [31:0]  regDataOut_ex_mem;
		//wire signext6to32_cli_id_ex
		wire [4:0] rd_c_signext3to5_id_ex; wire [31:0] pcplus4_mem_id;
		
		//_mem_wb pipeline
		wire regData_mem_mux;
		  wire regWrite_mem_id; wire regWrite_c_mem_id;
						  wire [31:0] pcplus4_mem_if;
						   wire [31:0] aluOut_c_mem_id;  wire [31:0] aluOut_mem_id;  wire [31:0] dmOut;
						   wire [31:0] reg_rt_mem_mux; wire [1:0] regData_c_mem_mux;  wire [4:0] rd_mem_mux;
						   wire [4:0] rd_c_mem_mux;  wire [31:0] signext6to32_cli_mem_mux; wire [31:0] reg_rt_c_mem_mux;
	
	
	
	
	mux2to1_32bits mux2to1_32bits_jumpbranch(aluOut_mem_id,signext12to32_bge , branch_jumpR_signal_mux,
	branch_jumpR);
	
	wire [31:0] pc_adder_out;wire [31:0] pc_in;// wire [5:0] pc_pcmuxout;
	//mux2to1_32bits mux2to1_32bits_pc_sel(clk,);
	//mux2to1_32bits({26'b0,pc_adder_out}, branch_jumpR, pcsrc, pc_in_32bits);
	//reg [5:0] pc1; //assign pc1 = pc;
	mux2to1_32bits mux2to1_32bits_pc(pc_adder_out, branch_jumpR, pcsrc, pc_in);
	//pc = pc_in_32bits[5:0];
	/*register32bit( input clk, input reset, input regWrite, input decOut, input regWrite_c, input decOut_c,
	input [31:0] writeData, input [31:0]
	writeData_c, output  [31:0] outR );*/
	register32bit register32bit_pc(clk, reset, 1'b1, 1'b1,1'b0,1'b0, pc_in,32'b0, pc);

	adder adder_pc(pc,32'd4,pc_adder_out);
	
	wire [63:0] IR;
	//TODO pc might be 5bits not 6
	IM im1(clk, reset, pc[5:0], IR);
	
	
		//wire [5:0] pc;
		/*input clk, input reset, input [5:0] pcplus4_if_id, input [31:0]instruction, input [15:0] instruction_c,
						 input [4:0] rd,
						 input [4:0] rd_c, input [31:0] regWrData, input [31:0] regWrData_c,
						 output reg [1:0] alusrcB, output reg [1:0] aluOp, output reg memRd, output reg memWr, output reg regWr,
						 output reg memRd_c, output reg memWr_c, output reg [1:0] regData_c, output reg regWr_c,
						 output reg [31:0] reg_rs_id_ex, output reg [31:0] reg_rt_id_ex, output reg [31:0] reg_rs_c_id_ex,
						 output reg [31:0] reg_rt_c_id_ex,
						 output reg [31:0] zeroext22to32_cl, output reg [31:0] zeroext5to32_id_ex, output reg [31:0] signext5to32_id_ex,
						 output reg [31:0] signext12to32_id_ex, output reg [4:0] rd_id_ex, output reg [4:0] rd_c_id_ex,
						 output reg branch, output reg jumpR, output reg [5:0] pcplus4_id_ex, output reg [31:0] signext12to32_sh*/
			
		/*
		module id_pipeline(input clk, input reset, input [5:0] pcplus4_if_id, input [31:0]instruction, input [15:0] instruction_c,
						 input [4:0] rd,
						 input [4:0] rd_c, input [31:0] regWrData, input [31:0] regWrData_c,
						 output reg [1:0] alusrcB, output reg [1:0] aluOp, output reg memRd, output reg memWr, output reg regWr,
						 output reg memRd_c, output reg memWr_c, output reg [1:0] regData_c, output reg regWr_c,
						 output reg [31:0] reg_rs_id_ex, output reg [31:0] reg_rt_id_ex, output reg [31:0] reg_rs_c_id_ex,
						 output reg [31:0] reg_rt_c_id_ex,
						 output reg [31:0] zeroext22to32_cl, output reg [31:0] zeroext5to32_id_ex, output reg [31:0] signext5to32_id_ex,
						 output reg [31:0] signext12to32_id_ex, output reg [4:0] rd_id_ex, output reg [4:0] rd_c_id_ex,
						 output branch, output jumpR, output reg [5:0] pcplus4_id_ex, output reg [31:0] signext12to32_sh,
						 output reg [4:0] rd_c_zeroext3to5_id_ex, output  reg mux2to1_5bits_signal_id_ex, 
						 output reg [31:0] signext6to32_c_li,output reg regData_id_ex, output signext12to32_bge,
						 output greaterThanEqual);
		*/
		id_pipeline id_pipeline1(clk, reset, pc_adder_out, IR[63:32], IR[15:0],
						  rd_mem_mux,
						  rd_c_mem_mux,  regWrData, regWrData_c,
						 alusrcB_id_ex, aluOp_id_ex, memRd_id_ex, memWr_id_ex, regWrite_id_ex,
						 memRd_c_id_ex, memWr_c_id_ex, regData_c_id_ex, regWrite_c_id_ex,
						 reg_rs_id_ex, reg_rt_id_ex, reg_rs_c_id_ex,
						 reg_rt_c_id_ex,
						 zeroext22to32_cl_id_ex, zeroext5to32_id_ex, signext5to32_id_ex,
						 signext12to32_id_ex, rd_id_ex, rd_c_id_ex,
						 branch_id_pc, jumpR_id_pc, pcplus4_id_ex, signext12to32_sh, rd_c_zeroext3to5_id_ex,
						 mux2to1_5bits_signal_id_ex,
						 signext6to32_cli_id_ex,regData_id_ex , signext12to32_bge, 
						 greaterThanEqual);	
		
		//reg [31:0] wire_rd_ex_mem, reg [31:0] wire_rd_c_ex_mem,
		
		 
		/*ex_pipeline(input clk, input reset,input  [1:0] alusrcB,input  [1:0] aluOp,input  memRd,input  memWr,input  regData,
		input  branch,input regWrite,input  jumpR,input  memRd_c, input  memWr_c,
		input  [1:0] regData_c,	input  regWrite_c, input  [31:0] reg_rs, input  [31:0] reg_rt,
		input  [31:0] reg_rs_c,input  [4:0] rd, input  [4:0] rd_c, 
		input  [31:0] reg_rt_c, input  [31:0] zeroext22to32_cl,input  [31:0] zeroext5to32_srai, input  [31:0]signext5to32,
		input  [31:0] signext12to32_andi_jalr,
		input  [5:0] pcplus4, input  [31:0] signext6to32_cli_id_ex, input[4:0] rd_c_signext3to5_id_ex,
		input mux2to1_5bits_signal_id_ex,input regData_id_ex,
		output reg [31:0] signext6to32_cli_ex_mem,output reg [4:0] rd_c_ex_mem,
		output reg [4:0] rd_ex_mem, output reg memRd_ex_mem, 
		output reg memWr_ex_mem, output reg regData_ex_mem,output reg branch_ex_mem,output reg regWrite_ex_mem,
		output reg jumpR_ex_mem,output reg memRd_c_ex_mem, output reg memWr_c_ex_mem,
		output reg [1:0] regData_c_ex_mem, output reg regWrite_c_ex_mem, output reg [31:0] aluOut_ex_mem,
		output reg [31:0] aluOut_c_ex_mem, output reg [5:0] pcplus4_ex_mem,output reg [31:0] reg_rt_c_ex_mem
		output reg [31:0] reg_rt_ex_mem);*/
		
		
		ex_pipeline ex_pipeline1(clk,reset,alusrcB_id_ex, aluOp_id_ex, memRd_id_ex, memWr_id_ex,regData_id_ex,
		branch_id_ex, regWrite_id_ex,jumpR_id_ex, memRd_c_id_ex, memWr_c_id_ex,
		regData_c_id_ex,	regWrite_c_id_ex, reg_rs_id_ex, reg_rt_id_ex,
		reg_rs_c_id_ex, rd_id_ex, rd_c_id_ex, 
		reg_rt_c_id_ex, zeroext22to32_cl_id_ex, zeroext5to32_id_ex, signext5to32_id_ex,
		signext12to32_id_ex,
		pcplus4_id_ex, signext6to32_cli_id_ex, rd_c_signext3to5_id_ex,
		mux2to1_5bits_signal_id_ex, regData_id_ex,
		signext6to32_cli_ex_mem,rd_c_ex_mem,
		rd_ex_mem, memRd_ex_mem, 
		memWr_ex_mem, regData_ex_mem, branch_ex_mem, regWrite_ex_mem,
		jumpR_ex_mem,memRd_c_ex_mem, memWr_c_ex_mem,
		regData_c_ex_mem, regWrite_c_ex_mem ,aluOut_ex_mem,
		aluOut_c_ex_mem, pcplus4_ex_mem, 
		reg_rt_c_ex_mem, reg_rt_ex_mem);
				
		
		/*mem_pipeline(input clk, input reset,input regWrite, input regWrite_c,input  memRd,input  memWr, input  memRd_c, 
							input  memWr_c, 
						  input  [1:0] regData_c, input  [4:0] rd, input  [4:0] rd_c, input [31:0] signext6to32_cli_ex_mem,
						  input  [31:0] reg_rt_c,input [31:0] aluOut_ex_mem, input [31:0] aluOut_c_ex_mem, 
						  input [5:0] pcplus4_ex_mem, input regData_ex_mem,
						  output reg regWrite_mem_id,output reg regWrite_c_mem_id,input [31:0] reg_rt_ex_mem,
						  output reg [5:0] pcplus4_mem_if,
						  output reg [31:0] aluOut_c_mem_id, output reg [31:0] aluOut_mem_id, output reg [31:0] dmOut,
						  output reg [31:0] reg_rt_mem_mux, output reg [1:0] regData_c_mem_mux, output reg [4:0] rd_mem_mux,
						  output reg [4:0] rd_c_mem_mux, output reg [31:0] signext6to32_cli_mem_mux,
						  output reg [31:0] reg_rt_c_mem_mux, output reg regData_mem_mux);*/
		
		
		
		 mem_pipeline mem_pipeline1(clk,reset,regWrite_ex_mem, regWrite_c_ex_mem , memRd_ex_mem, memWr_ex_mem, memRd_c_ex_mem,
						  memWr_c_ex_mem, 
						  regData_c_ex_mem, rd_ex_mem, rd_c_ex_mem, signext6to32_cli_ex_mem,
						  reg_rt_c_ex_mem, aluOut_ex_mem, aluOut_c_ex_mem, 
						  pcplus4_ex_mem, regData_ex_mem,
						  regWrite_mem_id, regWrite_c_mem_id, reg_rt_ex_mem,
						  pcplus4_mem_id,
						  aluOut_c_mem_id, aluOut_mem_id, dmOut,
						  reg_rt_mem_mux, regData_c_mem_mux, rd_mem_mux,
						  rd_c_mem_mux, signext6to32_cli_mem_mux,
						  reg_rt_c_mem_mux, regData_mem_mux);
		

						 
	//mux2to1_32bits(input [31:0] muxIn1, input [31:0] muxIn2, input Sel, output reg [31:0] muxOut);
	//wire [31:0] regData_muxout;
	mux2to1_32bits mux2to1_32bits_regDatasel(aluOut_mem_id, pcplus4_mem_if, regData_mem_mux, regWrData );
	
	//wire [31:0] regWrData; wire [31:0] regWrData_c
	
	//wire [31:0] regData_c_muxout;
	/*module mux4to1_32bit(input [31:0] in1, input [31:0] in2, input [31:0] in3, input [1:0] sel,
	output reg [31:0] muxOut);*/
	// regWrData, regWrData_c,
	 mux4to1_32bit mux4to1_32bits_postmem(reg_rt_c_mem_mux, dmOut, signext6to32_cli_mem_mux, regData_c_mem_mux,
	regWrData_c);
	
	
	
endmodule
 

module testbench;
	reg clk;
	reg reset;
	wire [31:0] regWrData; wire [31:0] regWrData_c;wire [31:0] aluOut_ex_mem;wire [31:0] aluOut_c_ex_mem;
	//main M(clk,reset,PC,pcsrc);
	//singleCycle uut (.clk(clk), .reset(reset), .Result(Result));
	main M(.clk(clk),.reset(reset),.regWrData(regWrData),.regWrData_c(regWrData_c),.aluOut_ex_mem(aluOut_ex_mem),
			 .aluOut_c_ex_mem(aluOut_c_ex_mem));
	
	always
		#5 clk=~clk; 
		
	initial
		begin
			clk=0;reset=1;
			#15 reset=0;
			#100 $finish;
		end
endmodule
