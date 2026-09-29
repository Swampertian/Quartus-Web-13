library ieee;
use ieee.std_logic_1164.all;

-- ITEM (a): instancia o cla_adder_4bit na placa DE1.
--   SW(3 downto 0) = entrada A
--   SW(7 downto 4) = entrada B
--   SW(8)          = Cin
--   LEDR3..LEDR0   = soma S
--   LEDR4          = Cout
entity demo_setup is
    port (
        SW    : in  std_logic_vector(8 downto 0);
        LEDR0 : out std_logic;
        LEDR1 : out std_logic;
        LEDR2 : out std_logic;
        LEDR3 : out std_logic;
        LEDR4 : out std_logic
    );
end entity demo_setup;

architecture rtl of demo_setup is
    signal sum_result : std_logic_vector(3 downto 0);
    signal carry_out  : std_logic;
begin
    adder_inst: entity work.cla_adder_4bit
        port map (
            A    => SW(3 downto 0),
            B    => SW(7 downto 4),
            Cin  => SW(8),
            S    => sum_result,
            Cout => carry_out
        );

    LEDR0 <= sum_result(0);
    LEDR1 <= sum_result(1);
    LEDR2 <= sum_result(2);
    LEDR3 <= sum_result(3);
    LEDR4 <= carry_out;

end architecture rtl;
