----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 05:55:42 PM
-- Design Name: 
-- Module Name: topnotes0 - Behavioral
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
entity topnotes0 is
     Port (
     switch: in std_logic_vector(6 downto 0);
    
     clk: in std_logic;
     audioout0: out std_logic);
end topnotes0;

architecture Behavioral of topnotes0 is
    signal counter: integer:=0;
    signal temp: std_logic:='0'; 
begin          

counterproc: process(clk, switch)

begin
    if (rising_edge(clk)) then
                case switch is
                    when "1000000" => -- Note a0  (freq=262)
                        if counter >= 3636363 then
                          counter <= 0;
                          temp <= not temp; 
                        else 
                            counter <= counter +1;
                        end if;
                    when "0100000" => -- Note b0(freq=294)
                        if counter >= 3236245 then
                            counter <= 0;
                            temp <= not temp;
                       else 
                            counter <= counter +1;
                       end if;  
                    when "0010000" =>-- Note c1 (freq=330)
                        if counter >=   3030302  then
                            counter <= 0;
                            temp <= not temp;
                        else 
                        counter <= counter +1;
                        end if;
                        
                    when "0001000" =>  -- Note d1 (freq=349)
                        if counter >= 2702702 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000100" =>  -- Note e1 (freq=392)
                        if counter >= 2439023 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000010" =>  -- Note f1 (freq=440)
                        if counter >= 2272726 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000001" =>  -- Note g1 (freq=494)
                        if counter >= 2040815 THEN
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
audioout0<= temp;
end Behavioral;
