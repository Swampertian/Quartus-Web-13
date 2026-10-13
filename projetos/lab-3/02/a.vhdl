library ieee;
use ieee.std_logic_1164.all;


entity dec2_4 is
    port (
        SWITCH_PINS : in  std_logic_vector(2 downto 0);
        LEDR0       : out std_logic;
        LEDR1       : out std_logic;
        LEDR2       : out std_logic;
        LEDR3       : out std_logic
    );
end entity dec2_4;

architecture rtl of dec2_4 is
    signal y : std_logic_vector(3 downto 0); -- y3 y2 y1 y0
begin
    --                     En w1 w0
    with SWITCH_PINS select
        y <= "0001" when "100",
             "0010" when "101",
             "0100" when "110",
             "1000" when "111",
             "0000" when others; -- En = '0'

    LEDR0 <= y(0);
    LEDR1 <= y(1);
    LEDR2 <= y(2);
    LEDR3 <= y(3);

end architecture rtl;
