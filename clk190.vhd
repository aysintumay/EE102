----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 09:59:47 PM
-- Design Name: 
-- Module Name: clk190 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clkdiv is
 Port (mclk: in std_logic; 
        clr: in std_logic; 
       clk190: out std_logic);
       
end clkdiv;

architecture Behavioral of clkdiv is
signal q: std_logic_vector(23 downto 0);
begin
    process(mclk, clr)
    begin
        if clr='1' then
            q<= X"000000";
        elsif mclk'event and mclk='1' then
            q <= q+1;
        end if;
   end process;
   
   clk190 <= q(18);
   

end Behavioral;
