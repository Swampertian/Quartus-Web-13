library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
end entity tb_full_adder;

architecture sim of tb_full_adder is
    signal a, b, cin : std_logic;
    signal s, cout   : std_logic;
begin
    uut: entity work.full_adder
        port map (
            a    => a,
            b    => b,
            cin  => cin,
            s    => s,
            cout => cout
        );

    stim: process
    begin
        a <= '0'; b <= '0'; cin <= '0'; wait for 10 ns; -- 000
        a <= '0'; b <= '0'; cin <= '1'; wait for 10 ns; -- 001
        a <= '0'; b <= '1'; cin <= '0'; wait for 10 ns; -- 010
        a <= '0'; b <= '1'; cin <= '1'; wait for 10 ns; -- 011
        a <= '1'; b <= '0'; cin <= '0'; wait for 10 ns; -- 100
        a <= '1'; b <= '0'; cin <= '1'; wait for 10 ns; -- 101
        a <= '1'; b <= '1'; cin <= '0'; wait for 10 ns; -- 110
        a <= '1'; b <= '1'; cin <= '1'; wait for 10 ns; -- 111
        wait;
    end process;

end architecture sim;
