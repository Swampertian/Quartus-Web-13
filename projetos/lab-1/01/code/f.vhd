library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_and_gate is
end entity tb_and_gate;

architecture sim of tb_and_gate is
    signal A, B, C, D, E, F : std_logic;
begin
    uut: entity work.and_gate
        port map (
            A => A,
            B => B,
            C => C,
            D => D,
            E => E,
            F => F
        );

    stim: process
        variable v : std_logic_vector(4 downto 0);
    begin
        for i in 0 to 31 loop
            v := std_logic_vector(to_unsigned(i, 5));
            A <= v(4);
            B <= v(3);
            C <= v(2);
            D <= v(1);
            E <= v(0);
            wait for 10 ns;
        end loop;
        wait;
    end process;
end architecture sim;
