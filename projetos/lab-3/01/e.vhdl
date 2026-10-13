library ieee;
use ieee.std_logic_1164.all;

-- ============================================================
-- ITEM (e): demo_setup com 5 estagios.
-- SW0..SW4 = S0..S4, LEDR0 = saida.
-- ============================================================
entity demo_setup is
    port (
        SWITCH_PINS : in  std_logic_vector(4 downto 0);
        LEDR0       : out std_logic
    );
end entity demo_setup;

architecture rtl of demo_setup is
begin
    chain_inst: entity work.xbar_chain
        generic map (N => 5)
        port map (
            SWITCH_PINS => SWITCH_PINS,
            LEDR0       => LEDR0
        );

end architecture rtl;
