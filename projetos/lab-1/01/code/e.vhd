library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port (
        A   : in  std_logic;
        B   : in  std_logic;
        C   : in std_logic;
        D   : in std_logic;
        E   : in std_logic;

        F   : out std_logic
    );
end entity and_gate;

architecture rtl of and_gate is
begin
    F <= (not A and not B and not C and not D and not E)  
        or (not A and not B and not C and D and not E)  
        or (not A and not B and C and not D and E)  
        or (not A and B and not C and not D and not E)  
        or (not A and B and C and not D and E)  
        or (A and not B and not C and D and not E)  
        or (A and not B and C and not D and E)  
        or (A and B and not C and not D and not E)  
        or (A and B and C and not D and E)  
        or (A and B and C and D and E); 
end architecture rtl;
