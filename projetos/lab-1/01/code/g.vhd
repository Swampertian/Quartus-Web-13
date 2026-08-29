library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port (
        SW0   : in  std_logic;
        SW1   : in  std_logic;
        SW2   : in  std_logic;
        SW3   : in  std_logic;
        SW4   : in  std_logic;

        LEDR1 : out std_logic
    );


end entity and_gate;

architecture rtl of and_gate is
begin
    LEDR1 <= (not SW0 and not SW1 and not SW2 and not SW3 and not SW4)
        or (not SW0 and not SW1 and not SW2 and SW3 and not SW4)
        or (not SW0 and not SW1 and SW2 and not SW3 and SW4)
        or (not SW0 and SW1 and not SW2 and not SW3 and not SW4)
        or (not SW0 and SW1 and SW2 and not SW3 and SW4)
        or (SW0 and not SW1 and not SW2 and SW3 and not SW4)
        or (SW0 and not SW1 and SW2 and not SW3 and SW4)
        or (SW0 and SW1 and not SW2 and not SW3 and not SW4)
        or (SW0 and SW1 and SW2 and not SW3 and SW4)
        or (SW0 and SW1 and SW2 and SW3 and SW4);
end architecture rtl;