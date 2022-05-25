LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Natavio_May_22_2022_Sign_Ext IS
	PORT (Natavio_May_22_2022_16_bits	: IN std_logic_vector (15 DOWNTO 0);
			Natavio_May_22_2022_ExtOp		: IN std_logic;
			Natavio_May_22_2022_32_bits	: OUT std_logic_vector (31 DOWNTO 0));
END Natavio_May_22_2022_Sign_Ext;

ARCHITECTURE arch OF Natavio_May_22_2022_Sign_Ext IS

	BEGIN
		PROCESS (Natavio_May_22_2022_ExtOp)
			BEGIN
				IF (Natavio_May_22_2022_ExtOp = '0') THEN
					Natavio_May_22_2022_32_bits <= std_logic_vector(resize(unsigned(Natavio_May_22_2022_16_bits), 32));
				ELSE
					Natavio_May_22_2022_32_bits <= std_logic_vector(resize(signed(Natavio_May_22_2022_16_bits), 32));
				END IF;
		END PROCESS;
END arch;
