library ieee;
use ieee.std_logic_1164.all;

entity cla_adder_8bit_with_4bit is
    port (
        A           : in  std_logic_vector(7 downto 0);
        B           : in  std_logic_vector(7 downto 0);
        Cin         : in  std_logic;
        S           : out std_logic_vector(7 downto 0);
        Cout_half_1 : out std_logic;
        Cout_half_2 : out std_logic
    );
end entity cla_adder_8bit_with_4bit;

architecture rtl of cla_adder_8bit_with_4bit is
    signal G : std_logic_vector(7 downto 0);
    signal P : std_logic_vector(7 downto 0);
    signal C : std_logic_vector(8 downto 0);
begin
    gp_low: for i in 0 to 3 generate
        G(i) <= A(i) and B(i);
        P(i) <= A(i) xor B(i);
    end generate gp_low;

    C(0) <= Cin;

    C(1) <= G(0) or (P(0) and C(0));

    C(2) <= G(1)
        or (P(1) and G(0))
        or (P(1) and P(0) and C(0));

    C(3) <= G(2)
        or (P(2) and G(1))
        or (P(2) and P(1) and G(0))
        or (P(2) and P(1) and P(0) and C(0));

    C(4) <= G(3)
        or (P(3) and G(2))
        or (P(3) and P(2) and G(1))
        or (P(3) and P(2) and P(1) and G(0))
        or (P(3) and P(2) and P(1) and P(0) and C(0));

    sum_low: for i in 0 to 3 generate
        S(i) <= P(i) xor C(i);
    end generate sum_low;

    Cout_half_1 <= C(4);

    gp_high: for i in 4 to 7 generate
        G(i) <= A(i) and B(i);
        P(i) <= A(i) xor B(i);
    end generate gp_high;

    C(5) <= G(4) or (P(4) and C(4));

    C(6) <= G(5)
        or (P(5) and G(4))
        or (P(5) and P(4) and C(4));

    C(7) <= G(6)
        or (P(6) and G(5))
        or (P(6) and P(5) and G(4))
        or (P(6) and P(5) and P(4) and C(4));

    C(8) <= G(7)
        or (P(7) and G(6))
        or (P(7) and P(6) and G(5))
        or (P(7) and P(6) and P(5) and G(4))
        or (P(7) and P(6) and P(5) and P(4) and C(4));

    sum_high: for i in 4 to 7 generate
        S(i) <= P(i) xor C(i);
    end generate sum_high;

    Cout_half_2 <= C(8);
end architecture rtl;
