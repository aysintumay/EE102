----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 04:47:03 PM
-- Design Name: 
-- Module Name: topnotes3 - Behavioral
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

entity topnotes3 is
 Port (
     switch: in std_logic_vector(6 downto 0);
     
     clk: in std_logic;
     audioout2: out std_logic);
end topnotes3;

architecture Behavioral of topnotes3 is
 signal counter: integer:=0;
 signal temp: std_logic:='0'; 
begin

counterproc: process(clk, switch)
begin
if (rising_edge(clk)) then
              case switch is
                 when "1000000" => -- Note a2  (freq=262)
                    if counter >=  909090  then
                      counter <= 0;
                      temp <= not temp; 
                    else 
                        counter <= counter +1;
                    end if;
                 when "0100000" => -- Note b2(freq=294)
                    if counter >= 813007  then
                        counter <= 0;
                        temp <= not temp;
                   else 
                        counter <= counter +1;
                   end if;  
                  when "0010000" =>-- Note c3 (freq=330)
                    if counter >=   763357 then
                        counter <= 0;
                        temp <= not temp;
                    else 
                    counter <= counter +1;
                    end if;
                    
                 when "0001000" =>  -- Note d3 (freq=349)
                    if counter >= 680271 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
                 when "0000100" =>  -- Note e3 (freq=392)
                    if counter >= 606059 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
                 when "0000010" =>  -- Note f3 (freq=440)
                    if counter >= 571427 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
                 when "0000001" =>  -- Note g3 (freq=494)
                    if counter >=  505049 THEN
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
end process;
audioout2<= temp;
     
            

end Behavioral;
