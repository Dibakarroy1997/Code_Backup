--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : NOR_S.vhw
-- /___/   /\     Timestamp : Sat Feb 18 09:01:07 2017
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: NOR_S
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY NOR_S IS
END NOR_S;

ARCHITECTURE testbench_arch OF NOR_S IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT NOR_DE
        PORT (
            A : In std_logic;
            B : In std_logic;
            C : Out std_logic
        );
    END COMPONENT;

    SIGNAL A : std_logic := '0';
    SIGNAL B : std_logic := '0';
    SIGNAL C : std_logic := '0';

    BEGIN
        UUT : NOR_DE
        PORT MAP (
            A => A,
            B => B,
            C => C
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  200ns
                WAIT FOR 200 ns;
                B <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                A <= '1';
                B <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                B <= '1';
                -- -------------------------------------
                WAIT FOR 600 ns;

            END PROCESS;

    END testbench_arch;

