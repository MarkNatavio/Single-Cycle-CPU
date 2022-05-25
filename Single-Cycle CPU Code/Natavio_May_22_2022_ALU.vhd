LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Natavio_May_22_2022_ALU IS
	PORT (Natavio_May_22_2022_ALUCtrl	: IN std_logic_vector (3 DOWNTO 0);
			Natavio_May_22_2022_Operand1	: IN std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_Operand2	: IN std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_upper_res	: OUT std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_lower_res	: OUT std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_Overflow	: OUT std_logic;
			Natavio_May_22_2022_Zero		: OUT std_logic;
			Natavio_May_22_2022_Negative	: OUT std_logic;
			Natavio_May_22_2022_Cout		: OUT std_logic);
END Natavio_May_22_2022_ALU;

ARCHITECTURE arch OF Natavio_May_22_2022_ALU IS
	SIGNAL Natavio_May_22_2022_res	: std_logic_vector (63 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_ext, Natavio_May_22_2022_ext2	: std_logic_vector (31 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_imm_o : std_logic_vector (15 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_ext0, Natavio_May_22_2022_ext1	: std_logic_vector (15 DOWNTO 0);
	
	-- All arithmetic flags
	SIGNAL Natavio_May_22_2022_O0, Natavio_May_22_2022_Z0, Natavio_May_22_2022_N0,
			 Natavio_May_22_2022_O1, Natavio_May_22_2022_Z1, Natavio_May_22_2022_N1,
			 Natavio_May_22_2022_O2, Natavio_May_22_2022_Z2, Natavio_May_22_2022_N2 : std_logic := '0';
	
	-- All arithmetic carryouts
	SIGNAL Natavio_May_22_2022_Cout0, Natavio_May_22_2022_Cout1, Natavio_May_22_2022_Cout2 : std_logic := '0';		 
			
	-- All Opertaion outputs
	SIGNAL Natavio_May_22_2022_temp0, Natavio_May_22_2022_temp1,
			 Natavio_May_22_2022_temp2, Natavio_May_22_2022_temp3 : std_logic_vector (31 DOWNTO 0);
	
														-- Components
		-- Sign Extension Unit
	COMPONENT Natavio_May_22_2022_Sign_Ext
		PORT (Natavio_May_22_2022_16_bits	: IN std_logic_vector (15 DOWNTO 0);
				Natavio_May_22_2022_ExtOp		: IN std_logic;
				Natavio_May_22_2022_32_bits	: OUT std_logic_vector (31 DOWNTO 0));
	END COMPONENT;
	
	-- Logical Bitwise Operation Unit
	COMPONENT Natavio_May_22_2022_Logical_Bitwise_Op
		PORT (Natavio_May_22_2022_OP		: IN std_logic_Vector (3 DOWNTO 0);
				Natavio_May_22_2022_A		: IN std_logic_Vector (31 DOWNTO 0);
				Natavio_May_22_2022_B		: IN std_logic_Vector (31 DOWNTO 0);
				Natavio_May_22_2022_Ext		: IN std_logic_Vector (31 DOWNTO 0);
				Natavio_May_22_2022_Shamt	: IN std_logic_Vector (15 DOWNTO 0);
				Natavio_May_22_2022_Res		: OUT std_logic_Vector (31 DOWNTO 0));
	END COMPONENT;
	
	-- Add/Sub Unit W/ Zero, Negative, & Overflow Flags
	component Natavio_May_22_2022_addsub_ZNO
		GENERIC (Natavio_May_22_2022_N	:	integer := 32);
		PORT (Natavio_May_22_2022_OP		:	IN std_logic;
				Natavio_May_22_2022_A		:	IN std_logic_vector (Natavio_May_22_2022_N-1 DOWNTO 0);
				Natavio_May_22_2022_B		:	IN std_logic_vector (Natavio_May_22_2022_N-1 DOWNTO 0);
				Natavio_May_22_2022_Result	:	OUT std_logic_vector (Natavio_May_22_2022_N-1 DOWNTO 0);
				Natavio_May_22_2022_COUT	:	OUT std_logic;
				Natavio_May_22_2022_Overflow, Natavio_May_22_2022_Zero, Natavio_May_22_2022_Negative	:	OUT std_logic);
	END COMPONENT;
	
	BEGIN
		Natavio_May_22_2022_imm_o <= Natavio_May_22_2022_Operand2(15 DOWNTO 0);
		
		-- Extension
		Natavio_May_22_2022_extension : Natavio_May_22_2022_Sign_Ext PORT MAP (Natavio_May_22_2022_imm_o, '0', Natavio_May_22_2022_ext);
		
		Natavio_May_22_2022_ext0 <= Natavio_May_22_2022_ext(31 DOWNTO 16);
		Natavio_May_22_2022_ext1 <= Natavio_May_22_2022_imm_o;
		Natavio_May_22_2022_ext2 <= Natavio_May_22_2022_ext0 & Natavio_May_22_2022_ext1;
		
		-- Arithmetic Operations
		Natavio_May_22_2022_add : Natavio_May_22_2022_addsub_ZNO GENERIC MAP (Natavio_May_22_2022_N => 32) -- add/addu
																					PORT MAP ('0', Natavio_May_22_2022_Operand1,
																								 Natavio_May_22_2022_Operand2, Natavio_May_22_2022_temp0,
																								 Natavio_May_22_2022_Cout0, Natavio_May_22_2022_O0,
																								 Natavio_May_22_2022_Z0, Natavio_May_22_2022_N0);
																								 
		Natavio_May_22_2022_addi : Natavio_May_22_2022_addsub_ZNO GENERIC MAP (Natavio_May_22_2022_N => 32) --addi/addiu
																					PORT MAP ('0', Natavio_May_22_2022_Operand1,
																								 Natavio_May_22_2022_ext2, Natavio_May_22_2022_temp1,
																								 Natavio_May_22_2022_Cout1, Natavio_May_22_2022_O1,
																								 Natavio_May_22_2022_Z1, Natavio_May_22_2022_N1);
		
		Natavio_May_22_2022_sub : Natavio_May_22_2022_addsub_ZNO GENERIC MAP (Natavio_May_22_2022_N => 32) --sub/subu
																					PORT MAP ('1', Natavio_May_22_2022_Operand1,
																								 Natavio_May_22_2022_Operand2, Natavio_May_22_2022_temp2,
																								 Natavio_May_22_2022_Cout2, Natavio_May_22_2022_O2,
																								 Natavio_May_22_2022_Z2, Natavio_May_22_2022_N2);
		
		-- Logical Operations
		Natavio_May_22_2022_bit_op	: Natavio_May_22_2022_Logical_Bitwise_Op PORT MAP (Natavio_May_22_2022_ALUCtrl, 
																												Natavio_May_22_2022_Operand1,
																												Natavio_May_22_2022_Operand2,
																												Natavio_May_22_2022_ext2,
																												Natavio_May_22_2022_imm_o,
																												Natavio_May_22_2022_temp3);
		
		PROCESS (Natavio_May_22_2022_ALUCtrl, Natavio_May_22_2022_temp0, Natavio_May_22_2022_temp1, Natavio_May_22_2022_temp2,
					Natavio_May_22_2022_temp3, Natavio_May_22_2022_ext2, Natavio_May_22_2022_imm_o,
					Natavio_May_22_2022_O0, Natavio_May_22_2022_Z0, Natavio_May_22_2022_N0, Natavio_May_22_2022_Cout0,
					Natavio_May_22_2022_O1, Natavio_May_22_2022_Z1, Natavio_May_22_2022_N1, Natavio_May_22_2022_Cout1,
					Natavio_May_22_2022_O2, Natavio_May_22_2022_Z2, Natavio_May_22_2022_N2, Natavio_May_22_2022_Cout2)
			BEGIN
				CASE Natavio_May_22_2022_ALUCtrl IS
					WHEN "0000" => -- add/addu/sw/lw
						Natavio_May_22_2022_upper_res <= x"00000000";
						Natavio_May_22_2022_lower_res <= Natavio_May_22_2022_temp0;
						Natavio_May_22_2022_Overflow <= Natavio_May_22_2022_O0;
						Natavio_May_22_2022_Zero <= Natavio_May_22_2022_Z0;
						Natavio_May_22_2022_Negative <= Natavio_May_22_2022_N0;
						Natavio_May_22_2022_Cout <= Natavio_May_22_2022_Cout0;
						
					WHEN "0001" => -- addi/addiu
						Natavio_May_22_2022_upper_res <= x"00000000";
						Natavio_May_22_2022_lower_res <= Natavio_May_22_2022_temp1;
						Natavio_May_22_2022_Overflow <= Natavio_May_22_2022_O1;
						Natavio_May_22_2022_Zero <= Natavio_May_22_2022_Z1;
						Natavio_May_22_2022_Negative <= Natavio_May_22_2022_N1;
						Natavio_May_22_2022_Cout <= Natavio_May_22_2022_Cout1;
					
					WHEN "0010" => -- sub/subu/beq/bne
						Natavio_May_22_2022_upper_res <= x"00000000";
						Natavio_May_22_2022_lower_res <= Natavio_May_22_2022_temp2;
						Natavio_May_22_2022_Overflow <= Natavio_May_22_2022_O2;
						Natavio_May_22_2022_Zero <= Natavio_May_22_2022_Z2;
						Natavio_May_22_2022_Negative <= Natavio_May_22_2022_N2;
						Natavio_May_22_2022_Cout <= Natavio_May_22_2022_Cout2;
					
					WHEN "0011" | "0100" | "0101" | "0110" | "0111" | "1000" | "1001" => -- and/andi/ori/nor/sll/srl/sra
						Natavio_May_22_2022_upper_res <= x"00000000";
						Natavio_May_22_2022_lower_res <= Natavio_May_22_2022_temp3;
					
					WHEN others => -- base case
						Natavio_May_22_2022_upper_res <= (others => 'Z');
						Natavio_May_22_2022_lower_res <= (others => 'Z');
				END CASE;
		END PROCESS;
END arch;
