library ieee;
use ieee.std_logic_1164.all;

-- ============================================================
-- ITEM (e): Somador ripple-carry de 8 bits.
-- Mesma ideia do ripple_carry_adder4.vhdl (item c), so que com
-- 8 full adders encadeados em vez de 4. overflow = carry(8).
-- ============================================================
entity adder8 is
    port (
        x, y     : in  std_logic_vector(7 downto 0);
        cin      : in  std_logic;
        sum      : out std_logic_vector(7 downto 0);
        overflow : out std_logic
    );
end entity adder8;

architecture structural of adder8 is
    signal carry : std_logic_vector(8 downto 0);
begin
    carry(0) <= cin;

    fa_gen: for i in 0 to 7 generate
        fa_inst: entity work.full_adder
            port map (
                a    => x(i),
                b    => y(i),
                cin  => carry(i),
                s    => sum(i),
                cout => carry(i + 1)
            );
    end generate fa_gen;

    overflow <= carry(8);

end architecture structural;
