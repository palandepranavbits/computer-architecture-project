module D_ff_DM(input clk, input reset, input MemRd, input MemWr, input MemRdComp, input MemWrComp, input start, input in, input D_Out);
	
	always@(negedge clk)
		begin
		if(reset==1)
			D_out=start;
		else
			if(MemWr==1||MemWrComp==1)
				D_out=in;
		end
endmodule


module Register_DM(input clk, input reset, input MemRd, input MemWr, input MemRdComp, input MemWrComp, input[31:0] start, input[31:0] in, output[31:0] RegOut);

	D_ff_DM D_00(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[0], in[0], RegOut[0]);
	D_ff_DM D_01(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[1], in[1], RegOut[1]);
	D_ff_DM D_02(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[2], in[2], RegOut[2]);
	D_ff_DM D_03(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[3], in[3], RegOut[3]);
	D_ff_DM D_04(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[4], in[4], RegOut[4]);
	D_ff_DM D_05(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[5], in[5], RegOut[5]);
	D_ff_DM D_06(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[6], in[6], RegOut[6]);
	D_ff_DM D_07(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[7], in[7], RegOut[7]);
	D_ff_DM D_08(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[8], in[8], RegOut[8]);
	D_ff_DM D_09(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[9], in[9], RegOut[9]);
	D_ff_DM D_10(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[10], in[10], RegOut[10]);
	D_ff_DM D_11(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[11], in[11], RegOut[11]);
	D_ff_DM D_12(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[12], in[12], RegOut[12]);
	D_ff_DM D_13(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[13], in[13], RegOut[13]);
	D_ff_DM D_14(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[14], in[14], RegOut[14]);
	D_ff_DM D_15(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[15], in[15], RegOut[15]);
	D_ff_DM D_16(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[16], in[16], RegOut[16]);
	D_ff_DM D_17(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[17], in[17], RegOut[17]);
	D_ff_DM D_18(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[18], in[18], RegOut[18]);
	D_ff_DM D_19(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[19], in[19], RegOut[19]);
	D_ff_DM D_20(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[20], in[20], RegOut[20]);
	D_ff_DM D_21(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[21], in[11], RegOut[21]);
	D_ff_DM D_22(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[22], in[22], RegOut[22]);
	D_ff_DM D_23(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[23], in[23], RegOut[23]);
	D_ff_DM D_24(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[24], in[24], RegOut[24]);
	D_ff_DM D_25(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[25], in[25], RegOut[25]);
	D_ff_DM D_26(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[26], in[26], RegOut[26]);
	D_ff_DM D_27(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[27], in[27], RegOut[27]);
	D_ff_DM D_28(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[28], in[28], RegOut[28]);
	D_ff_DM D_29(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[29], in[29], RegOut[29]);
	D_ff_DM D_30(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[30], in[30], RegOut[30]);
	D_ff_DM D_31(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, start[31], in[31], RegOut[31]);
	
endmodule




Mux16to1 (input[31:0] Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09 Out10, Out11, Out12, Out13, Out14, Out15, input[3:0] Sel, output[31:0] MuxOut);
	always@(Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09 Out10, Out11, Out12, Out13, Out14, Out15, Sel)
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

endmodule

module DM(input clk, input reset, input MemRd, input MemWr, input MemRdComp, input MemWrComp, input[31:0] in, input[31:0] addr, output[31:0] DM_out);

wire[31:0] Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09 Out10, Out11, Out12, Out13, Out14, Out15;

	Register_DM Reg00(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd12, in, Out00);
	Register_DM Reg01(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd32, in, Out01);
	Register_DM Reg02(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd4, in, Out02);
	Register_DM Reg03(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd5, in, Out03);
	Register_DM Reg04(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd45, in, Out04);
	Register_DM Reg05(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd12, in, Out05);
	Register_DM Reg06(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd42, in, Out06);
	Register_DM Reg07(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd13, in, Out07);
	Register_DM Reg08(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd34, in, Out08);
	Register_DM Reg09(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd9, in, Out09);
	Register_DM Reg10(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd23, in, Out10);
	Register_DM Reg11(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd76, in, Out11);
	Register_DM Reg12(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd17, in, Out12);
	Register_DM Reg13(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd13, in, Out13);
	Register_DM Reg14(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd33, in, Out14);
	Register_DM Reg15(clk, reset, MemRd, MemWr, MemRdComp, MemWrComp, 32'd21, in, Out15);
	
	Mux16to1 Mux1(Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09 Out10, Out11, Out12, Out13, Out14, Out15, addr[5:2], DM_out); //What should be used as select for this mux?
	
endmodule

//What is decout according to that code?
