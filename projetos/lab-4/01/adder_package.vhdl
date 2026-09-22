library ieee;
use ieee.std_logic_1164.all;

-- ============================================================
-- ITEM (h): Pacote "adder_package".
--
-- Um pacote VHDL nao "contem" as entities em si (elas continuam
-- sendo arquivos/unidades compiladas separadas: full_adder.vhdl,
-- ripple_carry_adder4.vhdl, etc). O que o pacote guarda sao as
-- "assinaturas" (component declarations) desses circuitos, pra
-- quem for usar so precisar de UM `use work.adder_package.all;`
-- em vez de redeclarar a interface toda vez.
--
-- Isso e usado, por exemplo, na questao 2(b): a ALU usa o somador
-- de 4 bits "do pacote adder_package", entao ela faz:
--
--   use work.adder_package.all;
--   ...
--   fa: ripple_carry_adder4 port map (...);   -- instanciacao via component
--
-- em vez de "entity work.ripple_carry_adder4 port map (...)".
-- Os dois jeitos funcionam; o pacote so deixa reutilizacao mais
-- organizada quando varios projetos usam os mesmos circuitos.
-- ============================================================
package adder_package is

    -- full adder de 1 bit (item a)
    component full_adder is
        port (
            a, b, cin : in  std_logic;
            s, cout   : out std_logic
        );
    end component full_adder;

    -- ripple-carry de 4 bits (item c)
    component ripple_carry_adder4 is
        port (
            x, y     : in  std_logic_vector(3 downto 0);
            cin      : in  std_logic;
            sum      : out std_logic_vector(3 downto 0);
            overflow : out std_logic
        );
    end component ripple_carry_adder4;

    -- ripple-carry de 8, 32 e 64 bits (itens e, f, g)
    component adder8 is
        port (
            x, y     : in  std_logic_vector(7 downto 0);
            cin      : in  std_logic;
            sum      : out std_logic_vector(7 downto 0);
            overflow : out std_logic
        );
    end component adder8;

    component adder32 is
        port (
            x, y     : in  std_logic_vector(31 downto 0);
            cin      : in  std_logic;
            sum      : out std_logic_vector(31 downto 0);
            overflow : out std_logic
        );
    end component adder32;

    component adder64 is
        port (
            x, y     : in  std_logic_vector(63 downto 0);
            cin      : in  std_logic;
            sum      : out std_logic_vector(63 downto 0);
            overflow : out std_logic
        );
    end component adder64;

end package adder_package;
