library ieee;
use ieee.std_logic_1164.all;

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
