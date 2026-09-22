library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ITEM 2(a): mostra em decimal (sinal-magnitude) um numero de 4 bits
-- em complemento de 2. Se negativo, complementa (inverte + 1) para
-- obter a magnitude e acende o LED de sinal.
entity display_signed is
    port (
        VALUE_IN : in  std_logic_vector(3 downto 0); -- complemento de 2
        HEX_OUT  : out std_logic_vector(6 downto 0); -- digito decimal (magnitude)
        SIGN_LED : out std_logic                     -- '1' = negativo
    );
end entity display_signed;

architecture rtl of display_signed is
    signal magnitude : unsigned(3 downto 0);
begin
    process (VALUE_IN)
    begin
        if VALUE_IN(3) = '1' then
            magnitude <= unsigned(not VALUE_IN) + 1;
            SIGN_LED  <= '1';
        else
            magnitude <= unsigned(VALUE_IN);
            SIGN_LED  <= '0';
        end if;
    end process;

    with std_logic_vector(magnitude) select
        HEX_OUT <= "1000000" when "0000", -- 0
                    "1111001" when "0001", -- 1
                    "0100100" when "0010", -- 2
                    "0110000" when "0011", -- 3
                    "0011001" when "0100", -- 4
                    "0010010" when "0101", -- 5
                    "0000010" when "0110", -- 6
                    "1111000" when "0111", -- 7
                    "0000000" when "1000", -- 8
                    "1111111" when others;

end architecture rtl;
