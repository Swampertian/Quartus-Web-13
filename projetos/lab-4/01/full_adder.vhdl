library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        a, b, cin : in  std_logic;
        s, cout   : out std_logic
    );
end entity full_adder;

architecture structural of full_adder is
    signal a_xor_b   : std_logic;
    signal a_and_b   : std_logic;
    signal cin_and_x : std_logic;
begin
    xor_ab: entity work.gate_xor2
        port map (a => a, b => b, y => a_xor_b);

    and_ab: entity work.gate_and2
        port map (a => a, b => b, y => a_and_b);

    xor_final: entity work.gate_xor2
        port map (a => a_xor_b, b => cin, y => s);

    and_cin: entity work.gate_and2
        port map (a => cin, b => a_xor_b, y => cin_and_x);

    or_carry: entity work.gate_or2
        port map (a => a_and_b, b => cin_and_x, y => cout);

end architecture structural;
