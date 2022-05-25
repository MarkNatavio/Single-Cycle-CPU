LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Natavio_May_22_2022_Data_Memory IS
	PORT(Natavio_May_22_2022_clk		: IN std_logic;
		  Natavio_May_22_2022_wren		: IN std_logic;
		  Natavio_May_22_2022_rden		: IN std_logic;
		  Natavio_May_22_2022_data		: IN std_logic_vector (31 DOWNTO 0);
		  Natavio_May_22_2022_address	: IN std_logic_Vector (31 DOWNTO 0);
		  Natavio_May_22_2022_Out		: OUT std_logic_vector (31 DOWNTO 0));
END Natavio_May_22_2022_Data_Memory;

ARCHITECTURE arch OF Natavio_May_22_2022_Data_Memory IS
	SIGNAL Natavio_May_22_2022_MemAddress	: std_logic_vector (31 DOWNTO 0);
	TYPE Natavio_May_22_2022_mem IS ARRAY(0 TO 63) OF std_logic_vector (31 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_mem_arr	: Natavio_May_22_2022_mem := ((others => (others => '0')));
	
	BEGIN
		Natavio_May_22_2022_MemAddress <= Natavio_May_22_2022_address(31 DOWNTO 0);
		PROCESS (Natavio_May_22_2022_clk)
			BEGIN
				IF (rising_edge(Natavio_May_22_2022_clk)) THEN
					IF (Natavio_May_22_2022_wren = '1') THEN
						Natavio_May_22_2022_mem_arr(to_integer(unsigned(Natavio_May_22_2022_MemAddress))) <= Natavio_May_22_2022_data;
					END IF;
				END IF;
		END PROCESS;
		
	Natavio_May_22_2022_Out <= Natavio_May_22_2022_mem_arr(to_integer(unsigned(Natavio_May_22_2022_MemAddress))) WHEN (Natavio_May_22_2022_rden = '1') ELSE x"00000000";
END arch;
