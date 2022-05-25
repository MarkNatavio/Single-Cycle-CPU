LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Natavio_May_22_2022_32_bit_2_1_Mux IS
	PORT (Natavio_May_22_2022_A		: IN std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_B		: IN std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_SEL		: IN std_logic;
			Natavio_May_22_2022_Out		: OUT std_logic_vector (31 DOWNTO 0));
END Natavio_May_22_2022_32_bit_2_1_Mux;

ARCHITECTURE arch OF Natavio_May_22_2022_32_bit_2_1_Mux IS
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
		Natavio_May_22_2022_Out(5) <= ((Natavio_May_22_2022_A(5) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(5) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(6) <= ((Natavio_May_22_2022_A(6) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(6) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(7) <= ((Natavio_May_22_2022_A(7) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(7) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(8) <= ((Natavio_May_22_2022_A(8) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(8) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(9) <= ((Natavio_May_22_2022_A(9) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(9) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(10) <= ((Natavio_May_22_2022_A(10) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(10) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(11) <= ((Natavio_May_22_2022_A(11) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(11) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(12) <= ((Natavio_May_22_2022_A(12) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(12) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(13) <= ((Natavio_May_22_2022_A(13) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(13) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(14) <= ((Natavio_May_22_2022_A(14) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(14) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(15) <= ((Natavio_May_22_2022_A(15) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(15) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(16) <= ((Natavio_May_22_2022_A(16) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(16) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(17) <= ((Natavio_May_22_2022_A(17) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(17) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(18) <= ((Natavio_May_22_2022_A(18) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(18) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(19) <= ((Natavio_May_22_2022_A(19) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(19) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(20) <= ((Natavio_May_22_2022_A(20) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(20) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(21) <= ((Natavio_May_22_2022_A(21) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(21) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(22) <= ((Natavio_May_22_2022_A(22) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(22) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(23) <= ((Natavio_May_22_2022_A(23) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(23) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(24) <= ((Natavio_May_22_2022_A(24) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(24) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(25) <= ((Natavio_May_22_2022_A(25) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(25) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(26) <= ((Natavio_May_22_2022_A(26) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(26) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(27) <= ((Natavio_May_22_2022_A(27) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(27) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(28) <= ((Natavio_May_22_2022_A(28) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(28) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(29) <= ((Natavio_May_22_2022_A(29) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(29) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(30) <= ((Natavio_May_22_2022_A(30) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(30) AND Natavio_May_22_2022_SEL));
		Natavio_May_22_2022_Out(31) <= ((Natavio_May_22_2022_A(31) AND (NOT Natavio_May_22_2022_SEL)) OR
												 (Natavio_May_22_2022_B(31) AND Natavio_May_22_2022_SEL));
END arch;
