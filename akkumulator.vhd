library ieee;
use ieee.std_logic_1164.all

entity akkumulator is
  
    generic (N : integer:=8);
  
    port(rst: in std_logic;
        clk:  in std_logic;
        B:    in integer range 0 to N-1;
        A:    out integer range 0 to N-1);

end akkumulator;

archtecture behavior of akkumulator is
begin
    p1: process(rst, clk)
    
        variable ergebnis : integer range 0 to N-1;
    
    begin
    
        if (rst = '1') then
            ergebnis := 0;
        
        elsif (clk'event and clk='1') then
        
            if (ergebnis + B > N-1) then
                ergebnis := 0;
            else
                ergebnis := ergebnis + B;
            end if;
        
        end if;
        
        A <= ergebnis;
    
    end process;

end behavior;
