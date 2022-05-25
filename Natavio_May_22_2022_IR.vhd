LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Natavio_May_22_2022_IR IS
	PORT (Natavio_May_22_2022_clk				: IN std_logic;
			Natavio_May_22_2022_wren			: IN std_logic;
			Natavio_May_22_2022_rden			: IN std_logic;
			Natavio_May_22_2022_chen			: IN std_logic;
			Natavio_May_22_2022_Instruction	: IN std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_IR_q			: OUT std_logic_vector (31 DOWNTO 0));
END Natavio_May_22_2022_IR;

ARCHITECTURE arch OF Natavio_May_22_2022_IR IS
	SIGNAL Natavio_May_22_2022_mem : std_logic_vector (31 DOWNTO 0);
	
	BEGIN
		Natavio_May_22_2022_p1	: PROCESS(Natavio_May_22_2022_clk)
			BEGIN
				IF (rising_edge(Natavio_May_22_2022_clk) AND Natavio_May_22_2022_wren = '1') THEN
					Natavio_May_22_2022_mem <= Natavio_May_22_2022_Instruction;
				END IF;
		END PROCESS Natavio_May_22_2022_p1;
		
		Natavio_May_22_2022_p2	: PROCESS(Natavio_May_22_2022_rden, Natavio_May_22_2022_chen, Natavio_May_22_2022_mem)
			BEGIN
				IF (Natavio_May_22_2022_rden = '1' AND Natavio_May_22_2022_chen = '1') THEN
					Natavio_May_22_2022_IR_q <= Natavio_May_22_2022_mem;
				ELSIF (Natavio_May_22_2022_chen = '0') THEN
					Natavio_May_22_2022_IR_q <= (OTHERS => 'Z');
				END IF;
		END PROCESS Natavio_May_22_2022_p2;
END arch;

