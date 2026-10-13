library ieee;
use ieee.std_logic_1164.all;

-- ============================================================
-- ITEM (d): N xbars em cascata (GENERIC + GENERATE).
--
-- Entrada do 1o estagio: x1 = VCC ('1'), x2 = GND ('0').
-- Estagio i usa SWITCH_PINS(i) como bit de controle S_i.
-- Saida y1 do ultimo estagio vai para o LED (LEDR0).
--
-- Cada chave ligada troca as linhas de lugar. Logo o LED acende
-- quando o numero de chaves ligadas e PAR.
--
-- Usa o crossbar_switch do item (a): a.vhdl.
-- ============================================================
entity xbar_chain is
    generic (
        N : integer := 5
    );
    port (
        SWITCH_PINS : in  std_logic_vector(N-1 downto 0);
        LEDR0       : out std_logic
    );
end entity xbar_chain;

architecture structural of xbar_chain is
    -- top(i) / bot(i) = linhas de cima (y1) e de baixo (y2) na entrada do estagio i
    signal top : std_logic_vector(N downto 0);
    signal bot : std_logic_vector(N downto 0);
begin
    top(0) <= '1'; -- VCC
    bot(0) <= '0'; -- GND

    xbar_gen: for i in 0 to N-1 generate
        xbar_inst: entity work.crossbar_switch
            port map (
                SWITCH_PINS(0) => top(i),          -- x1
                SWITCH_PINS(1) => bot(i),          -- x2
                SWITCH_PINS(2) => SWITCH_PINS(i),  -- S_i
                LEDR0          => top(i + 1),      -- y1
                LEDR1          => bot(i + 1)       -- y2
            );
    end generate xbar_gen;

    LEDR0 <= top(N);

end architecture structural;
