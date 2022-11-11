----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 06:09:55 PM
-- Design Name: 
-- Module Name: topnotes5 - Behavioral
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
entity topnotes5 is
     Port (
     switch: in std_logic_vector(6 downto 0);
    
     clk: in std_logic;
     audioout5: out std_logic);
end topnotes5;

architecture Behavioral of topnotes5 is
    signal counter: integer:=0;
    signal temp: std_logic:='0'; 
begin          

counterproc: process(clk, switch)

begin
    if (rising_edge(clk)) then
                case switch is
                    when "1000000" => -- Note a5  (freq=262)
                        if counter >= 113635 then
                          counter <= 0;
                          temp <= not temp; 
                        else 
                            counter <= counter +1;
                        end if;
                    when "0100000" => -- Note b5(freq=294)
                        if counter >= 101213 then
                            counter <= 0;
                            temp <= not temp;
                       else 
                            counter <= counter +1;
                       end if;  
                    when "0010000" =>-- Note c6 (freq=330)
                        if counter >=   95510  then
                            counter <= 0;
                            temp <= not temp;
                        else 
                        counter <= counter +1;
                        end if;
                        
                    when "0001000" =>  -- Note d6 (freq=349)
                        if counter >= 85105 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000100" =>  -- Note e6 (freq=392)
                        if counter >= 75814 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000010" =>  -- Note f6 (freq=440)
                        if counter >= 71581 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000001" =>  -- Note g6 (freq=494)
                        if counter >= 63774 THEN
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
audioout5<= temp;
end Behavioral;
