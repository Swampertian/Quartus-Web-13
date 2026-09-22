library ieee;
use ieee.std_logic_1164.all;

-- ============================================================
-- ITEM (f): Somador ripple-carry de 32 bits.
-- Mesma ideia do ripple_carry_adder4.vhdl (item c), so que com
-- 32 full adders encadeados. overflow = carry(32).
-- ============================================================
entity adder32 is
    port (
        x, y     : in  std_logic_vector(31 downto 0);
        cin      : in  std_logic;
        sum      : out std_logic_vector(31 downto 0);
        overflow : out std_logic
    );
end entity adder32;

architecture structural of adder32 is
    signal carry : std_logic_vector(32 downto 0);
begin
    carry(0) <= cin;

    fa_gen: for i in 0 to 31 generate
        fa_inst: entity work.full_adder
            port map (
                a    => x(i),
                b    => y(i),
                cin  => carry(i),
                s    => sum(i),
                cout => carry(i + 1)
            );
    end generate fa_gen;

    overflow <= carry(32);

end architecture structural;
