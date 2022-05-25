LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE WORK.Natavio_May_22_2022_CPU_Components.all;

ENTITY Natavio_May_22_2022_CPU IS
	PORT (Natavio_May_22_2022_clk		: in STD_LOGIC;
			Natavio_May_22_2022_Result	: OUT std_logic_vector (63 DOWNTO 0));
END Natavio_May_22_2022_CPU;

ARCHITECTURE arch OF Natavio_May_22_2022_CPU IS
	SIGNAL Natavio_May_22_2022_OPCode, Natavio_May_22_2022_Funct	: std_logic_vector (5 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_RS, Natavio_May_22_2022_RT, Natavio_May_22_2022_RD, Natavio_May_22_2022_Shamt	: std_logic_vector (4 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_Imm	: std_logic_vector (15 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_JmpAddr, Natavio_May_22_2022_Inst, Natavio_May_22_2022_IR_Q	: std_logic_vector (31 DOWNTO 0);
	
	-- CPU Controller Control Signals
	SIGNAL Natavio_May_22_2022_ExtOp, Natavio_May_22_2022_RegWr, Natavio_May_22_2022_RegDst, Natavio_May_22_2022_ALUSrc,
			 Natavio_May_22_2022_MemWr, Natavio_May_22_2022_MemRd, Natavio_May_22_2022_MemToReg, Natavio_May_22_2022_Branch,
			 Natavio_May_22_2022_Jump	: std_logic;
	SIGNAL Natavio_May_22_2022_PCSrc	: std_logic;
	SIGNAL Natavio_May_22_2022_ALUCtrl	: std_logic_vector (3 DOWNTO 0);
	
	-- ALU Signals
	SIGNAL Natavio_May_22_2022_A, Natavio_May_22_2022_B, Natavio_May_22_2022_lower_res, Natavio_May_22_2022_upper_res,
			 Natavio_May_22_2022_BusB	: std_logic_vector (31 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_Overflow, Natavio_May_22_2022_Zero, Natavio_May_22_2022_Negative, Natavio_May_22_2022_Cout	: std_logic;
	
	-- MUX signals
	SIGNAL Natavio_May_22_2022_Rw	: std_logic_vector (4 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_BusW, Natavio_May_22_2022_NextAddr	: std_logic_vector (31 DOWNTO 0); 
	
	-- Data Memory signals
	SIGNAL Natavio_May_22_2022_Mem_Data	: std_logic_vector (31 DOWNTO 0);
	
	-- Instruction signals
	SIGNAL Natavio_May_22_2022_ImmExt, Natavio_May_22_2022_ImmExtShft, Natavio_May_22_2022_Adder1, Natavio_May_22_2022_Adder2, 
			 Natavio_May_22_2022_PC_O, Natavio_May_22_2022_CurrAdder, Natavio_May_22_2022_CurrAdderTmp : std_logic_vector (31 DOWNTO 0);
	
	BEGIN
		Natavio_May_22_2022_Program_Count	: Natavio_May_22_2022_PC PORT MAP (Natavio_May_22_2022_clk, Natavio_May_22_2022_CurrAdder,
																									  Natavio_May_22_2022_NextAddr);
																									  
		Natavio_May_22_2022_Inst_Mem	: Natavio_May_22_2022_Instruction_Memory PORT MAP (Natavio_May_22_2022_NextAddr, Natavio_May_22_2022_OPCode,
																													Natavio_May_22_2022_RS, Natavio_May_22_2022_RT,
																													Natavio_May_22_2022_RD, Natavio_May_22_2022_Shamt,
																													Natavio_May_22_2022_Funct, Natavio_May_22_2022_Imm,
																													Natavio_May_22_2022_JmpAddr, Natavio_May_22_2022_Inst);
																													
		Natavio_May_22_2022_InstReg	: Natavio_May_22_2022_IR PORT MAP (Natavio_May_22_2022_clk, '1', '1', '1', Natavio_May_22_2022_Inst,
																							  Natavio_May_22_2022_IR_Q);
																							  
		Natavio_May_22_2022_CPUC	: Natavio_May_22_2022_CPU_Controller PORT MAP (Natavio_May_22_2022_OPCode, Natavio_May_22_2022_Funct,
																										  Natavio_May_22_2022_ExtOp, Natavio_May_22_2022_ALUCtrl,
																										  Natavio_May_22_2022_RegWr, Natavio_May_22_2022_RegDst, 
																										  Natavio_May_22_2022_ALUSrc, Natavio_May_22_2022_MemToReg,
																										  Natavio_May_22_2022_MemWr, Natavio_May_22_2022_Branch,
																										  Natavio_May_22_2022_Jump);							
																										  
		Natavio_May_22_2022_MUX0	: Natavio_May_22_2022_5_bits_2_1_Mux PORT MAP (Natavio_May_22_2022_RT, Natavio_May_22_2022_RD,
																										  Natavio_May_22_2022_RegDst, Natavio_May_22_2022_Rw);
																										  
		Natavio_May_22_2022_RegF	: Natavio_May_22_2022_RF PORT MAP (Natavio_May_22_2022_clk, Natavio_May_22_2022_RegWr, Natavio_May_22_2022_BusW,
																						  Natavio_May_22_2022_Rw, Natavio_May_22_2022_RS, Natavio_May_22_2022_RT,
																						  Natavio_May_22_2022_A, Natavio_May_22_2022_BusB);
																						  
		Natavio_May_22_2022_MUX1	: Natavio_May_22_2022_32_bit_2_1_Mux PORT MAP (Natavio_May_22_2022_BusB, Natavio_May_22_2022_ImmExt,
																										  Natavio_May_22_2022_ALUSrc, Natavio_May_22_2022_B);
																										  
		Natavio_May_22_2022_ALU_P	: Natavio_May_22_2022_ALU PORT MAP (Natavio_May_22_2022_ALUCtrl, Natavio_May_22_2022_A, Natavio_May_22_2022_B,
																							Natavio_May_22_2022_upper_res, Natavio_May_22_2022_lower_res,
																							Natavio_May_22_2022_Overflow, Natavio_May_22_2022_Zero,
																							Natavio_May_22_2022_Negative, Natavio_May_22_2022_Cout);
		
		Natavio_May_22_2022_PCSrc <= Natavio_May_22_2022_Branch AND Natavio_May_22_2022_Zero;
		
		Natavio_May_22_2022_DM	: Natavio_May_22_2022_Data_Memory PORT MAP (Natavio_May_22_2022_clk, Natavio_May_22_2022_MemWr, Natavio_May_22_2022_MemRd,
																								  Natavio_May_22_2022_BusB, Natavio_May_22_2022_upper_res, 
																								  Natavio_May_22_2022_Mem_Data);
		
		Natavio_May_22_2022_MUX2	: Natavio_May_22_2022_32_bit_2_1_Mux PORT MAP (Natavio_May_22_2022_lower_res, Natavio_May_22_2022_Mem_Data,
																										  Natavio_May_22_2022_MemToReg, Natavio_May_22_2022_BusW);
		
		Natavio_May_22_2022_SignExt	: Natavio_May_22_2022_Sign_Ext PORT MAP (Natavio_May_22_2022_Imm, Natavio_May_22_2022_ExtOp,
																									  Natavio_May_22_2022_ImmExt);
																									  
		Natavio_May_22_2022_ImmExtShft <= to_stdlogicvector(to_bitvector(Natavio_May_22_2022_ImmExt) sll 2);
		
		Natavio_May_22_2022_PC_Add	: Natavio_May_22_2022_Adder PORT MAP (Natavio_May_22_2022_NextAddr, x"00000004", Natavio_May_22_2022_Adder1);
		
		Natavio_May_22_2022_Branch_Add	: Natavio_May_22_2022_Adder PORT MAP (Natavio_May_22_2022_Adder1, Natavio_May_22_2022_ImmExtShft,
																									  Natavio_May_22_2022_Adder2);
																									  
		Natavio_May_22_2022_MUX3	: Natavio_May_22_2022_32_bit_2_1_Mux PORT MAP (Natavio_May_22_2022_Adder1, Natavio_May_22_2022_Adder2,
																										  Natavio_May_22_2022_PCSrc, Natavio_May_22_2022_CurrAdderTmp);
																										  
		Natavio_May_22_2022_MUX4	: Natavio_May_22_2022_32_bit_2_1_Mux PORT MAP (Natavio_May_22_2022_CurrAdderTmp, Natavio_May_22_2022_JmpAddr,
																										  Natavio_May_22_2022_Jump, Natavio_May_22_2022_PC_O);
																										  
		Natavio_May_22_2022_Result(63 DOWNTO 32) <= Natavio_May_22_2022_upper_res;
		Natavio_May_22_2022_Result(31 DOWNTO 0) <= Natavio_May_22_2022_lower_res;
END arch;
