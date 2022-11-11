----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2021 09:30:42 PM
-- Design Name: 
-- Module Name: notes_top - Behavioral
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

entity notes_top is
     Port (
     switch: in std_logic_vector(6 downto 0);
     
     clk: in std_logic;
     audioout3: out std_logic);
end notes_top;

architecture Behavioral of notes_top is
    signal counter: integer:=0;
    signal temp: std_logic:='0'; 
           
begin


counterproc: process(clk, switch)
begin 
 
     if (rising_edge(clk)) then
            case switch is
                when "1000000" => -- Note a3  (freq=262)
                    if counter >= 454544 then
                      counter <= 0;
                      temp <= not temp; 
                    else 
                        counter <= counter +1;
                    end if;
                when "0100000" => -- Note b3(freq=294)
                    if counter >= 404857 then
                        counter <= 0;
                        temp <= not temp;
                   else 
                        counter <= counter +1;
                   end if;  
                when "0010000" =>-- Note c4 (freq=330)
                    if counter >=   381679 then
                        counter <= 0;
                        temp <= not temp;
                    else 
                    counter <= counter +1;
                    end if;
                    
               when "0001000" =>  -- Note d4 (freq=349)
                    if counter >= 340136 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
              when "0000100" =>  -- Note e4 (freq=392)
                    if counter >= 303030 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
              when "0000010" =>  -- Note f4 (freq=440)
                    if counter >= 286533 THEN
                        counter <= 0;
                        temp <= not temp;
                    else 
                        counter <= counter +1;
                    end if;
              when "0000001" =>  -- Note g4 (freq=494)
                    if counter >= 255102 THEN
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
audioout3 <= temp;


        
    
end Behavioral;
