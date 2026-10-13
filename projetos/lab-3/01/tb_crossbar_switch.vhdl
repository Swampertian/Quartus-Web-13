library ieee;
use ieee.std_logic_1164.all;


architecture sim of tb_crossbar_switch is
    signal sw         : std_logic_vector(2 downto 0); -- S & x2 & x1
    signal y1, y2     : std_logic;
begin
    uut: entity work.crossbar_switch
        port map (
            SWITCH_PINS => sw,
            LEDR0       => y1,
            LEDR1       => y2
        );

    stim: process
    begin
        sw <= "000"; wait for 10 ns; -- direto: y1=0 y2=0
        sw <= "001"; wait for 10 ns; -- direto: y1=1 y2=0
        sw <= "010"; wait for 10 ns; -- direto: y1=0 y2=1
        sw <= "011"; wait for 10 ns; -- direto: y1=1 y2=1
        sw <= "100"; wait for 10 ns; -- cruza : y1=0 y2=0
        sw <= "101"; wait for 10 ns; -- cruza : y1=0 y2=1
        sw <= "110"; wait for 10 ns; -- cruza : y1=1 y2=0
        sw <= "111"; wait for 10 ns; -- cruza : y1=1 y2=1
        wait;
    end process;

end architecture sim;
