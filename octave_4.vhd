----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2021 09:31:11 PM
-- Design Name: 
-- Module Name: octave_4 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity octave_4 is
 Port (clk_100mhz: in STD_LOGIC;
 a4: out STD_LOGIC;
 b4: out STD_LOGIC;
 c4: out STD_LOGIC;
 d4: out STD_LOGIC;
 e4: out STD_LOGIC;

 f4: out STD_LOGIC;
 g4: out STD_LOGIC );
end octave_4;
architecture Behavioral of octave_4 is
signal Counter440: integer:= 0; -- for note a4
signal Counter494: integer:= 0; -- for note b4
signal Counter262: integer:= 0; -- for note c4
signal Counter294: integer:= 0; -- for note d4
signal Counter330: integer:= 0; -- for note e4
signal Counter349: integer:= 0; -- for note f4
signal Counter392: integer:= 0; -- for note g4
signal clk_440hz: std_logic:= '0'; -- for note a4
signal clk_494hz: std_logic:= '0'; -- for note b4
signal clk_262hz: std_logic:= '0'; -- for note c4
signal clk_294hz: std_logic:= '0'; -- for note d4
signal clk_330hz: std_logic:= '0'; -- for note e4
signal clk_349hz: std_logic:= '0'; -- for note f4
signal clk_392hz: std_logic:= '0'; -- for note g4
begin
--4th Octave of the piano.
process_a4 : process(clk_100mhz) --process to convert 100mhz freq to 440hz.

begin
 if rising_edge(clk_100mhz) then
 if Counter440 < 227271 then -- 100mHz/440Hz = 227271.
 Counter440 <= Counter440 + 1;
 else
 clk_440hz <= not clk_440hz;
 Counter440 <= 0;
 end if;
 end if;
end process process_a4;
process_b4 : process(clk_100mhz) --process to convert 100mhz freq to 494hz.
begin
 if rising_edge(clk_100mhz) then
 if Counter494 < 202429 then
 Counter494 <= Counter494 + 1;
 else
 clk_494hz <= not clk_494hz;
 Counter494 <= 0;
 end if;
 end if;
end process process_b4;
process_c4 : process(clk_100mhz) --process to convert 100mhz freq to 262hz.

begin
 if rising_edge(clk_100mhz) then
 if Counter262 < 381678 then
 Counter262 <= Counter262 + 1;
 else
 clk_262hz <= not clk_262hz;
 Counter262 <= 0;
 end if;
 end if;
end process process_c4;
process_d4 : process(clk_100mhz) --process to convert 100mhz freq to 294hz.
begin
 if rising_edge(clk_100mhz) then
 if Counter294 < 340135 then
 Counter294 <= Counter294 + 1;
 else
 clk_294hz <= not clk_294hz;
 Counter294 <= 0;
 end if;
 end if;
end process process_d4;
process_e4 : process(clk_100mhz) --process to convert 100mhz freq to 330hz.

begin
 if rising_edge(clk_100mhz) then
 if Counter330 < 303029 then
 Counter330 <= Counter330 + 1;
 else
 clk_330hz <= not clk_330hz;
 Counter330 <= 0;
 end if;
 end if;
end process process_e4;
process_f4 : process(clk_100mhz) --process to convert 100mhz freq to 349hz.
begin
 if rising_edge(clk_100mhz) then
 if Counter349 < 286532 then
 Counter349 <= Counter349 + 1;
 else
 clk_349hz <= not clk_349hz;
 Counter349 <= 0;
 end if;
 end if;
end process process_f4;
process_g4 : process(clk_100mhz) --process to convert 100mhz freq to 392hz.

begin
 if rising_edge(clk_100mhz) then
 if Counter392 < 255101 then
 Counter392 <= Counter392 + 1;
 else
 clk_392hz <= not clk_392hz;
 Counter392 <= 0;
 end if;
 end if;
end process process_g4;
 a4 <= clk_440hz;
 b4 <= clk_494hz;
 c4 <= clk_262hz;
 d4 <= clk_294hz;
 e4 <= clk_330hz;
 f4 <= clk_349hz;
 g4 <= clk_392hz;
end Behavioral;
