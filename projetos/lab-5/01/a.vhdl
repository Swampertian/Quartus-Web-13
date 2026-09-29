library ieee;
use ieee.std_logic_1164.all;

entity rotation_binary is
    port (
        WORD_IN     : in  std_logic_vector(3 downto 0);
        ROTATION_IN : in  std_logic_vector(1 downto 0);
        ROTATED_OUT : out std_logic_vector(3 downto 0)
    );
end entity rotation_binary;

architecture rtl of rotation_binary is
begin
    with ROTATION_IN select
        ROTATED_OUT(0) <= WORD_IN(0) when "00",
                          WORD_IN(1) when "01",
                          WORD_IN(2) when "10",
                          WORD_IN(3) when others;

    with ROTATION_IN select
        ROTATED_OUT(1) <= WORD_IN(1) when "00",
                          WORD_IN(2) when "01",
                          WORD_IN(3) when "10",
                          WORD_IN(0) when others;

    with ROTATION_IN select
        ROTATED_OUT(2) <= WORD_IN(2) when "00",
                          WORD_IN(3) when "01",
                          WORD_IN(0) when "10",
                          WORD_IN(1) when others;

    with ROTATION_IN select
        ROTATED_OUT(3) <= WORD_IN(3) when "00",
                          WORD_IN(0) when "01",
                          WORD_IN(1) when "10",
                          WORD_IN(2) when others;
end architecture rtl;
