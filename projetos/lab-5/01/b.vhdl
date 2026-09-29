library ieee;
use ieee.std_logic_1164.all;

entity demo_setup is
    port (
        SW    : in  std_logic_vector(5 downto 0);
        LEDR0 : out std_logic;
        LEDR1 : out std_logic;
        LEDR2 : out std_logic;
        LEDR3 : out std_logic
    );
end entity demo_setup;

architecture rtl of demo_setup is
    signal rotated : std_logic_vector(3 downto 0);
begin
    shifter_inst: entity work.rotation_binary
        port map (
            WORD_IN     => SW(3 downto 0),
            ROTATION_IN => SW(5 downto 4),
            ROTATED_OUT => rotated
        );

    LEDR0 <= rotated(0);
    LEDR1 <= rotated(1);
    LEDR2 <= rotated(2);
    LEDR3 <= rotated(3);

end architecture rtl;
