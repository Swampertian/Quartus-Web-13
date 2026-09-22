library ieee;
use ieee.std_logic_1164.all;

-- ============================================================
-- ITEM (g): Somador ripple-carry de 64 bits.
-- Mesma ideia do ripple_carry_adder4.vhdl (item c), so que com
-- 64 full adders encadeados. overflow = carry(64).
entity adder64 is
    port (
        x, y     : in  std_logic_vector(63 downto 0);
        cin      : in  std_logic;
        sum      : out std_logic_vector(63 downto 0);
        overflow : out std_logic
    );
end entity adder64;

architecture structural of adder64 is
    signal carry : std_logic_vector(64 downto 0);
begin
    carry(0) <= cin;

    fa_gen: for i in 0 to 63 generate
        fa_inst: entity work.full_adder
            port map (
                a    => x(i),
                b    => y(i),
                cin  => carry(i),
                s    => sum(i),
                cout => carry(i + 1)
            );
    end generate fa_gen;

    overflow <= carry(64);

end architecture structural;
