-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/10/2022 17:20:55"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          TopLevel
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY TopLevel_vhd_vec_tst IS
END TopLevel_vhd_vec_tst;
ARCHITECTURE TopLevel_arch OF TopLevel_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL conteudo_ULA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL end_PC : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL end_pontos_controle : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL end_REGD : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL end_REGS : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL end_REGT : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL end_saida_reg_a : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL end_saida_reg_b : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL instrucao : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL saida_ram_simu : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL sel_mux : STD_LOGIC;
SIGNAL WR_enable : STD_LOGIC;
COMPONENT TopLevel
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	conteudo_ULA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	end_PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	end_pontos_controle : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	end_REGD : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	end_REGS : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	end_REGT : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	end_saida_reg_a : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	end_saida_reg_b : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	instrucao : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	saida_ram_simu : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	sel_mux : OUT STD_LOGIC;
	WR_enable : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : TopLevel
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	conteudo_ULA => conteudo_ULA,
	end_PC => end_PC,
	end_pontos_controle => end_pontos_controle,
	end_REGD => end_REGD,
	end_REGS => end_REGS,
	end_REGT => end_REGT,
	end_saida_reg_a => end_saida_reg_a,
	end_saida_reg_b => end_saida_reg_b,
	instrucao => instrucao,
	KEY => KEY,
	saida_ram_simu => saida_ram_simu,
	sel_mux => sel_mux,
	WR_enable => WR_enable
	);

-- KEY[0]
t_prcs_KEY_0: PROCESS
BEGIN
	KEY(0) <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 7
	LOOP
		KEY(0) <= '0';
		WAIT FOR 10000 ps;
		KEY(0) <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	KEY(0) <= '0';
WAIT;
END PROCESS t_prcs_KEY_0;
END TopLevel_arch;
