LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Natavio_May_22_2022_5_bits_2_1_Mux IS
	PORT (Natavio_May_22_2022_A		: IN std_logic_vector (4 DOWNTO 0);
			Natavio_May_22_2022_B		: IN std_logic_vector (4 DOWNTO 0);
			Natavio_May_22_2022_SEL		: IN std_logic;
			Natavio_May_22_2022_Out		: OUT std_logic_vector (4 DOWNTO 0));
END Natavio_May_22_2022_5_bits_2_1_Mux;

ARCHITECTURE arch OF Natavio_May_22_2022_5_bits_2_1_Mux IS
	BEGIN 
		Natavio_May_22_2022_Out(0) <= ((Natavio_May_22_2022_A(0) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(0) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(1) <= ((Natavio_May_22_2022_A(1) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(1) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(2) <= ((Natavio_May_22_2022_A(2) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(2) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(3) <= ((Natavio_May_22_2022_A(3) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(3) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(4) <= ((Natavio_May_22_2022_A(4) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(4) AND Natavio_May_22_2022_SEL));
END arch;
