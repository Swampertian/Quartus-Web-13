library ieee;
use ieee.std_logic_1164.all;

-- Testbench do item (b).
-- y vem "one-hot" (como sai do decodificador): f = w do canal ativo.
entity tb_extra_logic is
end entity tb_extra_logic;

architecture sim of tb_extra_logic is
    signal sw : std_logic_vector(7 downto 0); -- y3..y0 & w3..w0
    signal f  : std_logic;
begin
    uut: entity work.extra_logic
        port map (
            SWITCH_PINS => sw,
            LEDR0       => f
        );

    stim: process
    begin
        --      y3..y0  w3..w0
        sw <= "0000" & "1111"; wait for 10 ns; -- nenhum y ativo -> f = 0
        sw <= "0001" & "0001"; wait for 10 ns; -- canal 0, w0 = 1 -> f = 1
        sw <= "0001" & "1110"; wait for 10 ns; -- canal 0, w0 = 0 -> f = 0
        sw <= "0010" & "0010"; wait for 10 ns; -- canal 1, w1 = 1 -> f = 1
        sw <= "0010" & "1101"; wait for 10 ns; -- canal 1, w1 = 0 -> f = 0
        sw <= "0100" & "0100"; wait for 10 ns; -- canal 2, w2 = 1 -> f = 1
        sw <= "0100" & "1011"; wait for 10 ns; -- canal 2, w2 = 0 -> f = 0
        sw <= "1000" & "1000"; wait for 10 ns; -- canal 3, w3 = 1 -> f = 1
        sw <= "1000" & "0111"; wait for 10 ns; -- canal 3, w3 = 0 -> f = 0
        wait;
    end process;

end architecture sim;
