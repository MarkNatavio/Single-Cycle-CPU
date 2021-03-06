LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;

ENTITY Natavio_May_22_2022_Logical_Bitwise_Op IS
	PORT (Natavio_May_22_2022_OP		: IN std_logic_Vector (3 DOWNTO 0);
			Natavio_May_22_2022_A		: IN std_logic_Vector (31 DOWNTO 0);
			Natavio_May_22_2022_B		: IN std_logic_Vector (31 DOWNTO 0);
			Natavio_May_22_2022_Ext		: IN std_logic_Vector (31 DOWNTO 0);
			Natavio_May_22_2022_Shamt	: IN std_logic_Vector (15 DOWNTO 0);
			Natavio_May_22_2022_Res		: OUT std_logic_Vector (31 DOWNTO 0));
END Natavio_May_22_2022_Logical_Bitwise_Op;

ARCHITECTURE arch OF Natavio_May_22_2022_Logical_Bitwise_Op IS
	BEGIN
		PROCESS (Natavio_May_22_2022_OP, Natavio_May_22_2022_A, Natavio_May_22_2022_B)
			BEGIN
				IF (Natavio_May_22_2022_OP = "0011") THEN -- AND
					Natavio_May_22_2022_Res <= Natavio_May_22_2022_A AND Natavio_May_22_2022_B;
				ELSIF (Natavio_May_22_2022_OP = "0100") then -- ANDi
					Natavio_May_22_2022_Res <= Natavio_May_22_2022_A AND Natavio_May_22_2022_Ext;
				ELSIF (Natavio_May_22_2022_OP = "0110") then -- NOR
					Natavio_May_22_2022_Res <= Natavio_May_22_2022_A NOR Natavio_May_22_2022_B;
				ELSIF (Natavio_May_22_2022_OP = "0101") then -- ORi
					Natavio_May_22_2022_Res <= Natavio_May_22_2022_A OR Natavio_May_22_2022_ext;
				ELSIF (Natavio_May_22_2022_OP = "0111") THEN -- SLL
					Natavio_May_22_2022_Res <= std_logic_vector(shift_left(unsigned(Natavio_May_22_2022_B),
																					to_integer(unsigned(Natavio_May_22_2022_Shamt))));
				ELSIF (Natavio_May_22_2022_OP = "1000") THEN -- SRL
					Natavio_May_22_2022_Res <= std_logic_vector(shift_right(unsigned(Natavio_May_22_2022_B),
																					to_integer(unsigned(Natavio_May_22_2022_Shamt))));
				ELSIF (Natavio_May_22_2022_OP = "1001") THEN -- SRA
					Natavio_May_22_2022_Res <= std_logic_vector(shift_right(signed(Natavio_May_22_2022_B),
																					to_integer(unsigned(Natavio_May_22_2022_Shamt))));
				ELSE
					Natavio_May_22_2022_Res <= x"00000000";
				END IF;
		END PROCESS;
END arch;
