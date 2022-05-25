LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Natavio_May_22_2022_RF IS
	PORT (Natavio_May_22_2022_clk		: IN std_logic;
			Natavio_May_22_2022_wren	: IN std_logic;
			Natavio_May_22_2022_data	: IN std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_wr		: IN std_logic_vector (4 DOWNTO 0);
			Natavio_May_22_2022_rdA		: IN std_logic_vector (4 DOWNTO 0);
			Natavio_May_22_2022_rdB		: IN std_logic_vector (4 DOWNTO 0);
			Natavio_May_22_2022_qA		: OUT std_logic_vector (31 DOWNTO 0);
			Natavio_May_22_2022_qB		: OUT std_logic_vector (31 DOWNTO 0));
END Natavio_May_22_2022_RF;

ARCHITECTURE arch OF Natavio_May_22_2022_RF IS
	TYPE Natavio_May_22_2022_reg IS ARRAY(0 TO 31) OF std_logic_vector (31 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_reg_arr : Natavio_May_22_2022_reg;
	
	BEGIN
		PROCESS (Natavio_May_22_2022_clk, Natavio_May_22_2022_wren)
			BEGIN
				IF (rising_edge(Natavio_May_22_2022_clk)) THEN
					IF (Natavio_May_22_2022_wren = '1') THEN
						Natavio_May_22_2022_reg_arr(to_integer(unsigned(Natavio_May_22_2022_wr))) <= Natavio_May_22_2022_data;
					END IF;
				END IF;
		END PROCESS;
		
		Natavio_May_22_2022_qA <= x"00000000" WHEN Natavio_May_22_2022_rdA = "00000" ELSE 
										  Natavio_May_22_2022_reg_arr(to_integer(unsigned(Natavio_May_22_2022_rdA)));
		
		Natavio_May_22_2022_qB <= x"00000000" WHEN Natavio_May_22_2022_rdB = "00000" ELSE 
										  Natavio_May_22_2022_reg_arr(to_integer(unsigned(Natavio_May_22_2022_rdB)));

END arch;
