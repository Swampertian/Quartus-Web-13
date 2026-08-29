library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port (
        SW0   : in  std_logic;
        SW1   : in  std_logic;
        LEDR1 : out std_logic;
        LEDR0 : out std_logic
    );
end entity and_gate;

architecture rtl of and_gate is
begin
    LEDR1<= SW0 and SW1;
    LEDR0<= SW0 and SW1;
end architecture rtl;
