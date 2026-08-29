library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_and_gate is
end entity tb_and_gate;

architecture sim of tb_and_gate is
    signal A, B, C, Y : std_logic;
begin
    uut: entity work.and_gate
        port map (
            A => A,
            B => B,
            C => C,
            Y => Y
        );

    stim: process
        variable v : std_logic_vector(2 downto 0);
    begin
        for i in 0 to 7 loop
            v := std_logic_vector(to_unsigned(i, 3));
            A <= v(2);
            B <= v(1);
            C <= v(0);
            wait for 10 ns;
        end loop;
        wait;
    end process;
end architecture sim;
