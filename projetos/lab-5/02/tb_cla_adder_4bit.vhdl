library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Testbench exaustivo: percorre as 512 combinacoes de A, B e Cin
-- e compara a saida do CLA com a soma calculada via numeric_std.
entity tb_cla_adder_4bit is
end entity tb_cla_adder_4bit;

architecture sim of tb_cla_adder_4bit is
    signal A, B : std_logic_vector(3 downto 0);
    signal Cin  : std_logic;
    signal S    : std_logic_vector(3 downto 0);
    signal Cout : std_logic;
begin
    uut: entity work.cla_adder_4bit
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            S    => S,
            Cout => Cout
        );

    stim: process
        variable expected : unsigned(4 downto 0);
        variable errors   : natural := 0;
    begin
        for c in 0 to 1 loop
            for a_val in 0 to 15 loop
                for b_val in 0 to 15 loop
                    A   <= std_logic_vector(to_unsigned(a_val, 4));
                    B   <= std_logic_vector(to_unsigned(b_val, 4));
                    if c = 1 then
                        Cin <= '1';
                    else
                        Cin <= '0';
                    end if;
                    wait for 10 ns;

                    expected := to_unsigned(a_val + b_val + c, 5);
                    if (Cout & S) /= std_logic_vector(expected) then
                        errors := errors + 1;
                        report "ERRO: A=" & integer'image(a_val)
                             & " B=" & integer'image(b_val)
                             & " Cin=" & integer'image(c)
                             severity error;
                    end if;
                end loop;
            end loop;
        end loop;

        report "Fim da simulacao: " & integer'image(errors) & " erro(s)"
            severity note;
        wait;
    end process;
end architecture sim;
