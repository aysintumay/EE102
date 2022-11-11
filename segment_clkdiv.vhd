----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2021 11:29:23 PM
-- Design Name: 
-- Module Name: segment_clkdiv - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segment_clkdiv is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           dataclk : out STD_LOGIC_VECTOR (15 downto 0));
end segment_clkdiv;

architecture Behavioral of segment_clkdiv is

begin
        process(clk,reset)
        variable count: STD_LOGIC_VECTOR(15 downto 0):=(others => '0');
        begin
    
        if reset ='1' then
            count := (others => '0');
        elsif enable='1' and clk'event and clk='1' then
            count := count+1;
        end if;
        dataclk <= count;
        end process;


end Behavioral;