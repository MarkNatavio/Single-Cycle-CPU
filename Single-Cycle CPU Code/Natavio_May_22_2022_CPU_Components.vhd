LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE Natavio_May_22_2022_CPU_Components IS
	-- Data Memory
	COMPONENT Natavio_May_22_2022_Data_Memory IS
		PORT(Natavio_May_22_2022_clk		: IN std_logic;
			  Natavio_May_22_2022_wren		: IN std_logic;
			  Natavio_May_22_2022_rden		: IN std_logic;
			  Natavio_May_22_2022_data		: IN std_logic_vector (31 DOWNTO 0);
			  Natavio_May_22_2022_address	: IN std_logic_Vector (31 DOWNTO 0);
			  Natavio_May_22_2022_Out		: OUT std_logic_vector (31 DOWNTO 0));
	END COMPONENT;
	
	-- Instruction Register (IR)
	COMPONENT Natavio_May_22_2022_IR IS
		PORT (Natavio_May_22_2022_clk				: IN std_logic;
				Natavio_May_22_2022_wren			: IN std_logic;
				Natavio_May_22_2022_rden			: IN std_logic;
				Natavio_May_22_2022_chen			: IN std_logic;
				Natavio_May_22_2022_Instruction	: IN std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_IR_q			: OUT std_logic_vector (31 DOWNTO 0));
	END COMPONENT;
	
	-- Instruction Memory
	COMPONENT Natavio_May_22_2022_Instruction_Memory IS
		PORT (Natavio_May_22_2022_inst_addr	: IN std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_OPCode		: OUT std_logic_vector (5 DOWNTO 0);
				Natavio_May_22_2022_RS			: OUT std_logic_vector (4 DOWNTO 0);
				Natavio_May_22_2022_RT			: OUT std_logic_vector (4 DOWNTO 0);
				Natavio_May_22_2022_RD			: OUT std_logic_vector (4 DOWNTO 0);
				Natavio_May_22_2022_shamt		: OUT std_logic_vector (4 DOWNTO 0);
				Natavio_May_22_2022_funct		: OUT std_logic_vector (5 DOWNTO 0);
				Natavio_May_22_2022_Imm16		: OUT std_logic_vector (15 DOWNTO 0);
				Natavio_May_22_2022_J_Addr		: OUT std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_Inst		: OUT std_logic_vector (31 DOWNTO 0));
	END COMPONENT;
	
	-- Register File (RF)
	COMPONENT Natavio_May_22_2022_RF IS
		PORT (Natavio_May_22_2022_clk		: IN std_logic;
				Natavio_May_22_2022_wren	: IN std_logic;
				Natavio_May_22_2022_data	: IN std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_wr		: IN std_logic_vector (4 DOWNTO 0);
				Natavio_May_22_2022_rdA		: IN std_logic_vector (4 DOWNTO 0);
				Natavio_May_22_2022_rdB		: IN std_logic_vector (4 DOWNTO 0);
				Natavio_May_22_2022_qA		: OUT std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_qB		: OUT std_logic_vector (31 DOWNTO 0));
	END COMPONENT;
	
	-- Program Counter (PC)
	COMPONENT Natavio_May_22_2022_PC IS
		PORT (Natavio_May_22_2022_clk		: IN std_logic;
				Natavio_May_22_2022_PC_I	: IN std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_PC_O	: OUT std_logic_vector (31 DOWNTO 0));
	END COMPONENT;
	
	-- Adder
	COMPONENT Natavio_May_22_2022_Adder IS
		PORT (Natavio_May_22_2022_dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
				Natavio_May_22_2022_datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
				Natavio_May_22_2022_result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	END COMPONENT;

	-- 5-Bit 2:1 MUX
	COMPONENT Natavio_May_22_2022_5_bits_2_1_Mux IS
		PORT (Natavio_May_22_2022_A		: IN std_logic_vector (4 DOWNTO 0);
				Natavio_May_22_2022_B		: IN std_logic_vector (4 DOWNTO 0);
				Natavio_May_22_2022_SEL		: IN std_logic;
				Natavio_May_22_2022_Out		: OUT std_logic_vector (4 DOWNTO 0));
	END COMPONENT;
	
	-- 32-Bit 2:1 MUX
	COMPONENT Natavio_May_22_2022_32_bit_2_1_Mux IS
		PORT (Natavio_May_22_2022_A		: IN std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_B		: IN std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_SEL		: IN std_logic;
				Natavio_May_22_2022_Out		: OUT std_logic_vector (31 DOWNTO 0));
	END COMPONENT;
	
	-- Sign Extender
	COMPONENT Natavio_May_22_2022_Sign_Ext IS
		PORT (Natavio_May_22_2022_16_bits	: IN std_logic_vector (15 DOWNTO 0);
				Natavio_May_22_2022_ExtOp		: IN std_logic;
				Natavio_May_22_2022_32_bits	: OUT std_logic_vector (31 DOWNTO 0));
	END COMPONENT;
	
	-- Logical Bitwise Operation Unit
	COMPONENT Natavio_May_22_2022_Logical_Bitwise_Op IS
		PORT (Natavio_May_22_2022_OP		: IN std_logic_Vector (3 DOWNTO 0);
				Natavio_May_22_2022_A		: IN std_logic_Vector (31 DOWNTO 0);
				Natavio_May_22_2022_B		: IN std_logic_Vector (31 DOWNTO 0);
				Natavio_May_22_2022_Ext		: IN std_logic_Vector (31 DOWNTO 0);
				Natavio_May_22_2022_Shamt	: IN std_logic_Vector (15 DOWNTO 0);
				Natavio_May_22_2022_Res		: OUT std_logic_Vector (31 DOWNTO 0));
	END COMPONENT;

	-- Add/Sub
	COMPONENT Natavio_May_22_2022_addsub_ZNO IS
		GENERIC (Natavio_May_22_2022_N	:	integer := 32);
		PORT (Natavio_May_22_2022_OP		:	IN std_logic;
				Natavio_May_22_2022_A		:	IN std_logic_vector (Natavio_May_22_2022_N-1 DOWNTO 0);
				Natavio_May_22_2022_B		:	IN std_logic_vector (Natavio_May_22_2022_N-1 DOWNTO 0);
				Natavio_May_22_2022_Result	:	OUT std_logic_vector (Natavio_May_22_2022_N-1 DOWNTO 0);
				Natavio_May_22_2022_COUT	:	OUT std_logic;
				Natavio_May_22_2022_Overflow, Natavio_May_22_2022_Zero, Natavio_May_22_2022_Negative	:	OUT std_logic);
	END COMPONENT;
	
	-- Arithmetic Logic Unit (ALU)
	COMPONENT Natavio_May_22_2022_ALU IS
		PORT (Natavio_May_22_2022_ALUCtrl	: IN std_logic_vector (3 DOWNTO 0);
				Natavio_May_22_2022_Operand1	: IN std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_Operand2	: IN std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_upper_res	: OUT std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_lower_res	: OUT std_logic_vector (31 DOWNTO 0);
				Natavio_May_22_2022_Overflow	: OUT std_logic;
				Natavio_May_22_2022_Zero		: OUT std_logic;
				Natavio_May_22_2022_Negative	: OUT std_logic;
				Natavio_May_22_2022_Cout		: OUT std_logic);
	END COMPONENT;
	
	-- CPU Controller
	COMPONENT Natavio_May_22_2022_CPU_Controller IS
		PORT (Natavio_May_22_2022_OPCode		: in std_logic_vector (5 DOWNTO 0);
				Natavio_May_22_2022_Funct		: in std_logic_vector (5 DOWNTO 0);
				Natavio_May_22_2022_ExtOp		: out std_logic;
				Natavio_May_22_2022_ALUCtrl	: out std_logic_vector (3 DOWNTO 0);
				Natavio_May_22_2022_RegWr		: out std_logic;
				Natavio_May_22_2022_RegDst		: out std_logic;
				Natavio_May_22_2022_ALUSrc		: out std_logic;
				Natavio_May_22_2022_MemToReg	: out std_logic;
				Natavio_May_22_2022_MemWr		: out std_logic;
				Natavio_May_22_2022_Branch		: out std_logic;
				Natavio_May_22_2022_Jump		: out std_logic);
	END COMPONENT;
	
END Natavio_May_22_2022_CPU_Components;