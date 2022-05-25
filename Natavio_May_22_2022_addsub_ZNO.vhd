LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Natavio_May_22_2022_addsub_ZNO IS
	GENERIC (Natavio_May_22_2022_N	:	integer := 32);
	PORT (Natavio_May_22_2022_OP		:	IN std_logic;
			Natavio_May_22_2022_A		:	IN std_logic_vector (Natavio_May_22_2022_N-1 DOWNTO 0);
			Natavio_May_22_2022_B		:	IN std_logic_vector (Natavio_May_22_2022_N-1 DOWNTO 0);
			Natavio_May_22_2022_Result	:	OUT std_logic_vector (Natavio_May_22_2022_N-1 DOWNTO 0);
			Natavio_May_22_2022_COUT	:	OUT std_logic;
			Natavio_May_22_2022_Overflow, Natavio_May_22_2022_Zero, Natavio_May_22_2022_Negative	:	OUT std_logic);
END Natavio_May_22_2022_addsub_ZNO;

Architecture arch OF Natavio_May_22_2022_addsub_ZNO is
	SIGNAL Natavio_May_22_2022_index	: std_logic_vector(Natavio_May_22_2022_N DOWNTO 0);
	SIGNAL Natavio_May_22_2022_Z			: std_logic_vector(Natavio_May_22_2022_N DOWNTO 0);
	SIGNAL Natavio_May_22_2022_var		: std_logic_vector(2 DOWNTO 0);
	SIGNAL Natavio_May_22_2022_out		: std_logic_vector(Natavio_May_22_2022_N DOWNTO 0);
	SIGNAL Natavio_May_22_2022_Z_flag	: std_logic;
	SIGNAL Natavio_May_22_2022_p0, Natavio_May_22_2022_p1,
			 Natavio_May_22_2022_p2	: std_logic_vector(Natavio_May_22_2022_N DOWNTO 0);

	BEGIN
		PROCESS(Natavio_May_22_2022_OP, Natavio_May_22_2022_A, Natavio_May_22_2022_B, Natavio_May_22_2022_index,
				  Natavio_May_22_2022_p0, Natavio_May_22_2022_p1, Natavio_May_22_2022_p2, Natavio_May_22_2022_out)
			BEGIN
				Natavio_May_22_2022_index(0) <= Natavio_May_22_2022_OP;
				Natavio_May_22_2022_Z(0) <= '1';
				
				FOR i IN 0 TO Natavio_May_22_2022_N-1 LOOP
					Natavio_May_22_2022_p0(i) <= Natavio_May_22_2022_B(i) XOR Natavio_May_22_2022_OP;
					Natavio_May_22_2022_p1(i) <= Natavio_May_22_2022_p0(i) XOR Natavio_May_22_2022_A(i);
					Natavio_May_22_2022_Result(i) <= Natavio_May_22_2022_p1(i) XOR Natavio_May_22_2022_index(i);
					Natavio_May_22_2022_out(i) <= Natavio_May_22_2022_p1(i) XOR Natavio_May_22_2022_index(i);
					Natavio_May_22_2022_Z(i+1) <= Natavio_May_22_2022_Z(i) AND (NOT ((Natavio_May_22_2022_p1(i) XOR 
																											Natavio_May_22_2022_index(i))));
																												 
					Natavio_May_22_2022_p2(i) <= Natavio_May_22_2022_index(i) AND Natavio_May_22_2022_p1(i);
					Natavio_May_22_2022_index(i+1) <= ((Natavio_May_22_2022_A(i) AND Natavio_May_22_2022_p0(i)) OR
																	Natavio_May_22_2022_p2(i));
				END LOOP;
				
				IF (Natavio_May_22_2022_out = "00000000000000000000000000000000") THEN
					Natavio_May_22_2022_Z_flag <= '1';
				ELSE
					Natavio_May_22_2022_Z_flag <= '0';
				END IF;
				
		END PROCESS;
		
		Natavio_May_22_2022_COUT <= Natavio_May_22_2022_index(Natavio_May_22_2022_N);
		
		Natavio_May_22_2022_Zero <= Natavio_May_22_2022_Z_flag;
		
		Natavio_May_22_2022_Overflow <= (Natavio_May_22_2022_index(Natavio_May_22_2022_N) XOR 
													Natavio_May_22_2022_index(Natavio_May_22_2022_N-1));
		
		Natavio_May_22_2022_var(0) <= (Natavio_May_22_2022_A(Natavio_May_22_2022_N-1) OR 
												 (Natavio_May_22_2022_B(Natavio_May_22_2022_N-1) XOR Natavio_May_22_2022_OP));
												 
		Natavio_May_22_2022_var(1) <= (Natavio_May_22_2022_index(Natavio_May_22_2022_N) XOR 
												 Natavio_May_22_2022_index(Natavio_May_22_2022_N-1));
													
		Natavio_May_22_2022_var(2) <= (Natavio_May_22_2022_p1(Natavio_May_22_2022_N-1) XOR
												 Natavio_May_22_2022_index(Natavio_May_22_2022_N-1));
													
		Natavio_May_22_2022_Negative <= Natavio_May_22_2022_var(0) AND (Natavio_May_22_2022_var(1) XOR
																							 Natavio_May_22_2022_var(2));
END arch;

