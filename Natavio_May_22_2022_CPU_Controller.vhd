LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Natavio_May_22_2022_CPU_Controller IS
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
END Natavio_May_22_2022_CPU_Controller;

ARCHITECTURE arch OF Natavio_May_22_2022_CPU_Controller IS
	SIGNAL Natavio_May_22_2022_ALU_OP	: std_logic_vector (2 DOWNTO 0);
	
	BEGIN
		PROCESS(Natavio_May_22_2022_OPCode)
			BEGIN
				CASE Natavio_May_22_2022_OPCode IS
					-- R-Type Instructions
					WHEN "000000" => -- add/addu/sub/subu/and/nor/sll/srl/sra
						Natavio_May_22_2022_ALU_OP <="000";
						Natavio_May_22_2022_RegWr <= '1';
						Natavio_May_22_2022_RegDst <= '1';
						Natavio_May_22_2022_ExtOp <= '0';
						Natavio_May_22_2022_ALUSrc <= '0';
						Natavio_May_22_2022_MemWr <= '0';
						Natavio_May_22_2022_MemToReg <= '0';
						Natavio_May_22_2022_Jump <= '0';
						Natavio_May_22_2022_Branch <= '0';
						
					-- I-Type Instructions
					WHEN "000100" | "000101" => -- addi/addiu
						Natavio_May_22_2022_ALU_OP <="001";
						Natavio_May_22_2022_RegWr <= '1';
						Natavio_May_22_2022_RegDst <= '0';
						Natavio_May_22_2022_ExtOp <= '1';
						Natavio_May_22_2022_ALUSrc <= '1';
						Natavio_May_22_2022_MemWr <= '0';
						Natavio_May_22_2022_MemToReg <= '0';
						Natavio_May_22_2022_Jump <= '0';
						Natavio_May_22_2022_Branch <= '0';
					WHEN "000110" => -- andi
						Natavio_May_22_2022_ALU_OP <="010";
						Natavio_May_22_2022_RegWr <= '1';
						Natavio_May_22_2022_RegDst <= '0';
						Natavio_May_22_2022_ExtOp <= '0';
						Natavio_May_22_2022_ALUSrc <= '1';
						Natavio_May_22_2022_MemWr <= '0';
						Natavio_May_22_2022_MemToReg <= '0';
						Natavio_May_22_2022_Jump <= '0';
						Natavio_May_22_2022_Branch <= '0';
					WHEN "000111" => -- ori
						Natavio_May_22_2022_ALU_OP <="011";
						Natavio_May_22_2022_RegWr <= '1';
						Natavio_May_22_2022_RegDst <= '0';
						Natavio_May_22_2022_ExtOp <= '0';
						Natavio_May_22_2022_ALUSrc <= '1';
						Natavio_May_22_2022_MemWr <= '0';
						Natavio_May_22_2022_MemToReg <= '0';
						Natavio_May_22_2022_Jump <= '0';
						Natavio_May_22_2022_Branch <= '0';
					WHEN "001000" => -- sw
						Natavio_May_22_2022_ALU_OP <="100";
						Natavio_May_22_2022_RegWr <= '0';
						Natavio_May_22_2022_RegDst <= '0';
						Natavio_May_22_2022_ExtOp <= '1';
						Natavio_May_22_2022_ALUSrc <= '1';
						Natavio_May_22_2022_MemWr <= '1';
						Natavio_May_22_2022_MemToReg <= '0';
						Natavio_May_22_2022_Jump <= '0';
						Natavio_May_22_2022_Branch <= '0';
					WHEN "001001" => -- lw
						Natavio_May_22_2022_ALU_OP <="101";
						Natavio_May_22_2022_RegWr <= '1';
						Natavio_May_22_2022_RegDst <= '0';
						Natavio_May_22_2022_ExtOp <= '1';
						Natavio_May_22_2022_ALUSrc <= '1';
						Natavio_May_22_2022_MemWr <= '0';
						Natavio_May_22_2022_MemToReg <= '1';
						Natavio_May_22_2022_Jump <= '0';
						Natavio_May_22_2022_Branch <= '0';
					WHEN "001010" | "001011" => -- beq/bne
						Natavio_May_22_2022_ALU_OP <="110";
						Natavio_May_22_2022_RegWr <= '0';
						Natavio_May_22_2022_RegDst <= '0';
						Natavio_May_22_2022_ExtOp <= '1';
						Natavio_May_22_2022_ALUSrc <= '0';
						Natavio_May_22_2022_MemWr <= '0';
						Natavio_May_22_2022_MemToReg <= '0';
						Natavio_May_22_2022_Jump <= '0';
						Natavio_May_22_2022_Branch <= '1';
						
					-- J-Type Instruction
					WHEN "000010" => -- j
						Natavio_May_22_2022_ALU_OP <="111";
						Natavio_May_22_2022_RegWr <= '0';
						Natavio_May_22_2022_RegDst <= '0';
						Natavio_May_22_2022_ExtOp <= '0';
						Natavio_May_22_2022_ALUSrc <= '0';
						Natavio_May_22_2022_MemWr <= '0';
						Natavio_May_22_2022_MemToReg <= '0';
						Natavio_May_22_2022_Jump <= '1';
						Natavio_May_22_2022_Branch <= '0';
					WHEN others => -- base case
						Natavio_May_22_2022_ALU_OP <="ZZZ";
						Natavio_May_22_2022_RegWr <= 'Z';
						Natavio_May_22_2022_RegDst <= 'Z';
						Natavio_May_22_2022_ExtOp <= 'Z';
						Natavio_May_22_2022_ALUSrc <= 'Z';
						Natavio_May_22_2022_MemWr <= 'Z';
						Natavio_May_22_2022_MemToReg <= 'Z';
						Natavio_May_22_2022_Jump <= 'Z';
						Natavio_May_22_2022_Branch <= 'Z';
				END CASE;
		END PROCESS;
		
		PROCESS(Natavio_May_22_2022_ALU_OP, Natavio_May_22_2022_Funct)
			BEGIN
				-- R-Type Instructions
				IF (Natavio_May_22_2022_ALU_OP = "000" AND (Natavio_May_22_2022_Funct = "000000" OR 
																		  Natavio_May_22_2022_Funct = "000001")) THEN
					Natavio_May_22_2022_ALUCtrl <= "0000"; -- add/addu
				ELSIF (Natavio_May_22_2022_ALU_OP = "000" AND (Natavio_May_22_2022_Funct = "000010" OR 
																			  Natavio_May_22_2022_Funct = "000011")) THEN
					Natavio_May_22_2022_ALUCtrl <= "0010"; -- sub/subu
				ELSIF (Natavio_May_22_2022_ALU_OP = "000" AND Natavio_May_22_2022_Funct = "000100") THEN
					Natavio_May_22_2022_ALUCtrl <= "0011"; -- and
				ELSIF (Natavio_May_22_2022_ALU_OP = "000" AND Natavio_May_22_2022_Funct = "000101") THEN
					Natavio_May_22_2022_ALUCtrl <= "0110"; -- nor
				ELSIF (Natavio_May_22_2022_ALU_OP = "000" AND Natavio_May_22_2022_Funct = "000110") THEN
					Natavio_May_22_2022_ALUCtrl <= "0111"; -- sll
				ELSIF (Natavio_May_22_2022_ALU_OP = "000" AND Natavio_May_22_2022_Funct = "000111") THEN
					Natavio_May_22_2022_ALUCtrl <= "1000"; -- srl
				ELSIF (Natavio_May_22_2022_ALU_OP = "000" AND Natavio_May_22_2022_Funct = "001000") THEN
					Natavio_May_22_2022_ALUCtrl <= "1001"; -- sra
					
				-- I-Type Instructions
				ELSIF (Natavio_May_22_2022_ALU_OP = "001") THEN
					Natavio_May_22_2022_ALUCtrl <= "0001"; -- addi/addiu
				ELSIF (Natavio_May_22_2022_ALU_OP = "010") THEN
					Natavio_May_22_2022_ALUCtrl <= "0100"; -- andi
				ELSIF (Natavio_May_22_2022_ALU_OP = "011") THEN
					Natavio_May_22_2022_ALUCtrl <= "0101"; -- ori
				ELSIF (Natavio_May_22_2022_ALU_OP = "100" OR Natavio_May_22_2022_ALU_OP = "101") THEN
					Natavio_May_22_2022_ALUCtrl <= "0000"; -- sw/lw
				ELSIF (Natavio_May_22_2022_ALU_OP = "110") THEN
					Natavio_May_22_2022_ALUCtrl <= "0010"; -- beq/bne
				END IF;
		END PROCESS;
END arch;
