
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity letraP is
 port( habilitador: in std_logic;
  display: out std_logic_vector(6 downto 0));
end letraP;

architecture decodificador of letraP is
signal s: std_logic_vector(6 downto 0);
begin
s<= "1100111";

display <=s when (habilitador='1') else "0000000";
end decodificador;