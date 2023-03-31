library ieee;
use ieee.std_logic_1164.all;

entity or_1 is
port(input_1,input_2,input_3 : in std_logic;
     output_1: out std_logic);
end;

architecture orgate of or_1 is

begin
output_1 <=input_1 or input_2 or input_3;

end;
