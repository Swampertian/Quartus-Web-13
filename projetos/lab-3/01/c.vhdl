library ieee;
use ieee.std_logic_1164.all;

-- ============================================================
-- ITEM (c): mesmo crossbar switch, agora com PROCESS.
--
-- SWITCH_PINS(0) = x1
-- SWITCH_PINS(1) = x2
-- SWITCH_PINS(2) = S  (bit de controle)
-- LEDR0          = y1
-- LEDR1          = y2
--
-- S = '0' -> passa direto : y1 = x1, y2 = x2
-- S = '1' -> cruza        : y1 = x2, y2 = x1
-- ============================================================
entity crossbar_switch is
    port (
        SWITCH_PINS : in  std_logic_vector(2 downto 0);
        LEDR0       : out std_logic;
        LEDR1       : out std_logic
    );
end entity crossbar_switch;

architecture rtl of crossbar_switch is
begin
    -- Lista de sensibilidade com todas as entradas: circuito combinacional.
    process (SWITCH_PINS)
    begin
        if SWITCH_PINS(2) = '0' then
            LEDR0 <= SWITCH_PINS(0);
            LEDR1 <= SWITCH_PINS(1);
        else
            LEDR0 <= SWITCH_PINS(1);
            LEDR1 <= SWITCH_PINS(0);
        end if;
    end process;

end architecture rtl;
