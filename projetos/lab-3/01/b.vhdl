library ieee;
use ieee.std_logic_1164.all;

entity crossbar_switch is
    port (
        SWITCH_PINS : in  std_logic_vector(2 downto 0);
        LEDR0       : out std_logic;
        LEDR1       : out std_logic
    );
end entity crossbar_switch;

architecture rtl of crossbar_switch is
begin
    LEDR0 <= SWITCH_PINS(0) when SWITCH_PINS(2) = '0' else SWITCH_PINS(1);
    LEDR1 <= SWITCH_PINS(1) when SWITCH_PINS(2) = '0' else SWITCH_PINS(0);

end architecture rtl;
