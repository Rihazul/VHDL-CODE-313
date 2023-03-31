library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity registers_min_max is
port( din : in std_logic_vector(3 downto 0);
      reset : in std_logic;
      clk : in std_logic;
      sel: in std_logic_vector(1 downto 0);
      max_out : out std_logic_vector(3 downto 0);
      min_out : out std_logic_vector(3 downto 0);
      reg_out : out std_logic_vector(3 downto 0));
end registers_min_max ;



architecture behavioral of registers_min_max is



type registers_array is array(0 to 3) of std_logic_vector(3 downto 0);

signal max : std_logic_vector(3 downto 0); 
signal min : std_logic_vector(3 downto 0);
signal registers: registers_array;

begin

  process(din,clk,reset)
    begin
	if (reset='1') then
	  for i in 0 to 3 loop
	    registers(i)<="1000";
	  end loop;	
	elsif (rising_edge(clk)) then
	  registers(0)<=din;
	  for i in 1 to 3 loop		
	    registers(i)<= registers(i-1);
	  end loop;
	end if;
   end process;

 process(registers,sel)
  begin
     if (sel= "00") then
	reg_out<=registers(0);
     elsif (sel="01") then
	reg_out<=registers(1);
     elsif (sel="10") then
	reg_out<=registers(2);
     else
	reg_out<=registers(3);
     end if;
  end process;	 
 	
 process (registers,clk,reset)
  variable temp_max : std_logic_vector(3 downto 0);
  variable temp_min : std_logic_vector(3 downto 0);	
  begin
  temp_max:="0000";  
  temp_min:="1111";	
  if (reset= '1') then
   min<="1111";
   max<="0000";
  	 
 elsif (rising_edge(clk)) then	 
   for i in 0 to 3 loop
    if (registers(i)>temp_max ) then
      temp_max:=registers(i);      		
    end if;
   end loop;
   
   for i in 0 to 3 loop
    if(registers(i)<temp_min) then
 	temp_min:= registers(i);
    end if;
   end loop;

   max<=temp_max;	
   min<=temp_min;	
  
end if;
end process;

max_out<= max;
min_out<= min;

end behavioral; 	

