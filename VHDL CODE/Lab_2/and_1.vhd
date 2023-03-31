library ieee;
use ieee.std_logic_1164.all;

entity and_1 is
port(input_1,input_2,input_3 :in std_logic;
     output_1 : out std_logic);
end;

architecture andgate of and_1 is

begin
output_1<=input_1 and input_2 and input_3;
 
end;
