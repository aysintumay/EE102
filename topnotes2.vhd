----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 04:43:26 PM
-- Design Name: 
-- Module Name: topnotes2 - Behavioral
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
entity topnotes2 is
     Port (
     switch: in std_logic_vector(6 downto 0);
    
     clk: in std_logic;
     audioout4: out std_logic);
end topnotes2;

architecture Behavioral of topnotes2 is
    signal counter: integer:=0;
    signal temp: std_logic:='0'; 
begin          

counterproc: process(clk, switch)

begin
    if (rising_edge(clk)) then
                case switch is
                    when "1000000" => -- Note a4  (freq=262)
                        if counter >= 227271 then
                          counter <= 0;
                          temp <= not temp; 
                        else 
                            counter <= counter +1;
                        end if;
                    when "0100000" => -- Note b4(freq=294)
                        if counter >= 202429 then
                            counter <= 0;
                            temp <= not temp;
                       else 
                            counter <= counter +1;
                       end if;  
                    when "0010000" =>-- Note c5 (freq=330)
                        if counter >=   191203  then
                            counter <= 0;
                            temp <= not temp;
                        else 
                        counter <= counter +1;
                        end if;
                        
                    when "0001000" =>  -- Note d5 (freq=349)
                        if counter >= 170357 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000100" =>  -- Note e5 (freq=392)
                        if counter >= 151744 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000010" =>  -- Note f5 (freq=440)
                        if counter >= 143265 THEN
                            counter <= 0;
                            temp <= not temp;
                        else 
                            counter <= counter +1;
                        end if;
                    when "0000001" =>  -- Note g5 (freq=494)
                        if counter >= 127550 THEN
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
audioout4<= temp;
end Behavioral;
