library ieee;
use ieee.std_logic_1164.all;

entity extra_logic is
    port (
        SWITCH_PINS : in  std_logic_vector(7 downto 0);
        LEDR0       : out std_logic
    );
end entity extra_logic;

architecture rtl of extra_logic is
    signal w : std_logic_vector(3 downto 0);
    signal y : std_logic_vector(3 downto 0);
begin
    w <= SWITCH_PINS(3 downto 0);
    y <= SWITCH_PINS(7 downto 4);

    LEDR0 <= (w(0) and y(0)) or
             (w(1) and y(1)) or
             (w(2) and y(2)) or
             (w(3) and y(3));

end architecture rtl;
