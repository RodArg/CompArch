module mips(clk);
	
	input clk,
	input wire 	[31:0] 	instruction;
	wire				zf, regwrite, regdst;
	wire 		[5:0] 	opcode;
	wire		[4:0]	rs;
	wire		[4:0]	rt;
	wire		[4:0]	rd;
	wire		[4:0]	shamt;
	wire		[5:0]	funct;
	wire		[15:0]	add_imm;
	wire		[25:0]	tgt_add;
	
	reg 	[7:0][7:0]	registers;
	integer memory [99:0];
	
	//Might n
	
	integer instr [9:0];
	integer out;
	//Name			Fields											Comments
	//Field size	6bits	5bits	5bits	5bits	5bits	6bits	All MIPS-L instructions 16bts
	//R-format 		op		rs		rt		rd		shamt	funct	Arithmetic instruction format
	//I-format		op		rs		rt		{      Addr/Imm		}	Transfer, branch, immediate format
	//J-format		op		{          target address			}	Jump instruction format
	parameter
		//R-type
		add 	= 6'b100000,
		andd	= 6'b100100,
		orr		= 6'b100101,	
		sub		= 6'b100010,
		//I-type
		addi	= 6'b001000,
		andi	= 6'b001100,
		beq		= 6'b000100,
		bne		= 6'b000101,
		ori		= 6'b001101,
		lw		= 6'b100011,
		sw		= 6'b101011,
		//J-type
		j		= 6'b000010;
	initial begin	
		//R0 is hardcoded to 0 always
		registers[0] = 8'b00000000;
		opcode 	= instruction[31:26];
		rs 		= instruction[25:21];
		rt		= instruction[20:16];
		rd		= instruction[15:11];
		shamt	= instruction[10:6];
		funct	= instruction[5:0];
		
		add_imm = instruction[15:0];
		tgt_add = instruction[25:0];
		end
	always @(posedge clk) begin
		case(opcode)
			//I-type
			add: 	begin
				//addition functionality
				//rd 		= rs + rt
				//zflag 	= rd == R0[0]
				//regwrite 	= 
				//regdst 	= 
				//etc.
				end
			andd: 	begin
				
				end
			orr: 	begin
				end
			sub: 	begin
				end
			//R-type
			addi: 	begin
				end
			beq:	begin
				end
			bne:	begin
				end
			ori:	begin
				end
			lw:		begin
				end
			sw:		begin
				end
			//J-type
			j:		begin
				end
endmodule
		