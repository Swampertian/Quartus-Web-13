library ieee;
use ieee.std_logic_1164.all;

entity demo_setup is
    port (
        SW    : in  std_logic_vector(3 downto 0);
        HEX3  : out std_logic_vector(6 downto 0)
    );
end entity demo_setup;

architecture rtl of demo_setup is
    signal bin_value : std_logic_vector(3 downto 0);
begin
    gray_inst: entity work.gray2bin
        port map (
            GRAY_IN => SW,
            BIN_OUT => bin_value
        );

    seg_inst: entity work.conv_7seg
        port map (
            HEX_IN  => bin_value,
            HEX_OUT => HEX3
        );

end architecture rtl;
