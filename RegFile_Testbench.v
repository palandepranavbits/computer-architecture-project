module testbench;

	reg clk, reset, regWrite, regWrite_c;
	reg [3:0] rs, rt, rd, rs_c, rt_c, rd_c;
	reg [31:0] writeData;, writeData_c;
	wire [31:0] rsOut, rtOut, rsOut_c, rtOut_c;
	
	registerFile regFile(clk,reset,regWrite,regWrite_c,rs,rt,rd,rs_c,rt_c,rd_c,writeData,writeData_c,rsOut,rtOut,rsOut_c,rtOut_c);
	
	always
		#5 clk=~clk;
	initial
		begin
			clk=0; reset=1; regWrite=1; regWrite_c=0; rs=4'd15; rt=4'd14; rd=4'd15; rs_c=4'd12; rt_c=4'd8; rd_c=4'd7; writeData=32'hAC0AC0AC; writeData_c=32'hABABDEDE;
			#5 reset=0;
			#10 regWrite=1; regWrite_c=0; rs=4'd15; rt=4'd14; rd=4'd13; rs_c=4'd12; rt_c=4'd7; rd_c=4'd4; writeData=32'hAC0AC0AC; writeData_c=32'h12345678;
			#10 regWrite=0; regWrite_c=1; rs=4'd13; rt=4'd12; rd=4'd11; rs_c=4'd11; rt_c=4'd6; rd_c=4'd9; writeData=32'hAB0AB0AB; writeData_c=32'h87654321;
			#10 regWrite=0; regWrite_c=0; rs=4'd10; rt=4'd12; rd=4'd16; rs_c=4'd10; rt_c=4'd8; rd_c=4'd8; writeData=32'hAC5AC5AC; writeData_c=32'hABCABCAB;
			#10 regWrite=1; regWrite_c=1; rs=4'd04; rt=4'd05; rd=4'd06; rs_c=4'd13; rt_c=4'd5; rd_c=4'd7; writeData=32'hAC8AC8AC; writeData_c=32'hDEFDEFDE;
			#10 regWrite=1; regWrite_c=0; rs=4'd13; rt=4'd14; rd=4'd15; rs_c=4'd14; rt_c=4'd4; rd_c=4'd6; writeData=32'hEC0EC0EC; writeData_c=32'hF0F0F0F0;
			#10 regWrite=1; regWrite_c=1; rs=4'd15; rt=4'd14; rd=4'd15; rs_c=4'd15; rt_c=4'd3; rd_c=4'd8; writeData=32'hAB0AB0AB; writeData_c=32'hABABDEDE;
			#10 regWrite=1; regWrite_c=1; rs=4'd10; rt=4'd08; rd=4'd07; rs_c=4'd12; rt_c=4'd2; rd_c=4'd7; writeData=32'h11111111; writeData_c=32'hDEDEABAB;
			#10 $finish;
		end
endmodule

//registerFile(input clk, input reset, input regWrite, input regWrite_c, input [4:0] rs, input [4:0] rt,
		//input [4:0] rd, input [4:0] rs_c, input [4:0] rt_c, input [4:0] rd_c, input [31:0] writeData, input [31:0] writeData_c,
//output [31:0] rsOut, output [31:0] rtOut,output [31:0] rsOut_c, output [31:0] rtOut_c);
