library ieee;
use ieee.std_logic_1164.all;

-- ITEM (d): instancia o ripple_carry_adder4 (item c) na placa.
-- Ligacoes pedidas no enunciado:
--   - 8 toggle switches -> as duas entradas de 4 bits (x e y)
--   - resultado da soma -> display de 7 segmentos, em hexadecimal
--   - overflow          -> 1 LED
--
-- SW(3 downto 0) = entrada x
-- SW(7 downto 4) = entrada y
-- cin fixo em '0' (o enunciado nao pede carry-in externo aqui)
entity demo_setup is
    port (
        SW    : in  std_logic_vector(7 downto 0);
        HEX3  : out std_logic_vector(6 downto 0); -- mesmo display/pinos do lab-2/02
        LEDR0 : out std_logic
    );
end entity demo_setup;

architecture rtl of demo_setup is
    signal sum_result   : std_logic_vector(3 downto 0);
    signal overflow_bit : std_logic;
begin
    adder_inst: entity work.ripple_carry_adder4
        port map (
            x        => SW(3 downto 0),
            y        => SW(7 downto 4),
            cin      => '0',
            sum      => sum_result,
            overflow => overflow_bit
        );

    seg_inst: entity work.conv_7seg
        port map (
            HEX_IN  => sum_result,
            HEX_OUT => HEX3
        );

    LEDR0 <= overflow_bit;

end architecture rtl;
