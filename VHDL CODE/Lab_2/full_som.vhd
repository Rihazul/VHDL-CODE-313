library IEEE;
use IEEE.std_logic_1164.all;

entity full_som is
port(a,b,c :in std_logic;
     output : out std_logic);
end full_som;

architecture behavioral of full_som is

component and_1
port(input_1,input_2,input_3 : in std_logic;
    output_1 : out std_logic);
end component; 

component or_1
port(input_1,input_2,input_3 : in std_logic;
     output_1 : out std_logic);
end component;



signal out_1, out_2, out_3 : std_logic;
signal in_1, in_2, in_3 : std_logic; 


for and1, and2, and3 : and_1 use entity WORK.and_1(andgate);
for or1 : or_1 use entity WORK.or_1(orgate);

begin

in_1<= not a;
in_2<= not b;

and1: and_1 port map(input_1 => in_1, input_2 => in_2,input_3 => c,
                    output_1 =>out_1);
and2: and_1 port map(input_1 => in_1, input_2=> b, input_3 => c,
                     output_1 => out_2);
and3: and_1 port map(input_1 => a, input_2 => b,input_3 => c,
                    output_1 =>out_3);
or1 : or_1 port map(input_1=>out_1, input_2 =>out_2, input_3 =>out_3,
                    output_1 => output);


end behavioral;
