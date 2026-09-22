library ieee;
use ieee.std_logic_1164.all;

entity gate_and2 is
    port (
        a, b : in  std_logic;
        y    : out std_logic
    );
end entity gate_and2;

architecture rtl of gate_and2 is
begin
    y <= a and b;
end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity gate_or2 is
    port (
        a, b : in  std_logic;
        y    : out std_logic
    );
end entity gate_or2;

architecture rtl of gate_or2 is
begin
    y <= a or b;
end architecture rtl;


library ieee;
use ieee.std_logic_1164.all;

entity gate_xor2 is
    port (
        a, b : in  std_logic;
        y    : out std_logic
    );
end entity gate_xor2;

architecture rtl of gate_xor2 is
begin
    y <= a xor b;
end architecture rtl;
