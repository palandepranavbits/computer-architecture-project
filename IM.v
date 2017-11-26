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

module IM(input clk, input reset, input[4:0] PC_Sel, output[63:0] IR);
	wire [15:0] Qout00, Qout01, Qout02, Qout03, Qout04, Qout05, Qout06, Qout07,
					Qout08, Qout09, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,
					Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23,
					Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31,
					Qout32, Qout33, Qout34, Qout35, Qout36, Qout37, Qout38, Qout39,
					Qout40, Qout41, Qout42, Qout43, Qout44, Qout45, Qout46, Qout47,
					Qout48, Qout49, Qout50, Qout51, Qout52, Qout53, Qout54, Qout55,
					Qout56, Qout57, Qout58, Qout59, Qout60, Qout61, Qout62, Qout63;
					
	register_IM reg00(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout00);
	register_IM reg01(clk, reset, 32'b0000_0000_0000_0000_010_0_00001_11110_01, Qout01); //C.LI $1 011110
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
	register_IM reg12(clk, reset, 32'b0100000_11100_00001_101_00100_0010011, Qout12); //srai $1 $4 11100
	register_IM reg13(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout13); 
	register_IM reg14(clk, reset, 32'b0000000_00011_00100_000_00010_0110011, Qout14); //add $2 $4 $3
	register_IM reg15(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout15);
	register_IM reg16(clk, reset, 32'b111111000000_0010_000_00011_1100111, Qout16); //jalr $3 $4 111111000000
	register_IM reg17(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout17);
	register_IM reg18(clk, reset, 32'b111000111000_00001_110_00110_0010011, Qout18); // andi $1 $6 111000111000
	register_IM reg19(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout19);
	register_IM reg20(clk, reset, 32'b1100110_00010_00101_001_01100_0100011, Qout20); // sh $5 $2 110011001100
	register_IM reg21(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout21);
	register_IM reg22(clk, reset, 32'b1_111100_00110_00010_101_0000_1_1100011, Qout22); // bge $2 $6 111111000000 
	register_IM reg23(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout23);
	register_IM reg24(clk, reset, 32'b0000_0000_0000_0000_0000_0000_0000_0000, Qout24);
	register_IM reg25(clk, reset, 32'h0000_0000, Qout25);
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
	register_IM reg62(clk, reset, 32'h0000_0000, Qout62);
	register_IM reg63(clk, reset, 32'h0000_0000, Qout63);
	
	mux32to1_IM IM_Mux(Qout00, Qout01, Qout02, Qout03, Qout04, Qout05, Qout06, Qout07,
					Qout08, Qout09, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,
					Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23,
					Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31,
					Qout32, Qout33, Qout34, Qout35, Qout36, Qout37, Qout38, Qout39,
					Qout40, Qout41, Qout42, Qout43, Qout44, Qout45, Qout46, Qout47,
					Qout48, Qout49, Qout50, Qout51, Qout52, Qout53, Qout54, Qout55,
					Qout56, Qout57, Qout58, Qout59, Qout60, Qout61, Qout62, Qout63, PC_Sel, IR);
					
endmodule
	
