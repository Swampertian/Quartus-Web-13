library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_rotation_binary is
end entity tb_rotation_binary;

architecture sim of tb_rotation_binary is
    signal WORD_IN     : std_logic_vector(3 downto 0);
    signal ROTATION_IN : std_logic_vector(1 downto 0);
    signal ROTATED_OUT : std_logic_vector(3 downto 0);
begin
    uut: entity work.rotation_binary
        port map (
            WORD_IN     => WORD_IN,
            ROTATION_IN => ROTATION_IN,
            ROTATED_OUT => ROTATED_OUT
        );

    stim: process
    begin
        -- palavra fixa com bits distintos para visualizar a rotacao
        WORD_IN <= "1000";
        for s in 0 to 3 loop
            ROTATION_IN <= std_logic_vector(to_unsigned(s, 2));
            wait for 10 ns;
        end loop;

        WORD_IN <= "1011";
        for s in 0 to 3 loop
            ROTATION_IN <= std_logic_vector(to_unsigned(s, 2));
            wait for 10 ns;
        end loop;
        wait;
    end process;
end architecture sim;
