library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CompuertaOR10 is
    Port ( INA1 : in  STD_LOGIC_VECTOR(9 downto 0);    -- AND gate input
           OA   : out STD_LOGIC);    -- AND gate output
end CompuertaOR10;

architecture Behavioral of CompuertaOR10 is
begin
    OA <= (INA1(0) or INA1(1) or INA1(2) or INA1(3) or INA1(4) or INA1(5) or INA1(6) or INA1(7) or INA1(8) or INA1(9)); 
end Behavioral;