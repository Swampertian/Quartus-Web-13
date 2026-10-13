library ieee;
use ieee.std_logic_1164.all;

entity tb_xbar_chain is
end entity tb_xbar_chain;

architecture sim of tb_xbar_chain is
    signal sw  : std_logic_vector(4 downto 0);
    signal led : std_logic;
begin
    uut: entity work.xbar_chain
        generic map (N => 5)
        port map (
            SWITCH_PINS => sw,
            LEDR0       => led
        );

    stim: process
    begin
        sw <= "00000"; wait for 10 ns; -- 0 ligadas -> LED=1
        sw <= "00001"; wait for 10 ns; -- 1 ligada  -> LED=0
        sw <= "00011"; wait for 10 ns; -- 2 ligadas -> LED=1
        sw <= "10101"; wait for 10 ns; -- 3 ligadas -> LED=0
        sw <= "11110"; wait for 10 ns; -- 4 ligadas -> LED=1
        sw <= "11111"; wait for 10 ns; -- 5 ligadas -> LED=0
        wait;
    end process;

end architecture sim;
