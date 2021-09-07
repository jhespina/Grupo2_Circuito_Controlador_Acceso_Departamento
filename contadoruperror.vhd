library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contadoruperror is
	port(Resetn, Clock, En, Ld	: in std_logic;
		Ent			: in std_logic_vector(3 downto 0);
		Q			: buffer std_logic_vector(3 downto 0));
end contadoruperror;

architecture comportamiento of contadoruperror is
begin
	process(Resetn, Clock)
	begin
		if Resetn='1' then Q<= "0000";
		elsif (Clock'event and Clock='1') then
			if En='1' then
				if Ld='1' then Q<= Ent;
				else Q<=Q+'1';
				end if;
			end if;
		end if;
	end process;
end comportamiento;