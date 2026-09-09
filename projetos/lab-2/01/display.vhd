library ieee;
use ieee.std_logic_1164.all;

entity display is
    port (
        SWITCH_PINS: in std_logic_vector(6 downto 0);
        HEX_PINS: out std_logic_vector(6 downto 0)
    );
end entity display;

architecture rtl of display is
begin
    with SWITCH_PINS select
        HEX_PINS <= "1000000" when "0000000", -- 0
                    "1111001" when "0000001", -- 1
                    "0100100" when "0000010", -- 2
                    "0110000" when "0000011", -- 3
                    "0011001" when "0000100", -- 4
                    "0010010" when "0000101", -- 5
                    "0000010" when "0000110", -- 6
                    "1111000" when "0000111", -- 7
                    "0000000" when "0001000", -- 8
                    "0010000" when "0001001", -- 9
                    "0000110" when others;    -- E (fora da faixa 0-9)

end architecture rtl;
