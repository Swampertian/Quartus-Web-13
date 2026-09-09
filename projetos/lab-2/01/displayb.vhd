library ieee;
use ieee.std_logic_1164.all;

entity displayb is
    port (
        SWITCH_PINS: in std_logic_vector(3 downto 0);
        HEX_PINS: out std_logic_vector(6 downto 0)
    );
end entity displayb;

architecture rtl of displayb is
begin
    conv_inst: entity work.conv_7seg
        port map (
            HEX_IN  => SWITCH_PINS,
            HEX_OUT => HEX_PINS
        );

end architecture rtl;
