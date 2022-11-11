----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 05:58:57 PM
-- Design Name: 
-- Module Name: topnotes1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity topnotes1 is
     Port (
     switch: in std_logic_vector(6 downto 0);
    
     clk: in std_logic;
     audioout1: out std_logic);
end topnotes1;

architecture Behavioral of topnotes1 is
    signal counter: integer:=0;
    signal temp: std_logic:='0'; 
begin          

counterproc: process(clk, switch)

begin
    if (rising_edge(clk)) then
                case switch is
                    when "1000000" => -- Note a1  (freq=262)
                        if counter >= 1818181 then
                          counter <= 0;
                          temp <= not temp; 
                        else 
                            counter <= counter +1;
                        end if;
                    when "0100000" => -- Note b1(freq=294)
                        if counter >= 1612902 then
                            counter <= 0;
                            temp <= not temp;
                       else 
                            counter <= counter +1;
                       end if;  
                    when "0010000" =>-- Note c2 (freq=330)
                        if counter >=   1538460  then
                            counter <= 0;
                            temp <= not temp;
                        else 
                        counter <= counter +1;
                        end if;
                        
                    when "0001000" =>  -- Note d2 (freq=349)
                        if counter >= 1369862 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000100" =>  -- Note e2 (freq=392)
                        if counter >= 1219511 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000010" =>  -- Note f2 (freq=440)
                        if counter >= 1149424 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000001" =>  -- Note g2 (freq=494)
                        if counter >= 1020407 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                     when others =>
                        counter <= 0;
                        temp <= '0';
                end case;
        end if;
end process; 
audioout1<= temp;
end Behavioral;
