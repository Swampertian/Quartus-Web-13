library ieee;
use ieee.std_logic_1164.all;

-- ============================================================
-- ITEM (c): Somador ripple-carry de 4 bits, construido a partir
-- de 4 full adders (item a) encadeados: o carry-out de um bit
-- vira o carry-in do proximo. Chama-se "ripple" (ondulacao)
-- porque o carry se propaga estagio a estagio.
--
--   x(0),y(0)          -> FA0 -> sum(0), carry(1)
--   x(1),y(1),carry(1) -> FA1 -> sum(1), carry(2)
--   x(2),y(2),carry(2) -> FA2 -> sum(2), carry(3)
--   x(3),y(3),carry(3) -> FA3 -> sum(3), carry(4)
--
-- overflow: x e y sao tratados como numeros SEM SINAL (unsigned)
-- de 4 bits. O resultado "real" da soma pode precisar de 5 bits;
-- se precisar, o 5o bit e exatamente o carry(4) que sai do ultimo
-- full adder. Ou seja: overflow = carry(4).
-- ============================================================
entity ripple_carry_adder4 is
    port (
        x, y     : in  std_logic_vector(3 downto 0);
        cin      : in  std_logic;
        sum      : out std_logic_vector(3 downto 0);
        overflow : out std_logic
    );
end entity ripple_carry_adder4;

architecture structural of ripple_carry_adder4 is
    -- carry(0) = carry-in do circuito; carry(4) = carry-out final
    signal carry : std_logic_vector(4 downto 0);
begin
    carry(0) <= cin;

    -- "generate" cria 4 copias do full_adder automaticamente,
    -- uma para cada bit (i = 0, 1, 2, 3), evitando copiar e colar
    -- a instanciacao 4 vezes na mao.
    fa_gen: for i in 0 to 3 generate
        fa_inst: entity work.full_adder
            port map (
                a    => x(i),
                b    => y(i),
                cin  => carry(i),
                s    => sum(i),
                cout => carry(i + 1)
            );
    end generate fa_gen;

    overflow <= carry(4);

end architecture structural;
