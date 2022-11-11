----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 05:52:35 PM
-- Design Name: 
-- Module Name: topnotes6 - Behavioral
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

entity topnotes6 is
     Port (
     switch: in std_logic_vector(6 downto 0);
     
     clk: in std_logic;
     audioout6: out std_logic);
end topnotes6;

architecture Behavioral of topnotes6 is
    signal counter: integer:=0;
    signal temp: std_logic:='0'; 
           
begin


counterproc: process(clk, switch)
begin 
 
     if (rising_edge(clk)) then
            case switch is
                when "1000000" => -- Note a6  (freq=262)
                    if counter >=  56817 then
                      counter <= 0;
                      temp <= not temp; 
                    else 
                        counter <= counter +1;
                    end if;
                when "0100000" => -- Note b6(freq=294)
                    if counter >= 50606 then
                        counter <= 0;
                        temp <= not temp;
                   else 
                        counter <= counter +1;
                   end if;  
                when "0010000" =>-- Note c7 (freq=330)
                    if counter >=   47777 then
                        counter <= 0;
                        temp <= not temp;
                    else 
                    counter <= counter +1;
                    end if;
                    
               when "0001000" =>  -- Note d7 (freq=349)
                    if counter >= 42570 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
              when "0000100" =>  -- Note e7 (freq=392)
                    if counter >= 37921 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
              when "0000010" =>  -- Note f7 (freq=440)
                    if counter >= 35790 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
              when "0000001" =>  -- Note g7 (freq=494)
                    if counter >= 31886 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
              when others =>
                    counter <= 0;
                    temp <= '0';
           END CASE;
        end if;
end process counterproc; 
audioout6 <= temp;


        
    
end Behavioral;
