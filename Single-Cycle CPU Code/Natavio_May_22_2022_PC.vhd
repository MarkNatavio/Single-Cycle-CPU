LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Natavio_May_22_2022_PC IS
	PORT (Natavio_May_22_2022_clk		: IN std_logic;
			Natavio_May_22_2022_PC_I	: IN std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_PC_O	: OUT std_logic_vector (31 DOWNTO 0));
END Natavio_May_22_2022_PC;

ARCHITECTURE arch OF Natavio_May_22_2022_PC IS
	BEGIN
		PROCESS (Natavio_May_22_2022_clk)
			BEGIN
				IF (rising_edge(Natavio_May_22_2022_clk)) THEN
					Natavio_May_22_2022_PC_O <= Natavio_May_22_2022_PC_I;
				END IF;
		END PROCESS;
END arch;
