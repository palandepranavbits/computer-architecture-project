module D_ff_DM(input clk, input reset, input MemWr, input MemWrComp, input start, input in, input D_Out);
	
	always@(negedge clk)
		begin
		if(reset==1)
			D_out=start;
		else
			if(MemWr==1||MemWrComp==1)
				D_out=in;
		end
endmodule


module Register_DM(input clk, input reset, input MemWr, input MemWrComp, input[31:0] start, input[31:0] in, output[31:0] RegOut);

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




module Mux16to1(input[31:0] Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09 Out10, Out11, Out12, Out13, Out14, Out15, input[3:0] Sel, input MemRd, output[31:0] MuxOut);
	always@(Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09 Out10, Out11, Out12, Out13, Out14, Out15, Sel, MemRd)
		begin
			if(MemRd==1)
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

module Decoder4to16(input[3:0]in, output[15:0]decOut);

always@(in)
begin
	case(in):
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


module DM(input clk, input reset, input MemWr, input MemWrComp, input[31:0] in, input[31:0] addr, input[31:0] addr_c, output[31:0] DM_out);

	wire[31:0] Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09 Out10, Out11, Out12, Out13, Out14, Out15;
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
	
	Mux16to1 Mux1(Out00, Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09 Out10, Out11, Out12, Out13, Out14, Out15, addr[5:2], MemRd|MemRdComp, DM_out);
	
endmodule


