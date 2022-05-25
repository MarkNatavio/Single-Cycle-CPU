LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Natavio_May_22_2022_Instruction_Memory IS
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
END Natavio_May_22_2022_Instruction_Memory;

ARCHITECTURE arch OF Natavio_May_22_2022_Instruction_Memory IS
	TYPE Natavio_May_22_2022_mem IS ARRAY (0 to 127) OF std_logic_vector (31 DOWNTO 0);
	
	SIGNAL Natavio_May_22_2022_mem_arr : Natavio_May_22_2022_mem;
	SIGNAL Natavio_May_22_2022_Instruction	: std_logic_vector (31 DOWNTO 0);
	
	BEGIN
		Natavio_May_22_2022_mem_arr(0)  <= x"10100001"; -- addi $s0, 1
		Natavio_May_22_2022_mem_arr(4)  <= x"12100002"; -- addi $s0, 2
		Natavio_May_22_2022_mem_arr(8)  <= x"12100003"; -- addi $s0, 3
		Natavio_May_22_2022_mem_arr(12) <= x"12100004"; -- addi $s0, 4
		Natavio_May_22_2022_mem_arr(16) <= x"12100005"; -- addi $s0, 5
		
		Natavio_May_22_2022_Instruction <= Natavio_May_22_2022_mem_arr(to_integer(unsigned(Natavio_May_22_2022_inst_addr)));
		
		Natavio_May_22_2022_OPCode <= Natavio_May_22_2022_Instruction(31 DOWNTO 26);
		Natavio_May_22_2022_RS <= Natavio_May_22_2022_Instruction(25 DOWNTO 21);
		Natavio_May_22_2022_RT <= Natavio_May_22_2022_Instruction(20 DOWNTO 16);
		Natavio_May_22_2022_RD <= Natavio_May_22_2022_Instruction(15 DOWNTO 11);
		Natavio_May_22_2022_shamt <= Natavio_May_22_2022_Instruction(10 DOWNTO 6);
		Natavio_May_22_2022_funct <= Natavio_May_22_2022_Instruction(5 DOWNTO 0);
		Natavio_May_22_2022_Imm16 <= Natavio_May_22_2022_Instruction(15 DOWNTO 0);
		Natavio_May_22_2022_J_Addr <= Natavio_May_22_2022_inst_addr(31 DOWNTO 28) & Natavio_May_22_2022_Instruction(25 DOWNTO 0) & "00";
		Natavio_May_22_2022_Inst <= Natavio_May_22_2022_Instruction(31 DOWNTO 0);
END arch;
