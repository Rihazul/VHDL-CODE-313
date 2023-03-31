library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity converter is
port(sig_mag :in std_logic_vector(3 downto 0);
     two_comp: out std_logic_vector(3 downto 0)
);
end converter;

architecture converter_arch of converter is
signal n_mag, mag: std_logic_vector (2 downto 0);
signal out_mag : std_logic_vector(3 downto 0);

begin

process(sig_mag, n_mag, mag)
begin

n_mag<= not sig_mag(2 downto 0);
mag<=n_mag + "001";
if(sig_mag(3)='0')then
out_mag<= sig_mag;

else
out_mag<=sig_mag(3)& mag;

end if;
end process;

two_comp<= out_mag; 

end converter_arch;
