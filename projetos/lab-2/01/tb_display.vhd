library ieee;
use ieee.std_logic_1164.all;

entity tb_display is
end entity tb_display;

architecture sim of tb_display is
    signal SW0, SW1, LEDR1, LEDR0: std_logic;
begin
    uut: entity work.display
        port map (
            SW0   => SW0,
            SW1   => SW1,
            LEDR1 => LEDR1,
            LEDR0 => LEDR0
        );

    stim: process
    begin
        SW0 <= '0'; SW1 <= '0'; wait for 5 ns;
        SW0 <= '0'; SW1 <= '1'; wait for 5 ns;
        SW0 <= '1'; SW1 <= '0'; wait for 5 ns;
        SW0 <= '1'; SW1 <= '1'; wait for 5 ns;
        SW0 <= '0'; SW1 <= '0'; wait for 5 ns;
        wait;
    end process;
end architecture sim;
