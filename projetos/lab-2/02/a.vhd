library ieee;
use ieee.std_logic_1164.all;

entity gray2bin is
    port (
        GRAY_IN : in  std_logic_vector(3 downto 0);
        BIN_OUT : out std_logic_vector(3 downto 0)
    );
end entity gray2bin;

architecture rtl of gray2bin is
begin
    BIN_OUT(3) <= GRAY_IN(3);
    BIN_OUT(2) <= GRAY_IN(2) xor GRAY_IN(3);
    BIN_OUT(1) <= GRAY_IN(1) xor GRAY_IN(2) xor GRAY_IN(3);
    BIN_OUT(0) <= GRAY_IN(0) xor GRAY_IN(1) xor GRAY_IN(2) xor GRAY_IN(3);

end architecture rtl;
