library ieee;
use ieee.std_logic_1164.all;

-- ============================================================
-- ITEM (f): demo_setup com 8 estagios.
-- Igual ao item (e), so muda o N (e o tamanho do vetor).
-- SW0..SW7 = S0..S7, LEDR0 = saida.
-- ============================================================
entity demo_setup is
    port (
        SWITCH_PINS : in  std_logic_vector(7 downto 0);
        LEDR0       : out std_logic
    );
end entity demo_setup;

architecture rtl of demo_setup is
begin
    chain_inst: entity work.xbar_chain
        generic map (N => 8)
        port map (
            SWITCH_PINS => SWITCH_PINS,
            LEDR0       => LEDR0
        );

end architecture rtl;
