----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2021 11:29:40 PM
-- Design Name: 
-- Module Name: segmentdecoder - Behavioral
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

entity segmentdecoder is
    Port ( digit : in STD_LOGIC_VECTOR (3 downto 0);
           segmentA : out STD_LOGIC;
           segmentB : out STD_LOGIC;
           segmentC : out STD_LOGIC;
           segmentD : out STD_LOGIC;
           segmentE : out STD_LOGIC;
           segmentF : out STD_LOGIC;
           segmentG : out STD_LOGIC);
end segmentdecoder;

architecture Behavioral of segmentdecoder is

begin
process(digit)
        variable decoder_data: std_logic_vector(6 downto 0);
        
        
        begin
        case digit is
            when "0000" => decoder_data := "1001111";--1
            when "0001" => decoder_data := "0000001";--0
            when "0010" => decoder_data := "0100000";--6
            when "0011" => decoder_data := "0000110";--3
            when "0100" => decoder_data := "1001100";--4
            when "0101" => decoder_data := "0100100";--5
            when "0110" => decoder_data := "0100001";--G
            when "0111" => decoder_data := "0001111";--7
            when "1000" => decoder_data := "1111111";-- " "
            when "1001" => decoder_data := "0010010";--2
            when "1010" => decoder_data := "0001000";--A
            when "1011" => decoder_data := "1100000";--b
            when "1100" => decoder_data := "0110001";--C
            when "1101" => decoder_data := "1000010";--d
            when "1110" => decoder_data := "0110000";--E
            when "1111" => decoder_data := "0111000";--F
            when others => decoder_data := "1000001";
                end case;
            segmentA <=  decoder_data(0);
            segmentB <=  decoder_data(1);
            segmentc <=  decoder_data(2);
            segmentD <=  decoder_data(3);
            segmentE <=  decoder_data(4);
            segmentF <=  decoder_data(5);
            segmentG <=  decoder_data(6);
            end process;
end Behavioral;