----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2021 05:42:20 PM
-- Design Name: 
-- Module Name: topnotes7 - Behavioral
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

entity topnotes7 is
     Port (
     switch: in std_logic_vector(6 downto 0);
     
     clk: in std_logic;
     audioout7: out std_logic);
end topnotes7;

architecture Behavioral of topnotes7 is
    signal counter: integer:=0;
    signal temp: std_logic:='0'; 
           
begin


counterproc: process(clk, switch)
begin 
 
     if (rising_edge(clk)) then
            case switch is
                when "1000000" => -- Note a7  (freq=262)
                    if counter >= 28408  then
                      counter <= 0;
                      temp <= not temp; 
                    else 
                        counter <= counter +1;
                    end if;
                when "0100000" => -- Note b7(freq=294)
                    if counter >= 25309 then
                        counter <= 0;
                        temp <= not temp;
                   else 
                        counter <= counter +1;
                   end if;  
                when "0010000" =>-- Note c4 (freq=330)
                    if counter >=   23888 then
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
audioout7 <= temp;


        
    
end Behavioral;

