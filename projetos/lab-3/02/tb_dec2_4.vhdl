library ieee;
use ieee.std_logic_1164.all;

-- Testbench do item (a).
entity tb_dec2_4 is
end entity tb_dec2_4;

architecture sim of tb_dec2_4 is
    signal sw             : std_logic_vector(2 downto 0); -- En & w1 & w0
    signal y0, y1, y2, y3 : std_logic;
begin
    uut: entity work.dec2_4
        port map (
            SWITCH_PINS => sw,
            LEDR0       => y0,
            LEDR1       => y1,
            LEDR2       => y2,
            LEDR3       => y3
        );

    stim: process
    begin
        --      En w1 w0
        sw <= "000"; wait for 10 ns; -- desligado: y = 0000
        sw <= "001"; wait for 10 ns; -- desligado: y = 0000
        sw <= "010"; wait for 10 ns; -- desligado: y = 0000
        sw <= "011"; wait for 10 ns; -- desligado: y = 0000
        sw <= "100"; wait for 10 ns; -- y0 = 1
        sw <= "101"; wait for 10 ns; -- y1 = 1
        sw <= "110"; wait for 10 ns; -- y2 = 1
        sw <= "111"; wait for 10 ns; -- y3 = 1
        wait;
    end process;

end architecture sim;
