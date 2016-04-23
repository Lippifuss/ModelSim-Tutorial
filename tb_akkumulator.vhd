library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test is
end test;

architecture bench of test is

component akkumulator

  generic (N : integer:=8);
  port(rst: in std_logic;
      clk:  in std_logic;
      B :   in integer range 0 to N-1;
      A :   out integer range 0 to N-1;

end component;

constant MAX : integer:=16;
signal rst, clk : std_logic :='0';
signal A, B : integer range 0 to MAX-1;

begin

  DUT:akkumulator generic map(MAX)
                  port map(rst, clk, B, A);
  
  rst <= '1','0' after 70 ns;
  
  process
  begin
    wait for 50 ns;
    clk <= not clk;
  end process;
  
  B <= 0 after 0 ns, 1 after 100 ns, 2 after 200 ns, 3 after 300 ns, 4 after 400 ns, 5 after 500 ns;

end bench;
