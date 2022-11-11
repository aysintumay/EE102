----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2021 11:29:01 PM
-- Design Name: 
-- Module Name: segmentdriver - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity segmentdriver is
    Port ( display_A : in STD_LOGIC_VECTOR (3 downto 0);
           display_B : in STD_LOGIC_VECTOR (3 downto 0);
           display_C : in STD_LOGIC_VECTOR (3 downto 0);
           display_D : in STD_LOGIC_VECTOR (3 downto 0);
           SegA : out STD_LOGIC;
           SegB : out STD_LOGIC;
           SegC : out STD_LOGIC;
           SegD : out STD_LOGIC;
           SegE : out STD_LOGIC;
           SegF : out STD_LOGIC;
           SegG : out STD_LOGIC;
           selectDisplayA : out STD_LOGIC;
           selectDisplayB : out STD_LOGIC;
           selectDisplayC : out STD_LOGIC;
           selectDisplayD : out STD_LOGIC;
           clk : in STD_LOGIC);
end segmentdriver;

 architecture Behavioral of segmentdriver is
    component segmentdecoder
    Port ( digit : in STD_LOGIC_VECTOR (3 downto 0);
           segmentA : out STD_LOGIC;
           segmentB : out STD_LOGIC;
           segmentC : out STD_LOGIC;
           segmentD : out STD_LOGIC;
           segmentE : out STD_LOGIC;
           segmentF : out STD_LOGIC;
           segmentG : out STD_LOGIC);
    end component;
    
    component segment_clkdiv
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           dataclk : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
signal tempdata: std_logic_vector(3 downto 0);
signal clock: std_logic_vector(15 downto 0);
signal slowclock: std_logic;

begin
            uut: segmentdecoder PORT MAP(
                    
                    digit => tempdata,
                    segmentA => SegA,
                    segmentB => SegB,
                    segmentC => SegC,
                    segmentD => SegD,
                    segmentE => SegE,
                    segmentF => SegF,
                    segmentG => SegG);
            
dut1: segment_clkdiv PORT MAP(
                    clk => clk,
                    enable => '1',
                    reset =>'0',
                    dataclk => clock);
slowclock <= clock(15);
PROCESS(slowclock)
    variable selectdisplay: STD_LOGIC_VECTOR (1 downto 0);
    Begin
    if slowclock'event and slowclock = '1' then
    case selectdisplay is
        when "00" => tempdata <= display_A;
            selectDisplayA <= '0';
            selectDisplayB <= '1';
            selectDisplayC <= '1';
            selectDisplayD <= '1';
            
            selectdisplay := selectdisplay +'1';
        when "01" => tempdata <= display_B;
            selectDisplayA <= '1';
            selectDisplayB <= '0';
            selectDisplayC <= '1';
            selectDisplayD <= '1';
            
            selectdisplay := selectdisplay +'1';
        when "10" => tempdata <= display_C;
            selectDisplayA <= '1';
            selectDisplayB <= '1';
            selectDisplayC <= '0';
            selectDisplayD <= '1';
            selectdisplay := selectdisplay +'1';
            
        when others => tempdata <= display_D;
            selectDisplayA <= '1';
            selectDisplayB <= '1';
            selectDisplayC <= '1';
            selectDisplayD <= '0';
            selectdisplay := selectdisplay +'1';
        
        end case;
end if;
end process;
                                           
end Behavioral;
