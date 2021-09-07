Library ieee;
Use ieee.std_logic_1164.all;
entity DectoBi is
Port (D0,D1,D2,D3,D4,D5,D6,D7,D8,D9: IN STD_LOGIC;
		A : out std_logic_vector(3 downto 0));
		
end  ;

Architecture resol of DectoBi is
begin 
A(3)<=D8 or D9;
A(2)<=D4 or D5 or D6 or D7;
A(1)<=D2 or D3 or D6 or D7;
A(0)<=D1 or D3 or D5 or D7 or D9;
End Architecture;