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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "11/01/2022 12:18:51"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	TopLevel IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	OP : IN std_logic_vector(1 DOWNTO 0);
	WR_enable : IN std_logic;
	instrucao : OUT std_logic_vector(5 DOWNTO 0);
	conteudo_ULA : OUT std_logic_vector(31 DOWNTO 0);
	end_REGS : OUT std_logic_vector(4 DOWNTO 0);
	end_REGT : OUT std_logic_vector(4 DOWNTO 0);
	end_REGD : OUT std_logic_vector(4 DOWNTO 0)
	);
END TopLevel;

ARCHITECTURE structure OF TopLevel IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_OP : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_WR_enable : std_logic;
SIGNAL ww_instrucao : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_conteudo_ULA : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_end_REGS : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_end_REGT : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_end_REGD : std_logic_vector(4 DOWNTO 0);
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \OP[1]~input_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \PC|DOUT[2]~0_combout\ : std_logic;
SIGNAL \incrementaPC|Add0~1_sumout\ : std_logic;
SIGNAL \incrementaPC|Add0~2\ : std_logic;
SIGNAL \incrementaPC|Add0~5_sumout\ : std_logic;
SIGNAL \incrementaPC|Add0~6\ : std_logic;
SIGNAL \incrementaPC|Add0~9_sumout\ : std_logic;
SIGNAL \incrementaPC|Add0~10\ : std_logic;
SIGNAL \incrementaPC|Add0~17_sumout\ : std_logic;
SIGNAL \incrementaPC|Add0~18\ : std_logic;
SIGNAL \incrementaPC|Add0~13_sumout\ : std_logic;
SIGNAL \ROM1|memROM~0_combout\ : std_logic;
SIGNAL \ROM1|memROM~1_combout\ : std_logic;
SIGNAL \OP[0]~input_o\ : std_logic;
SIGNAL \ULA1|Equal1~0_combout\ : std_logic;
SIGNAL \WR_enable~input_o\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1094_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~38_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1095_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~294_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1062_combout\ : std_logic;
SIGNAL \ULA1|Add0~130_cout\ : std_logic;
SIGNAL \ULA1|Add0~1_sumout\ : std_logic;
SIGNAL \ULA1|saida[0]~0_combout\ : std_logic;
SIGNAL \ULA1|Add0~5_wirecell_combout\ : std_logic;
SIGNAL \ROM1|memROM~0_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~39_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~295_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1063_combout\ : std_logic;
SIGNAL \ULA1|Add0~2\ : std_logic;
SIGNAL \ULA1|Add0~5_sumout\ : std_logic;
SIGNAL \ULA1|saida[1]~1_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~40_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~296_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1064_combout\ : std_logic;
SIGNAL \ULA1|Add0~6\ : std_logic;
SIGNAL \ULA1|Add0~9_sumout\ : std_logic;
SIGNAL \ULA1|saida[2]~2_combout\ : std_logic;
SIGNAL \ULA1|Add0~13_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~41_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~297_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1065_combout\ : std_logic;
SIGNAL \ULA1|Add0~10\ : std_logic;
SIGNAL \ULA1|Add0~13_sumout\ : std_logic;
SIGNAL \ULA1|saida[3]~3_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~42_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~298_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1066_combout\ : std_logic;
SIGNAL \ULA1|Add0~14\ : std_logic;
SIGNAL \ULA1|Add0~17_sumout\ : std_logic;
SIGNAL \ULA1|saida[4]~4_combout\ : std_logic;
SIGNAL \ULA1|Add0~21_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~43_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~299_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1067_combout\ : std_logic;
SIGNAL \ULA1|Add0~18\ : std_logic;
SIGNAL \ULA1|Add0~21_sumout\ : std_logic;
SIGNAL \ULA1|saida[5]~5_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~44_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~300_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1068_combout\ : std_logic;
SIGNAL \ULA1|Add0~22\ : std_logic;
SIGNAL \ULA1|Add0~25_sumout\ : std_logic;
SIGNAL \ULA1|saida[6]~6_combout\ : std_logic;
SIGNAL \ULA1|Add0~29_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~45_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~301_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1069_combout\ : std_logic;
SIGNAL \ULA1|Add0~26\ : std_logic;
SIGNAL \ULA1|Add0~29_sumout\ : std_logic;
SIGNAL \ULA1|saida[7]~7_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~46_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~302_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1070_combout\ : std_logic;
SIGNAL \ULA1|Add0~30\ : std_logic;
SIGNAL \ULA1|Add0~33_sumout\ : std_logic;
SIGNAL \ULA1|saida[8]~8_combout\ : std_logic;
SIGNAL \ULA1|Add0~37_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~47_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~303_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1071_combout\ : std_logic;
SIGNAL \ULA1|Add0~34\ : std_logic;
SIGNAL \ULA1|Add0~37_sumout\ : std_logic;
SIGNAL \ULA1|saida[9]~9_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~48_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~304_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1072_combout\ : std_logic;
SIGNAL \ULA1|Add0~38\ : std_logic;
SIGNAL \ULA1|Add0~41_sumout\ : std_logic;
SIGNAL \ULA1|saida[10]~10_combout\ : std_logic;
SIGNAL \ULA1|Add0~45_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~49_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~305_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1073_combout\ : std_logic;
SIGNAL \ULA1|Add0~42\ : std_logic;
SIGNAL \ULA1|Add0~45_sumout\ : std_logic;
SIGNAL \ULA1|saida[11]~11_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~50_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~306_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1074_combout\ : std_logic;
SIGNAL \ULA1|Add0~46\ : std_logic;
SIGNAL \ULA1|Add0~49_sumout\ : std_logic;
SIGNAL \ULA1|saida[12]~12_combout\ : std_logic;
SIGNAL \ULA1|Add0~53_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~51_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~307_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1075_combout\ : std_logic;
SIGNAL \ULA1|Add0~50\ : std_logic;
SIGNAL \ULA1|Add0~53_sumout\ : std_logic;
SIGNAL \ULA1|saida[13]~13_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~52_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~308_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1076_combout\ : std_logic;
SIGNAL \ULA1|Add0~54\ : std_logic;
SIGNAL \ULA1|Add0~57_sumout\ : std_logic;
SIGNAL \ULA1|saida[14]~14_combout\ : std_logic;
SIGNAL \ULA1|Add0~61_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~53_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~309_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1077_combout\ : std_logic;
SIGNAL \ULA1|Add0~58\ : std_logic;
SIGNAL \ULA1|Add0~61_sumout\ : std_logic;
SIGNAL \ULA1|saida[15]~15_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~54_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~310_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1078_combout\ : std_logic;
SIGNAL \ULA1|Add0~62\ : std_logic;
SIGNAL \ULA1|Add0~65_sumout\ : std_logic;
SIGNAL \ULA1|saida[16]~16_combout\ : std_logic;
SIGNAL \ULA1|Add0~69_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~55_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~311_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1079_combout\ : std_logic;
SIGNAL \ULA1|Add0~66\ : std_logic;
SIGNAL \ULA1|Add0~69_sumout\ : std_logic;
SIGNAL \ULA1|saida[17]~17_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~56_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~312_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1080_combout\ : std_logic;
SIGNAL \ULA1|Add0~70\ : std_logic;
SIGNAL \ULA1|Add0~73_sumout\ : std_logic;
SIGNAL \ULA1|saida[18]~18_combout\ : std_logic;
SIGNAL \ULA1|Add0~77_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~57_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~313_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1081_combout\ : std_logic;
SIGNAL \ULA1|Add0~74\ : std_logic;
SIGNAL \ULA1|Add0~77_sumout\ : std_logic;
SIGNAL \ULA1|saida[19]~19_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~58_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~314_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1082_combout\ : std_logic;
SIGNAL \ULA1|Add0~78\ : std_logic;
SIGNAL \ULA1|Add0~81_sumout\ : std_logic;
SIGNAL \ULA1|saida[20]~20_combout\ : std_logic;
SIGNAL \ULA1|Add0~85_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~59_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~315_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1083_combout\ : std_logic;
SIGNAL \ULA1|Add0~82\ : std_logic;
SIGNAL \ULA1|Add0~85_sumout\ : std_logic;
SIGNAL \ULA1|saida[21]~21_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~60_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~316_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1084_combout\ : std_logic;
SIGNAL \ULA1|Add0~86\ : std_logic;
SIGNAL \ULA1|Add0~89_sumout\ : std_logic;
SIGNAL \ULA1|saida[22]~22_combout\ : std_logic;
SIGNAL \ULA1|Add0~93_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~61_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~317_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1085_combout\ : std_logic;
SIGNAL \ULA1|Add0~90\ : std_logic;
SIGNAL \ULA1|Add0~93_sumout\ : std_logic;
SIGNAL \ULA1|saida[23]~23_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~62_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~318_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1086_combout\ : std_logic;
SIGNAL \ULA1|Add0~94\ : std_logic;
SIGNAL \ULA1|Add0~97_sumout\ : std_logic;
SIGNAL \ULA1|saida[24]~24_combout\ : std_logic;
SIGNAL \ULA1|Add0~101_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~63_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~319_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1087_combout\ : std_logic;
SIGNAL \ULA1|Add0~98\ : std_logic;
SIGNAL \ULA1|Add0~101_sumout\ : std_logic;
SIGNAL \ULA1|saida[25]~25_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~64_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~320_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1088_combout\ : std_logic;
SIGNAL \ULA1|Add0~102\ : std_logic;
SIGNAL \ULA1|Add0~105_sumout\ : std_logic;
SIGNAL \ULA1|saida[26]~26_combout\ : std_logic;
SIGNAL \ULA1|Add0~109_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~65_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~321_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1089_combout\ : std_logic;
SIGNAL \ULA1|Add0~106\ : std_logic;
SIGNAL \ULA1|Add0~109_sumout\ : std_logic;
SIGNAL \ULA1|saida[27]~27_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~66_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~322_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1090_combout\ : std_logic;
SIGNAL \ULA1|Add0~110\ : std_logic;
SIGNAL \ULA1|Add0~113_sumout\ : std_logic;
SIGNAL \ULA1|saida[28]~28_combout\ : std_logic;
SIGNAL \ULA1|Add0~117_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~67_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~323_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1091_combout\ : std_logic;
SIGNAL \ULA1|Add0~114\ : std_logic;
SIGNAL \ULA1|Add0~117_sumout\ : std_logic;
SIGNAL \ULA1|saida[29]~29_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~68_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~324_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1092_combout\ : std_logic;
SIGNAL \ULA1|Add0~118\ : std_logic;
SIGNAL \ULA1|Add0~121_sumout\ : std_logic;
SIGNAL \ULA1|saida[30]~30_combout\ : std_logic;
SIGNAL \ULA1|Add0~125_wirecell_combout\ : std_logic;
SIGNAL \bancoRegistradores|registrador~69_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~325_q\ : std_logic;
SIGNAL \bancoRegistradores|registrador~1093_combout\ : std_logic;
SIGNAL \ULA1|Add0~122\ : std_logic;
SIGNAL \ULA1|Add0~125_sumout\ : std_logic;
SIGNAL \ULA1|saida[31]~31_combout\ : std_logic;
SIGNAL \PC|DOUT\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_WR_enable~input_o\ : std_logic;
SIGNAL \ALT_INV_OP[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_OP[1]~input_o\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1093_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1092_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1091_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1090_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1089_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1088_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1087_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1086_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1085_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1084_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1083_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1082_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1081_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1080_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1079_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1078_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1077_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1076_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1075_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1074_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1073_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1072_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1071_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1070_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1069_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1068_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1067_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1066_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1065_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1064_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1063_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~1062_combout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~1_combout\ : std_logic;
SIGNAL \PC|ALT_INV_DOUT\ : std_logic_vector(7 DOWNTO 2);
SIGNAL \ROM1|ALT_INV_memROM~0_combout\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~325_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~69_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~324_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~68_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~323_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~67_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~322_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~66_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~321_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~65_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~320_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~64_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~319_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~63_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~318_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~62_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~317_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~61_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~316_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~60_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~315_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~59_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~314_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~58_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~313_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~57_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~312_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~56_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~311_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~55_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~310_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~54_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~309_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~53_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~308_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~52_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~307_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~51_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~306_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~50_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~305_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~49_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~304_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~48_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~303_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~47_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~302_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~46_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~301_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~45_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~300_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~44_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~299_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~43_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~298_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~42_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~297_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~41_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~296_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~40_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~295_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~39_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~294_q\ : std_logic;
SIGNAL \bancoRegistradores|ALT_INV_registrador~38_q\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~125_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~121_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~117_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~113_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~109_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~105_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~101_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~97_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~85_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~81_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~73_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~69_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ULA1|ALT_INV_Add0~1_sumout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_OP <= OP;
ww_WR_enable <= WR_enable;
instrucao <= ww_instrucao;
conteudo_ULA <= ww_conteudo_ULA;
end_REGS <= ww_end_REGS;
end_REGT <= ww_end_REGT;
end_REGD <= ww_end_REGD;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_WR_enable~input_o\ <= NOT \WR_enable~input_o\;
\ALT_INV_OP[0]~input_o\ <= NOT \OP[0]~input_o\;
\ALT_INV_OP[1]~input_o\ <= NOT \OP[1]~input_o\;
\bancoRegistradores|ALT_INV_registrador~1093_combout\ <= NOT \bancoRegistradores|registrador~1093_combout\;
\bancoRegistradores|ALT_INV_registrador~1092_combout\ <= NOT \bancoRegistradores|registrador~1092_combout\;
\bancoRegistradores|ALT_INV_registrador~1091_combout\ <= NOT \bancoRegistradores|registrador~1091_combout\;
\bancoRegistradores|ALT_INV_registrador~1090_combout\ <= NOT \bancoRegistradores|registrador~1090_combout\;
\bancoRegistradores|ALT_INV_registrador~1089_combout\ <= NOT \bancoRegistradores|registrador~1089_combout\;
\bancoRegistradores|ALT_INV_registrador~1088_combout\ <= NOT \bancoRegistradores|registrador~1088_combout\;
\bancoRegistradores|ALT_INV_registrador~1087_combout\ <= NOT \bancoRegistradores|registrador~1087_combout\;
\bancoRegistradores|ALT_INV_registrador~1086_combout\ <= NOT \bancoRegistradores|registrador~1086_combout\;
\bancoRegistradores|ALT_INV_registrador~1085_combout\ <= NOT \bancoRegistradores|registrador~1085_combout\;
\bancoRegistradores|ALT_INV_registrador~1084_combout\ <= NOT \bancoRegistradores|registrador~1084_combout\;
\bancoRegistradores|ALT_INV_registrador~1083_combout\ <= NOT \bancoRegistradores|registrador~1083_combout\;
\bancoRegistradores|ALT_INV_registrador~1082_combout\ <= NOT \bancoRegistradores|registrador~1082_combout\;
\bancoRegistradores|ALT_INV_registrador~1081_combout\ <= NOT \bancoRegistradores|registrador~1081_combout\;
\bancoRegistradores|ALT_INV_registrador~1080_combout\ <= NOT \bancoRegistradores|registrador~1080_combout\;
\bancoRegistradores|ALT_INV_registrador~1079_combout\ <= NOT \bancoRegistradores|registrador~1079_combout\;
\bancoRegistradores|ALT_INV_registrador~1078_combout\ <= NOT \bancoRegistradores|registrador~1078_combout\;
\bancoRegistradores|ALT_INV_registrador~1077_combout\ <= NOT \bancoRegistradores|registrador~1077_combout\;
\bancoRegistradores|ALT_INV_registrador~1076_combout\ <= NOT \bancoRegistradores|registrador~1076_combout\;
\bancoRegistradores|ALT_INV_registrador~1075_combout\ <= NOT \bancoRegistradores|registrador~1075_combout\;
\bancoRegistradores|ALT_INV_registrador~1074_combout\ <= NOT \bancoRegistradores|registrador~1074_combout\;
\bancoRegistradores|ALT_INV_registrador~1073_combout\ <= NOT \bancoRegistradores|registrador~1073_combout\;
\bancoRegistradores|ALT_INV_registrador~1072_combout\ <= NOT \bancoRegistradores|registrador~1072_combout\;
\bancoRegistradores|ALT_INV_registrador~1071_combout\ <= NOT \bancoRegistradores|registrador~1071_combout\;
\bancoRegistradores|ALT_INV_registrador~1070_combout\ <= NOT \bancoRegistradores|registrador~1070_combout\;
\bancoRegistradores|ALT_INV_registrador~1069_combout\ <= NOT \bancoRegistradores|registrador~1069_combout\;
\bancoRegistradores|ALT_INV_registrador~1068_combout\ <= NOT \bancoRegistradores|registrador~1068_combout\;
\bancoRegistradores|ALT_INV_registrador~1067_combout\ <= NOT \bancoRegistradores|registrador~1067_combout\;
\bancoRegistradores|ALT_INV_registrador~1066_combout\ <= NOT \bancoRegistradores|registrador~1066_combout\;
\bancoRegistradores|ALT_INV_registrador~1065_combout\ <= NOT \bancoRegistradores|registrador~1065_combout\;
\bancoRegistradores|ALT_INV_registrador~1064_combout\ <= NOT \bancoRegistradores|registrador~1064_combout\;
\bancoRegistradores|ALT_INV_registrador~1063_combout\ <= NOT \bancoRegistradores|registrador~1063_combout\;
\bancoRegistradores|ALT_INV_registrador~1062_combout\ <= NOT \bancoRegistradores|registrador~1062_combout\;
\ULA1|ALT_INV_Equal1~0_combout\ <= NOT \ULA1|Equal1~0_combout\;
\ROM1|ALT_INV_memROM~1_combout\ <= NOT \ROM1|memROM~1_combout\;
\PC|ALT_INV_DOUT\(2) <= NOT \PC|DOUT\(2);
\ROM1|ALT_INV_memROM~0_combout\ <= NOT \ROM1|memROM~0_combout\;
\PC|ALT_INV_DOUT\(6) <= NOT \PC|DOUT\(6);
\PC|ALT_INV_DOUT\(7) <= NOT \PC|DOUT\(7);
\PC|ALT_INV_DOUT\(5) <= NOT \PC|DOUT\(5);
\PC|ALT_INV_DOUT\(4) <= NOT \PC|DOUT\(4);
\PC|ALT_INV_DOUT\(3) <= NOT \PC|DOUT\(3);
\bancoRegistradores|ALT_INV_registrador~325_q\ <= NOT \bancoRegistradores|registrador~325_q\;
\bancoRegistradores|ALT_INV_registrador~69_q\ <= NOT \bancoRegistradores|registrador~69_q\;
\bancoRegistradores|ALT_INV_registrador~324_q\ <= NOT \bancoRegistradores|registrador~324_q\;
\bancoRegistradores|ALT_INV_registrador~68_q\ <= NOT \bancoRegistradores|registrador~68_q\;
\bancoRegistradores|ALT_INV_registrador~323_q\ <= NOT \bancoRegistradores|registrador~323_q\;
\bancoRegistradores|ALT_INV_registrador~67_q\ <= NOT \bancoRegistradores|registrador~67_q\;
\bancoRegistradores|ALT_INV_registrador~322_q\ <= NOT \bancoRegistradores|registrador~322_q\;
\bancoRegistradores|ALT_INV_registrador~66_q\ <= NOT \bancoRegistradores|registrador~66_q\;
\bancoRegistradores|ALT_INV_registrador~321_q\ <= NOT \bancoRegistradores|registrador~321_q\;
\bancoRegistradores|ALT_INV_registrador~65_q\ <= NOT \bancoRegistradores|registrador~65_q\;
\bancoRegistradores|ALT_INV_registrador~320_q\ <= NOT \bancoRegistradores|registrador~320_q\;
\bancoRegistradores|ALT_INV_registrador~64_q\ <= NOT \bancoRegistradores|registrador~64_q\;
\bancoRegistradores|ALT_INV_registrador~319_q\ <= NOT \bancoRegistradores|registrador~319_q\;
\bancoRegistradores|ALT_INV_registrador~63_q\ <= NOT \bancoRegistradores|registrador~63_q\;
\bancoRegistradores|ALT_INV_registrador~318_q\ <= NOT \bancoRegistradores|registrador~318_q\;
\bancoRegistradores|ALT_INV_registrador~62_q\ <= NOT \bancoRegistradores|registrador~62_q\;
\bancoRegistradores|ALT_INV_registrador~317_q\ <= NOT \bancoRegistradores|registrador~317_q\;
\bancoRegistradores|ALT_INV_registrador~61_q\ <= NOT \bancoRegistradores|registrador~61_q\;
\bancoRegistradores|ALT_INV_registrador~316_q\ <= NOT \bancoRegistradores|registrador~316_q\;
\bancoRegistradores|ALT_INV_registrador~60_q\ <= NOT \bancoRegistradores|registrador~60_q\;
\bancoRegistradores|ALT_INV_registrador~315_q\ <= NOT \bancoRegistradores|registrador~315_q\;
\bancoRegistradores|ALT_INV_registrador~59_q\ <= NOT \bancoRegistradores|registrador~59_q\;
\bancoRegistradores|ALT_INV_registrador~314_q\ <= NOT \bancoRegistradores|registrador~314_q\;
\bancoRegistradores|ALT_INV_registrador~58_q\ <= NOT \bancoRegistradores|registrador~58_q\;
\bancoRegistradores|ALT_INV_registrador~313_q\ <= NOT \bancoRegistradores|registrador~313_q\;
\bancoRegistradores|ALT_INV_registrador~57_q\ <= NOT \bancoRegistradores|registrador~57_q\;
\bancoRegistradores|ALT_INV_registrador~312_q\ <= NOT \bancoRegistradores|registrador~312_q\;
\bancoRegistradores|ALT_INV_registrador~56_q\ <= NOT \bancoRegistradores|registrador~56_q\;
\bancoRegistradores|ALT_INV_registrador~311_q\ <= NOT \bancoRegistradores|registrador~311_q\;
\bancoRegistradores|ALT_INV_registrador~55_q\ <= NOT \bancoRegistradores|registrador~55_q\;
\bancoRegistradores|ALT_INV_registrador~310_q\ <= NOT \bancoRegistradores|registrador~310_q\;
\bancoRegistradores|ALT_INV_registrador~54_q\ <= NOT \bancoRegistradores|registrador~54_q\;
\bancoRegistradores|ALT_INV_registrador~309_q\ <= NOT \bancoRegistradores|registrador~309_q\;
\bancoRegistradores|ALT_INV_registrador~53_q\ <= NOT \bancoRegistradores|registrador~53_q\;
\bancoRegistradores|ALT_INV_registrador~308_q\ <= NOT \bancoRegistradores|registrador~308_q\;
\bancoRegistradores|ALT_INV_registrador~52_q\ <= NOT \bancoRegistradores|registrador~52_q\;
\bancoRegistradores|ALT_INV_registrador~307_q\ <= NOT \bancoRegistradores|registrador~307_q\;
\bancoRegistradores|ALT_INV_registrador~51_q\ <= NOT \bancoRegistradores|registrador~51_q\;
\bancoRegistradores|ALT_INV_registrador~306_q\ <= NOT \bancoRegistradores|registrador~306_q\;
\bancoRegistradores|ALT_INV_registrador~50_q\ <= NOT \bancoRegistradores|registrador~50_q\;
\bancoRegistradores|ALT_INV_registrador~305_q\ <= NOT \bancoRegistradores|registrador~305_q\;
\bancoRegistradores|ALT_INV_registrador~49_q\ <= NOT \bancoRegistradores|registrador~49_q\;
\bancoRegistradores|ALT_INV_registrador~304_q\ <= NOT \bancoRegistradores|registrador~304_q\;
\bancoRegistradores|ALT_INV_registrador~48_q\ <= NOT \bancoRegistradores|registrador~48_q\;
\bancoRegistradores|ALT_INV_registrador~303_q\ <= NOT \bancoRegistradores|registrador~303_q\;
\bancoRegistradores|ALT_INV_registrador~47_q\ <= NOT \bancoRegistradores|registrador~47_q\;
\bancoRegistradores|ALT_INV_registrador~302_q\ <= NOT \bancoRegistradores|registrador~302_q\;
\bancoRegistradores|ALT_INV_registrador~46_q\ <= NOT \bancoRegistradores|registrador~46_q\;
\bancoRegistradores|ALT_INV_registrador~301_q\ <= NOT \bancoRegistradores|registrador~301_q\;
\bancoRegistradores|ALT_INV_registrador~45_q\ <= NOT \bancoRegistradores|registrador~45_q\;
\bancoRegistradores|ALT_INV_registrador~300_q\ <= NOT \bancoRegistradores|registrador~300_q\;
\bancoRegistradores|ALT_INV_registrador~44_q\ <= NOT \bancoRegistradores|registrador~44_q\;
\bancoRegistradores|ALT_INV_registrador~299_q\ <= NOT \bancoRegistradores|registrador~299_q\;
\bancoRegistradores|ALT_INV_registrador~43_q\ <= NOT \bancoRegistradores|registrador~43_q\;
\bancoRegistradores|ALT_INV_registrador~298_q\ <= NOT \bancoRegistradores|registrador~298_q\;
\bancoRegistradores|ALT_INV_registrador~42_q\ <= NOT \bancoRegistradores|registrador~42_q\;
\bancoRegistradores|ALT_INV_registrador~297_q\ <= NOT \bancoRegistradores|registrador~297_q\;
\bancoRegistradores|ALT_INV_registrador~41_q\ <= NOT \bancoRegistradores|registrador~41_q\;
\bancoRegistradores|ALT_INV_registrador~296_q\ <= NOT \bancoRegistradores|registrador~296_q\;
\bancoRegistradores|ALT_INV_registrador~40_q\ <= NOT \bancoRegistradores|registrador~40_q\;
\bancoRegistradores|ALT_INV_registrador~295_q\ <= NOT \bancoRegistradores|registrador~295_q\;
\bancoRegistradores|ALT_INV_registrador~39_q\ <= NOT \bancoRegistradores|registrador~39_q\;
\bancoRegistradores|ALT_INV_registrador~294_q\ <= NOT \bancoRegistradores|registrador~294_q\;
\bancoRegistradores|ALT_INV_registrador~38_q\ <= NOT \bancoRegistradores|registrador~38_q\;
\ULA1|ALT_INV_Add0~125_sumout\ <= NOT \ULA1|Add0~125_sumout\;
\ULA1|ALT_INV_Add0~121_sumout\ <= NOT \ULA1|Add0~121_sumout\;
\ULA1|ALT_INV_Add0~117_sumout\ <= NOT \ULA1|Add0~117_sumout\;
\ULA1|ALT_INV_Add0~113_sumout\ <= NOT \ULA1|Add0~113_sumout\;
\ULA1|ALT_INV_Add0~109_sumout\ <= NOT \ULA1|Add0~109_sumout\;
\ULA1|ALT_INV_Add0~105_sumout\ <= NOT \ULA1|Add0~105_sumout\;
\ULA1|ALT_INV_Add0~101_sumout\ <= NOT \ULA1|Add0~101_sumout\;
\ULA1|ALT_INV_Add0~97_sumout\ <= NOT \ULA1|Add0~97_sumout\;
\ULA1|ALT_INV_Add0~93_sumout\ <= NOT \ULA1|Add0~93_sumout\;
\ULA1|ALT_INV_Add0~89_sumout\ <= NOT \ULA1|Add0~89_sumout\;
\ULA1|ALT_INV_Add0~85_sumout\ <= NOT \ULA1|Add0~85_sumout\;
\ULA1|ALT_INV_Add0~81_sumout\ <= NOT \ULA1|Add0~81_sumout\;
\ULA1|ALT_INV_Add0~77_sumout\ <= NOT \ULA1|Add0~77_sumout\;
\ULA1|ALT_INV_Add0~73_sumout\ <= NOT \ULA1|Add0~73_sumout\;
\ULA1|ALT_INV_Add0~69_sumout\ <= NOT \ULA1|Add0~69_sumout\;
\ULA1|ALT_INV_Add0~65_sumout\ <= NOT \ULA1|Add0~65_sumout\;
\ULA1|ALT_INV_Add0~61_sumout\ <= NOT \ULA1|Add0~61_sumout\;
\ULA1|ALT_INV_Add0~57_sumout\ <= NOT \ULA1|Add0~57_sumout\;
\ULA1|ALT_INV_Add0~53_sumout\ <= NOT \ULA1|Add0~53_sumout\;
\ULA1|ALT_INV_Add0~49_sumout\ <= NOT \ULA1|Add0~49_sumout\;
\ULA1|ALT_INV_Add0~45_sumout\ <= NOT \ULA1|Add0~45_sumout\;
\ULA1|ALT_INV_Add0~41_sumout\ <= NOT \ULA1|Add0~41_sumout\;
\ULA1|ALT_INV_Add0~37_sumout\ <= NOT \ULA1|Add0~37_sumout\;
\ULA1|ALT_INV_Add0~33_sumout\ <= NOT \ULA1|Add0~33_sumout\;
\ULA1|ALT_INV_Add0~29_sumout\ <= NOT \ULA1|Add0~29_sumout\;
\ULA1|ALT_INV_Add0~25_sumout\ <= NOT \ULA1|Add0~25_sumout\;
\ULA1|ALT_INV_Add0~21_sumout\ <= NOT \ULA1|Add0~21_sumout\;
\ULA1|ALT_INV_Add0~17_sumout\ <= NOT \ULA1|Add0~17_sumout\;
\ULA1|ALT_INV_Add0~13_sumout\ <= NOT \ULA1|Add0~13_sumout\;
\ULA1|ALT_INV_Add0~9_sumout\ <= NOT \ULA1|Add0~9_sumout\;
\ULA1|ALT_INV_Add0~5_sumout\ <= NOT \ULA1|Add0~5_sumout\;
\ULA1|ALT_INV_Add0~1_sumout\ <= NOT \ULA1|Add0~1_sumout\;

\instrucao[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_instrucao(0));

\instrucao[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_instrucao(1));

\instrucao[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_instrucao(2));

\instrucao[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_instrucao(3));

\instrucao[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_instrucao(4));

\instrucao[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_instrucao(5));

\conteudo_ULA[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(0));

\conteudo_ULA[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(1));

\conteudo_ULA[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(2));

\conteudo_ULA[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(3));

\conteudo_ULA[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(4));

\conteudo_ULA[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(5));

\conteudo_ULA[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(6));

\conteudo_ULA[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[7]~7_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(7));

\conteudo_ULA[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[8]~8_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(8));

\conteudo_ULA[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[9]~9_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(9));

\conteudo_ULA[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[10]~10_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(10));

\conteudo_ULA[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[11]~11_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(11));

\conteudo_ULA[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[12]~12_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(12));

\conteudo_ULA[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[13]~13_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(13));

\conteudo_ULA[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[14]~14_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(14));

\conteudo_ULA[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[15]~15_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(15));

\conteudo_ULA[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[16]~16_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(16));

\conteudo_ULA[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[17]~17_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(17));

\conteudo_ULA[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[18]~18_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(18));

\conteudo_ULA[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[19]~19_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(19));

\conteudo_ULA[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[20]~20_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(20));

\conteudo_ULA[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[21]~21_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(21));

\conteudo_ULA[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[22]~22_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(22));

\conteudo_ULA[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[23]~23_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(23));

\conteudo_ULA[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[24]~24_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(24));

\conteudo_ULA[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[25]~25_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(25));

\conteudo_ULA[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[26]~26_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(26));

\conteudo_ULA[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[27]~27_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(27));

\conteudo_ULA[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[28]~28_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(28));

\conteudo_ULA[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[29]~29_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(29));

\conteudo_ULA[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[30]~30_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(30));

\conteudo_ULA[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA1|saida[31]~31_combout\,
	devoe => ww_devoe,
	o => ww_conteudo_ULA(31));

\end_REGS[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~1_combout\,
	devoe => ww_devoe,
	o => ww_end_REGS(0));

\end_REGS[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGS(1));

\end_REGS[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGS(2));

\end_REGS[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~0_combout\,
	devoe => ww_devoe,
	o => ww_end_REGS(3));

\end_REGS[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGS(4));

\end_REGT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGT(0));

\end_REGT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~0_combout\,
	devoe => ww_devoe,
	o => ww_end_REGT(1));

\end_REGT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGT(2));

\end_REGT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~0_combout\,
	devoe => ww_devoe,
	o => ww_end_REGT(3));

\end_REGT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGT(4));

\end_REGD[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGD(0));

\end_REGD[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGD(1));

\end_REGD[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGD(2));

\end_REGD[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~0_combout\,
	devoe => ww_devoe,
	o => ww_end_REGD(3));

\end_REGD[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_end_REGD(4));

\OP[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OP(1),
	o => \OP[1]~input_o\);

\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

\PC|DOUT[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC|DOUT[2]~0_combout\ = !\PC|DOUT\(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	combout => \PC|DOUT[2]~0_combout\);

\PC|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \PC|DOUT[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(2));

\incrementaPC|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~1_sumout\ = SUM(( \PC|DOUT\(2) ) + ( \PC|DOUT\(3) ) + ( !VCC ))
-- \incrementaPC|Add0~2\ = CARRY(( \PC|DOUT\(2) ) + ( \PC|DOUT\(3) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(2),
	dataf => \PC|ALT_INV_DOUT\(3),
	cin => GND,
	sumout => \incrementaPC|Add0~1_sumout\,
	cout => \incrementaPC|Add0~2\);

\PC|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(3));

\incrementaPC|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~5_sumout\ = SUM(( \PC|DOUT\(4) ) + ( GND ) + ( \incrementaPC|Add0~2\ ))
-- \incrementaPC|Add0~6\ = CARRY(( \PC|DOUT\(4) ) + ( GND ) + ( \incrementaPC|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(4),
	cin => \incrementaPC|Add0~2\,
	sumout => \incrementaPC|Add0~5_sumout\,
	cout => \incrementaPC|Add0~6\);

\PC|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(4));

\incrementaPC|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~9_sumout\ = SUM(( \PC|DOUT\(5) ) + ( GND ) + ( \incrementaPC|Add0~6\ ))
-- \incrementaPC|Add0~10\ = CARRY(( \PC|DOUT\(5) ) + ( GND ) + ( \incrementaPC|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(5),
	cin => \incrementaPC|Add0~6\,
	sumout => \incrementaPC|Add0~9_sumout\,
	cout => \incrementaPC|Add0~10\);

\PC|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(5));

\incrementaPC|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~17_sumout\ = SUM(( \PC|DOUT\(6) ) + ( GND ) + ( \incrementaPC|Add0~10\ ))
-- \incrementaPC|Add0~18\ = CARRY(( \PC|DOUT\(6) ) + ( GND ) + ( \incrementaPC|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(6),
	cin => \incrementaPC|Add0~10\,
	sumout => \incrementaPC|Add0~17_sumout\,
	cout => \incrementaPC|Add0~18\);

\PC|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(6));

\incrementaPC|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~13_sumout\ = SUM(( \PC|DOUT\(7) ) + ( GND ) + ( \incrementaPC|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(7),
	cin => \incrementaPC|Add0~18\,
	sumout => \incrementaPC|Add0~13_sumout\);

\PC|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(7));

\ROM1|memROM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~0_combout\ = ( !\PC|DOUT\(6) & ( (!\PC|DOUT\(3) & (!\PC|DOUT\(4) & (!\PC|DOUT\(5) & !\PC|DOUT\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(3),
	datab => \PC|ALT_INV_DOUT\(4),
	datac => \PC|ALT_INV_DOUT\(5),
	datad => \PC|ALT_INV_DOUT\(7),
	datae => \PC|ALT_INV_DOUT\(6),
	combout => \ROM1|memROM~0_combout\);

\ROM1|memROM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~1_combout\ = ( !\PC|DOUT\(7) & ( !\PC|DOUT\(6) & ( (!\PC|DOUT\(2) & (!\PC|DOUT\(3) & (!\PC|DOUT\(4) & !\PC|DOUT\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \PC|ALT_INV_DOUT\(3),
	datac => \PC|ALT_INV_DOUT\(4),
	datad => \PC|ALT_INV_DOUT\(5),
	datae => \PC|ALT_INV_DOUT\(7),
	dataf => \PC|ALT_INV_DOUT\(6),
	combout => \ROM1|memROM~1_combout\);

\OP[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OP(0),
	o => \OP[0]~input_o\);

\ULA1|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Equal1~0_combout\ = (!\OP[1]~input_o\ & \OP[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ALT_INV_OP[0]~input_o\,
	combout => \ULA1|Equal1~0_combout\);

\WR_enable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WR_enable,
	o => \WR_enable~input_o\);

\bancoRegistradores|registrador~1094\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1094_combout\ = (!\ROM1|memROM~0_combout\ & \WR_enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \ALT_INV_WR_enable~input_o\,
	combout => \bancoRegistradores|registrador~1094_combout\);

\bancoRegistradores|registrador~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~1_sumout\,
	asdata => \ROM1|memROM~0_combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~38_q\);

\bancoRegistradores|registrador~1095\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1095_combout\ = (\ROM1|memROM~0_combout\ & \WR_enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \ALT_INV_WR_enable~input_o\,
	combout => \bancoRegistradores|registrador~1095_combout\);

\bancoRegistradores|registrador~294\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~1_sumout\,
	asdata => \ROM1|memROM~0_combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~294_q\);

\bancoRegistradores|registrador~1062\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1062_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~38_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~294_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~38_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~294_q\,
	combout => \bancoRegistradores|registrador~1062_combout\);

\ULA1|Add0~130\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~130_cout\ = CARRY(( (!\OP[0]~input_o\) # (\OP[1]~input_o\) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_OP[1]~input_o\,
	datad => \ALT_INV_OP[0]~input_o\,
	cin => GND,
	cout => \ULA1|Add0~130_cout\);

\ULA1|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~1_sumout\ = SUM(( (\bancoRegistradores|registrador~1062_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ROM1|memROM~0_combout\ $ (\ULA1|Equal1~0_combout\) ) + ( \ULA1|Add0~130_cout\ ))
-- \ULA1|Add0~2\ = CARRY(( (\bancoRegistradores|registrador~1062_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ROM1|memROM~0_combout\ $ (\ULA1|Equal1~0_combout\) ) + ( \ULA1|Add0~130_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001111000011110000000000000000000000000001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \ULA1|ALT_INV_Equal1~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1062_combout\,
	cin => \ULA1|Add0~130_cout\,
	sumout => \ULA1|Add0~1_sumout\,
	cout => \ULA1|Add0~2\);

\ULA1|saida[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[0]~0_combout\ = (!\OP[1]~input_o\ & ((\ULA1|Add0~1_sumout\))) # (\OP[1]~input_o\ & (\ROM1|memROM~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \ULA1|ALT_INV_Add0~1_sumout\,
	combout => \ULA1|saida[0]~0_combout\);

\ULA1|Add0~5_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~5_wirecell_combout\ = !\ULA1|Add0~5_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~5_sumout\,
	combout => \ULA1|Add0~5_wirecell_combout\);

\ROM1|memROM~0_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~0_wirecell_combout\ = !\ROM1|memROM~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	combout => \ROM1|memROM~0_wirecell_combout\);

\bancoRegistradores|registrador~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~5_wirecell_combout\,
	asdata => \ROM1|memROM~0_wirecell_combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~39_q\);

\bancoRegistradores|registrador~295\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~5_sumout\,
	asdata => \ROM1|memROM~0_combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~295_q\);

\bancoRegistradores|registrador~1063\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1063_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~39_q\)))) # (\ROM1|memROM~0_combout\ & ((!\PC|DOUT\(2)) # ((\bancoRegistradores|registrador~295_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110001011110011111000101111001111100010111100111110001011110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~39_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~295_q\,
	combout => \bancoRegistradores|registrador~1063_combout\);

\ULA1|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~5_sumout\ = SUM(( (\bancoRegistradores|registrador~1063_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ $ (\ROM1|memROM~0_combout\) ) + ( \ULA1|Add0~2\ ))
-- \ULA1|Add0~6\ = CARRY(( (\bancoRegistradores|registrador~1063_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ $ (\ROM1|memROM~0_combout\) ) + ( \ULA1|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001111000011110000000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1063_combout\,
	cin => \ULA1|Add0~2\,
	sumout => \ULA1|Add0~5_sumout\,
	cout => \ULA1|Add0~6\);

\ULA1|saida[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[1]~1_combout\ = (!\OP[1]~input_o\ & ((\ULA1|Add0~5_sumout\))) # (\OP[1]~input_o\ & (\ROM1|memROM~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \ULA1|ALT_INV_Add0~5_sumout\,
	combout => \ULA1|saida[1]~1_combout\);

\~GND\ : cyclonev_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

\bancoRegistradores|registrador~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~9_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~40_q\);

\bancoRegistradores|registrador~296\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~9_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~296_q\);

\bancoRegistradores|registrador~1064\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1064_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~40_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~296_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~40_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~296_q\,
	combout => \bancoRegistradores|registrador~1064_combout\);

\ULA1|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~9_sumout\ = SUM(( (\bancoRegistradores|registrador~1064_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~6\ ))
-- \ULA1|Add0~10\ = CARRY(( (\bancoRegistradores|registrador~1064_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1064_combout\,
	cin => \ULA1|Add0~6\,
	sumout => \ULA1|Add0~9_sumout\,
	cout => \ULA1|Add0~10\);

\ULA1|saida[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[2]~2_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~9_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~9_sumout\,
	combout => \ULA1|saida[2]~2_combout\);

\ULA1|Add0~13_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~13_wirecell_combout\ = !\ULA1|Add0~13_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~13_sumout\,
	combout => \ULA1|Add0~13_wirecell_combout\);

\bancoRegistradores|registrador~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~13_wirecell_combout\,
	asdata => \ROM1|memROM~0_wirecell_combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~41_q\);

\bancoRegistradores|registrador~297\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~13_sumout\,
	asdata => \ROM1|memROM~0_combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~297_q\);

\bancoRegistradores|registrador~1065\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1065_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~41_q\)))) # (\ROM1|memROM~0_combout\ & ((!\PC|DOUT\(2)) # ((\bancoRegistradores|registrador~297_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110001011110011111000101111001111100010111100111110001011110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~41_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~297_q\,
	combout => \bancoRegistradores|registrador~1065_combout\);

\ULA1|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~13_sumout\ = SUM(( (\bancoRegistradores|registrador~1065_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ $ (\ROM1|memROM~0_combout\) ) + ( \ULA1|Add0~10\ ))
-- \ULA1|Add0~14\ = CARRY(( (\bancoRegistradores|registrador~1065_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ $ (\ROM1|memROM~0_combout\) ) + ( \ULA1|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001111000011110000000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1065_combout\,
	cin => \ULA1|Add0~10\,
	sumout => \ULA1|Add0~13_sumout\,
	cout => \ULA1|Add0~14\);

\ULA1|saida[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[3]~3_combout\ = (!\OP[1]~input_o\ & ((\ULA1|Add0~13_sumout\))) # (\OP[1]~input_o\ & (\ROM1|memROM~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \ULA1|ALT_INV_Add0~13_sumout\,
	combout => \ULA1|saida[3]~3_combout\);

\bancoRegistradores|registrador~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~17_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~42_q\);

\bancoRegistradores|registrador~298\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~17_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~298_q\);

\bancoRegistradores|registrador~1066\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1066_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~42_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~298_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~42_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~298_q\,
	combout => \bancoRegistradores|registrador~1066_combout\);

\ULA1|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~17_sumout\ = SUM(( (\bancoRegistradores|registrador~1066_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~14\ ))
-- \ULA1|Add0~18\ = CARRY(( (\bancoRegistradores|registrador~1066_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1066_combout\,
	cin => \ULA1|Add0~14\,
	sumout => \ULA1|Add0~17_sumout\,
	cout => \ULA1|Add0~18\);

\ULA1|saida[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[4]~4_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~17_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~17_sumout\,
	combout => \ULA1|saida[4]~4_combout\);

\ULA1|Add0~21_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~21_wirecell_combout\ = !\ULA1|Add0~21_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~21_sumout\,
	combout => \ULA1|Add0~21_wirecell_combout\);

\bancoRegistradores|registrador~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~21_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~43_q\);

\bancoRegistradores|registrador~299\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~21_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~299_q\);

\bancoRegistradores|registrador~1067\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1067_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~43_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~299_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~43_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~299_q\,
	combout => \bancoRegistradores|registrador~1067_combout\);

\ULA1|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~21_sumout\ = SUM(( (\bancoRegistradores|registrador~1067_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~18\ ))
-- \ULA1|Add0~22\ = CARRY(( (\bancoRegistradores|registrador~1067_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1067_combout\,
	cin => \ULA1|Add0~18\,
	sumout => \ULA1|Add0~21_sumout\,
	cout => \ULA1|Add0~22\);

\ULA1|saida[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[5]~5_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~21_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~21_sumout\,
	combout => \ULA1|saida[5]~5_combout\);

\bancoRegistradores|registrador~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~25_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~44_q\);

\bancoRegistradores|registrador~300\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~25_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~300_q\);

\bancoRegistradores|registrador~1068\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1068_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~44_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~300_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~44_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~300_q\,
	combout => \bancoRegistradores|registrador~1068_combout\);

\ULA1|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~25_sumout\ = SUM(( (\bancoRegistradores|registrador~1068_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~22\ ))
-- \ULA1|Add0~26\ = CARRY(( (\bancoRegistradores|registrador~1068_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1068_combout\,
	cin => \ULA1|Add0~22\,
	sumout => \ULA1|Add0~25_sumout\,
	cout => \ULA1|Add0~26\);

\ULA1|saida[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[6]~6_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~25_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~25_sumout\,
	combout => \ULA1|saida[6]~6_combout\);

\ULA1|Add0~29_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~29_wirecell_combout\ = !\ULA1|Add0~29_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~29_sumout\,
	combout => \ULA1|Add0~29_wirecell_combout\);

\bancoRegistradores|registrador~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~29_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~45_q\);

\bancoRegistradores|registrador~301\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~29_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~301_q\);

\bancoRegistradores|registrador~1069\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1069_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~45_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~301_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~45_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~301_q\,
	combout => \bancoRegistradores|registrador~1069_combout\);

\ULA1|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~29_sumout\ = SUM(( (\bancoRegistradores|registrador~1069_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~26\ ))
-- \ULA1|Add0~30\ = CARRY(( (\bancoRegistradores|registrador~1069_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1069_combout\,
	cin => \ULA1|Add0~26\,
	sumout => \ULA1|Add0~29_sumout\,
	cout => \ULA1|Add0~30\);

\ULA1|saida[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[7]~7_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~29_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~29_sumout\,
	combout => \ULA1|saida[7]~7_combout\);

\bancoRegistradores|registrador~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~33_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~46_q\);

\bancoRegistradores|registrador~302\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~33_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~302_q\);

\bancoRegistradores|registrador~1070\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1070_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~46_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~302_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~46_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~302_q\,
	combout => \bancoRegistradores|registrador~1070_combout\);

\ULA1|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~33_sumout\ = SUM(( (\bancoRegistradores|registrador~1070_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~30\ ))
-- \ULA1|Add0~34\ = CARRY(( (\bancoRegistradores|registrador~1070_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1070_combout\,
	cin => \ULA1|Add0~30\,
	sumout => \ULA1|Add0~33_sumout\,
	cout => \ULA1|Add0~34\);

\ULA1|saida[8]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[8]~8_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~33_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~33_sumout\,
	combout => \ULA1|saida[8]~8_combout\);

\ULA1|Add0~37_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~37_wirecell_combout\ = !\ULA1|Add0~37_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~37_sumout\,
	combout => \ULA1|Add0~37_wirecell_combout\);

\bancoRegistradores|registrador~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~37_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~47_q\);

\bancoRegistradores|registrador~303\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~37_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~303_q\);

\bancoRegistradores|registrador~1071\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1071_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~47_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~303_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~47_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~303_q\,
	combout => \bancoRegistradores|registrador~1071_combout\);

\ULA1|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~37_sumout\ = SUM(( (\bancoRegistradores|registrador~1071_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~34\ ))
-- \ULA1|Add0~38\ = CARRY(( (\bancoRegistradores|registrador~1071_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1071_combout\,
	cin => \ULA1|Add0~34\,
	sumout => \ULA1|Add0~37_sumout\,
	cout => \ULA1|Add0~38\);

\ULA1|saida[9]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[9]~9_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~37_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~37_sumout\,
	combout => \ULA1|saida[9]~9_combout\);

\bancoRegistradores|registrador~48\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~41_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~48_q\);

\bancoRegistradores|registrador~304\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~41_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~304_q\);

\bancoRegistradores|registrador~1072\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1072_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~48_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~304_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~48_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~304_q\,
	combout => \bancoRegistradores|registrador~1072_combout\);

\ULA1|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~41_sumout\ = SUM(( (\bancoRegistradores|registrador~1072_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~38\ ))
-- \ULA1|Add0~42\ = CARRY(( (\bancoRegistradores|registrador~1072_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1072_combout\,
	cin => \ULA1|Add0~38\,
	sumout => \ULA1|Add0~41_sumout\,
	cout => \ULA1|Add0~42\);

\ULA1|saida[10]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[10]~10_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~41_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~41_sumout\,
	combout => \ULA1|saida[10]~10_combout\);

\ULA1|Add0~45_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~45_wirecell_combout\ = !\ULA1|Add0~45_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~45_sumout\,
	combout => \ULA1|Add0~45_wirecell_combout\);

\bancoRegistradores|registrador~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~45_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~49_q\);

\bancoRegistradores|registrador~305\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~45_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~305_q\);

\bancoRegistradores|registrador~1073\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1073_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~49_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~305_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~49_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~305_q\,
	combout => \bancoRegistradores|registrador~1073_combout\);

\ULA1|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~45_sumout\ = SUM(( (\bancoRegistradores|registrador~1073_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~42\ ))
-- \ULA1|Add0~46\ = CARRY(( (\bancoRegistradores|registrador~1073_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1073_combout\,
	cin => \ULA1|Add0~42\,
	sumout => \ULA1|Add0~45_sumout\,
	cout => \ULA1|Add0~46\);

\ULA1|saida[11]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[11]~11_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~45_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~45_sumout\,
	combout => \ULA1|saida[11]~11_combout\);

\bancoRegistradores|registrador~50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~49_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~50_q\);

\bancoRegistradores|registrador~306\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~49_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~306_q\);

\bancoRegistradores|registrador~1074\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1074_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~50_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~306_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~50_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~306_q\,
	combout => \bancoRegistradores|registrador~1074_combout\);

\ULA1|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~49_sumout\ = SUM(( (\bancoRegistradores|registrador~1074_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~46\ ))
-- \ULA1|Add0~50\ = CARRY(( (\bancoRegistradores|registrador~1074_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1074_combout\,
	cin => \ULA1|Add0~46\,
	sumout => \ULA1|Add0~49_sumout\,
	cout => \ULA1|Add0~50\);

\ULA1|saida[12]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[12]~12_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~49_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~49_sumout\,
	combout => \ULA1|saida[12]~12_combout\);

\ULA1|Add0~53_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~53_wirecell_combout\ = !\ULA1|Add0~53_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~53_sumout\,
	combout => \ULA1|Add0~53_wirecell_combout\);

\bancoRegistradores|registrador~51\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~53_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~51_q\);

\bancoRegistradores|registrador~307\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~53_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~307_q\);

\bancoRegistradores|registrador~1075\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1075_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~51_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~307_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~51_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~307_q\,
	combout => \bancoRegistradores|registrador~1075_combout\);

\ULA1|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~53_sumout\ = SUM(( (\bancoRegistradores|registrador~1075_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~50\ ))
-- \ULA1|Add0~54\ = CARRY(( (\bancoRegistradores|registrador~1075_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1075_combout\,
	cin => \ULA1|Add0~50\,
	sumout => \ULA1|Add0~53_sumout\,
	cout => \ULA1|Add0~54\);

\ULA1|saida[13]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[13]~13_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~53_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~53_sumout\,
	combout => \ULA1|saida[13]~13_combout\);

\bancoRegistradores|registrador~52\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~57_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~52_q\);

\bancoRegistradores|registrador~308\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~57_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~308_q\);

\bancoRegistradores|registrador~1076\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1076_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~52_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~308_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~52_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~308_q\,
	combout => \bancoRegistradores|registrador~1076_combout\);

\ULA1|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~57_sumout\ = SUM(( (\bancoRegistradores|registrador~1076_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~54\ ))
-- \ULA1|Add0~58\ = CARRY(( (\bancoRegistradores|registrador~1076_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1076_combout\,
	cin => \ULA1|Add0~54\,
	sumout => \ULA1|Add0~57_sumout\,
	cout => \ULA1|Add0~58\);

\ULA1|saida[14]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[14]~14_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~57_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~57_sumout\,
	combout => \ULA1|saida[14]~14_combout\);

\ULA1|Add0~61_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~61_wirecell_combout\ = !\ULA1|Add0~61_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~61_sumout\,
	combout => \ULA1|Add0~61_wirecell_combout\);

\bancoRegistradores|registrador~53\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~61_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~53_q\);

\bancoRegistradores|registrador~309\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~61_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~309_q\);

\bancoRegistradores|registrador~1077\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1077_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~53_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~309_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~53_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~309_q\,
	combout => \bancoRegistradores|registrador~1077_combout\);

\ULA1|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~61_sumout\ = SUM(( (\bancoRegistradores|registrador~1077_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~58\ ))
-- \ULA1|Add0~62\ = CARRY(( (\bancoRegistradores|registrador~1077_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1077_combout\,
	cin => \ULA1|Add0~58\,
	sumout => \ULA1|Add0~61_sumout\,
	cout => \ULA1|Add0~62\);

\ULA1|saida[15]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[15]~15_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~61_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~61_sumout\,
	combout => \ULA1|saida[15]~15_combout\);

\bancoRegistradores|registrador~54\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~65_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~54_q\);

\bancoRegistradores|registrador~310\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~65_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~310_q\);

\bancoRegistradores|registrador~1078\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1078_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~54_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~310_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~54_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~310_q\,
	combout => \bancoRegistradores|registrador~1078_combout\);

\ULA1|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~65_sumout\ = SUM(( (\bancoRegistradores|registrador~1078_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~62\ ))
-- \ULA1|Add0~66\ = CARRY(( (\bancoRegistradores|registrador~1078_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1078_combout\,
	cin => \ULA1|Add0~62\,
	sumout => \ULA1|Add0~65_sumout\,
	cout => \ULA1|Add0~66\);

\ULA1|saida[16]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[16]~16_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~65_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~65_sumout\,
	combout => \ULA1|saida[16]~16_combout\);

\ULA1|Add0~69_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~69_wirecell_combout\ = !\ULA1|Add0~69_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~69_sumout\,
	combout => \ULA1|Add0~69_wirecell_combout\);

\bancoRegistradores|registrador~55\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~69_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~55_q\);

\bancoRegistradores|registrador~311\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~69_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~311_q\);

\bancoRegistradores|registrador~1079\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1079_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~55_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~311_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~55_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~311_q\,
	combout => \bancoRegistradores|registrador~1079_combout\);

\ULA1|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~69_sumout\ = SUM(( (\bancoRegistradores|registrador~1079_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~66\ ))
-- \ULA1|Add0~70\ = CARRY(( (\bancoRegistradores|registrador~1079_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1079_combout\,
	cin => \ULA1|Add0~66\,
	sumout => \ULA1|Add0~69_sumout\,
	cout => \ULA1|Add0~70\);

\ULA1|saida[17]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[17]~17_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~69_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~69_sumout\,
	combout => \ULA1|saida[17]~17_combout\);

\bancoRegistradores|registrador~56\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~73_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~56_q\);

\bancoRegistradores|registrador~312\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~73_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~312_q\);

\bancoRegistradores|registrador~1080\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1080_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~56_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~312_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~56_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~312_q\,
	combout => \bancoRegistradores|registrador~1080_combout\);

\ULA1|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~73_sumout\ = SUM(( (\bancoRegistradores|registrador~1080_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~70\ ))
-- \ULA1|Add0~74\ = CARRY(( (\bancoRegistradores|registrador~1080_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1080_combout\,
	cin => \ULA1|Add0~70\,
	sumout => \ULA1|Add0~73_sumout\,
	cout => \ULA1|Add0~74\);

\ULA1|saida[18]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[18]~18_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~73_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~73_sumout\,
	combout => \ULA1|saida[18]~18_combout\);

\ULA1|Add0~77_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~77_wirecell_combout\ = !\ULA1|Add0~77_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~77_sumout\,
	combout => \ULA1|Add0~77_wirecell_combout\);

\bancoRegistradores|registrador~57\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~77_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~57_q\);

\bancoRegistradores|registrador~313\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~77_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~313_q\);

\bancoRegistradores|registrador~1081\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1081_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~57_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~313_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~57_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~313_q\,
	combout => \bancoRegistradores|registrador~1081_combout\);

\ULA1|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~77_sumout\ = SUM(( (\bancoRegistradores|registrador~1081_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~74\ ))
-- \ULA1|Add0~78\ = CARRY(( (\bancoRegistradores|registrador~1081_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1081_combout\,
	cin => \ULA1|Add0~74\,
	sumout => \ULA1|Add0~77_sumout\,
	cout => \ULA1|Add0~78\);

\ULA1|saida[19]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[19]~19_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~77_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~77_sumout\,
	combout => \ULA1|saida[19]~19_combout\);

\bancoRegistradores|registrador~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~81_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~58_q\);

\bancoRegistradores|registrador~314\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~81_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~314_q\);

\bancoRegistradores|registrador~1082\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1082_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~58_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~314_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~58_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~314_q\,
	combout => \bancoRegistradores|registrador~1082_combout\);

\ULA1|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~81_sumout\ = SUM(( (\bancoRegistradores|registrador~1082_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~78\ ))
-- \ULA1|Add0~82\ = CARRY(( (\bancoRegistradores|registrador~1082_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1082_combout\,
	cin => \ULA1|Add0~78\,
	sumout => \ULA1|Add0~81_sumout\,
	cout => \ULA1|Add0~82\);

\ULA1|saida[20]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[20]~20_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~81_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~81_sumout\,
	combout => \ULA1|saida[20]~20_combout\);

\ULA1|Add0~85_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~85_wirecell_combout\ = !\ULA1|Add0~85_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~85_sumout\,
	combout => \ULA1|Add0~85_wirecell_combout\);

\bancoRegistradores|registrador~59\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~85_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~59_q\);

\bancoRegistradores|registrador~315\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~85_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~315_q\);

\bancoRegistradores|registrador~1083\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1083_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~59_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~315_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~59_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~315_q\,
	combout => \bancoRegistradores|registrador~1083_combout\);

\ULA1|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~85_sumout\ = SUM(( (\bancoRegistradores|registrador~1083_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~82\ ))
-- \ULA1|Add0~86\ = CARRY(( (\bancoRegistradores|registrador~1083_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1083_combout\,
	cin => \ULA1|Add0~82\,
	sumout => \ULA1|Add0~85_sumout\,
	cout => \ULA1|Add0~86\);

\ULA1|saida[21]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[21]~21_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~85_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~85_sumout\,
	combout => \ULA1|saida[21]~21_combout\);

\bancoRegistradores|registrador~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~89_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~60_q\);

\bancoRegistradores|registrador~316\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~89_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~316_q\);

\bancoRegistradores|registrador~1084\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1084_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~60_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~316_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~60_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~316_q\,
	combout => \bancoRegistradores|registrador~1084_combout\);

\ULA1|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~89_sumout\ = SUM(( (\bancoRegistradores|registrador~1084_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~86\ ))
-- \ULA1|Add0~90\ = CARRY(( (\bancoRegistradores|registrador~1084_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1084_combout\,
	cin => \ULA1|Add0~86\,
	sumout => \ULA1|Add0~89_sumout\,
	cout => \ULA1|Add0~90\);

\ULA1|saida[22]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[22]~22_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~89_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~89_sumout\,
	combout => \ULA1|saida[22]~22_combout\);

\ULA1|Add0~93_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~93_wirecell_combout\ = !\ULA1|Add0~93_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~93_sumout\,
	combout => \ULA1|Add0~93_wirecell_combout\);

\bancoRegistradores|registrador~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~93_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~61_q\);

\bancoRegistradores|registrador~317\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~93_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~317_q\);

\bancoRegistradores|registrador~1085\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1085_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~61_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~317_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~61_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~317_q\,
	combout => \bancoRegistradores|registrador~1085_combout\);

\ULA1|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~93_sumout\ = SUM(( (\bancoRegistradores|registrador~1085_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~90\ ))
-- \ULA1|Add0~94\ = CARRY(( (\bancoRegistradores|registrador~1085_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1085_combout\,
	cin => \ULA1|Add0~90\,
	sumout => \ULA1|Add0~93_sumout\,
	cout => \ULA1|Add0~94\);

\ULA1|saida[23]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[23]~23_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~93_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~93_sumout\,
	combout => \ULA1|saida[23]~23_combout\);

\bancoRegistradores|registrador~62\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~97_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~62_q\);

\bancoRegistradores|registrador~318\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~97_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~318_q\);

\bancoRegistradores|registrador~1086\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1086_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~62_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~318_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~62_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~318_q\,
	combout => \bancoRegistradores|registrador~1086_combout\);

\ULA1|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~97_sumout\ = SUM(( (\bancoRegistradores|registrador~1086_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~94\ ))
-- \ULA1|Add0~98\ = CARRY(( (\bancoRegistradores|registrador~1086_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1086_combout\,
	cin => \ULA1|Add0~94\,
	sumout => \ULA1|Add0~97_sumout\,
	cout => \ULA1|Add0~98\);

\ULA1|saida[24]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[24]~24_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~97_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~97_sumout\,
	combout => \ULA1|saida[24]~24_combout\);

\ULA1|Add0~101_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~101_wirecell_combout\ = !\ULA1|Add0~101_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~101_sumout\,
	combout => \ULA1|Add0~101_wirecell_combout\);

\bancoRegistradores|registrador~63\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~101_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~63_q\);

\bancoRegistradores|registrador~319\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~101_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~319_q\);

\bancoRegistradores|registrador~1087\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1087_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~63_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~319_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~63_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~319_q\,
	combout => \bancoRegistradores|registrador~1087_combout\);

\ULA1|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~101_sumout\ = SUM(( (\bancoRegistradores|registrador~1087_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~98\ ))
-- \ULA1|Add0~102\ = CARRY(( (\bancoRegistradores|registrador~1087_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1087_combout\,
	cin => \ULA1|Add0~98\,
	sumout => \ULA1|Add0~101_sumout\,
	cout => \ULA1|Add0~102\);

\ULA1|saida[25]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[25]~25_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~101_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~101_sumout\,
	combout => \ULA1|saida[25]~25_combout\);

\bancoRegistradores|registrador~64\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~105_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~64_q\);

\bancoRegistradores|registrador~320\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~105_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~320_q\);

\bancoRegistradores|registrador~1088\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1088_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~64_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~320_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~64_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~320_q\,
	combout => \bancoRegistradores|registrador~1088_combout\);

\ULA1|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~105_sumout\ = SUM(( (\bancoRegistradores|registrador~1088_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~102\ ))
-- \ULA1|Add0~106\ = CARRY(( (\bancoRegistradores|registrador~1088_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1088_combout\,
	cin => \ULA1|Add0~102\,
	sumout => \ULA1|Add0~105_sumout\,
	cout => \ULA1|Add0~106\);

\ULA1|saida[26]~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[26]~26_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~105_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~105_sumout\,
	combout => \ULA1|saida[26]~26_combout\);

\ULA1|Add0~109_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~109_wirecell_combout\ = !\ULA1|Add0~109_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~109_sumout\,
	combout => \ULA1|Add0~109_wirecell_combout\);

\bancoRegistradores|registrador~65\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~109_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~65_q\);

\bancoRegistradores|registrador~321\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~109_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~321_q\);

\bancoRegistradores|registrador~1089\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1089_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~65_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~321_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~65_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~321_q\,
	combout => \bancoRegistradores|registrador~1089_combout\);

\ULA1|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~109_sumout\ = SUM(( (\bancoRegistradores|registrador~1089_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~106\ ))
-- \ULA1|Add0~110\ = CARRY(( (\bancoRegistradores|registrador~1089_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1089_combout\,
	cin => \ULA1|Add0~106\,
	sumout => \ULA1|Add0~109_sumout\,
	cout => \ULA1|Add0~110\);

\ULA1|saida[27]~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[27]~27_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~109_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~109_sumout\,
	combout => \ULA1|saida[27]~27_combout\);

\bancoRegistradores|registrador~66\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~113_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~66_q\);

\bancoRegistradores|registrador~322\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~113_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~322_q\);

\bancoRegistradores|registrador~1090\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1090_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~66_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~322_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~66_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~322_q\,
	combout => \bancoRegistradores|registrador~1090_combout\);

\ULA1|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~113_sumout\ = SUM(( (\bancoRegistradores|registrador~1090_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~110\ ))
-- \ULA1|Add0~114\ = CARRY(( (\bancoRegistradores|registrador~1090_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1090_combout\,
	cin => \ULA1|Add0~110\,
	sumout => \ULA1|Add0~113_sumout\,
	cout => \ULA1|Add0~114\);

\ULA1|saida[28]~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[28]~28_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~113_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~113_sumout\,
	combout => \ULA1|saida[28]~28_combout\);

\ULA1|Add0~117_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~117_wirecell_combout\ = !\ULA1|Add0~117_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~117_sumout\,
	combout => \ULA1|Add0~117_wirecell_combout\);

\bancoRegistradores|registrador~67\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~117_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~67_q\);

\bancoRegistradores|registrador~323\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~117_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~323_q\);

\bancoRegistradores|registrador~1091\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1091_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~67_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~323_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~67_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~323_q\,
	combout => \bancoRegistradores|registrador~1091_combout\);

\ULA1|Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~117_sumout\ = SUM(( (\bancoRegistradores|registrador~1091_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~114\ ))
-- \ULA1|Add0~118\ = CARRY(( (\bancoRegistradores|registrador~1091_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1091_combout\,
	cin => \ULA1|Add0~114\,
	sumout => \ULA1|Add0~117_sumout\,
	cout => \ULA1|Add0~118\);

\ULA1|saida[29]~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[29]~29_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~117_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~117_sumout\,
	combout => \ULA1|saida[29]~29_combout\);

\bancoRegistradores|registrador~68\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~121_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~68_q\);

\bancoRegistradores|registrador~324\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~121_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~324_q\);

\bancoRegistradores|registrador~1092\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1092_combout\ = (!\ROM1|memROM~0_combout\ & (((\bancoRegistradores|registrador~68_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~324_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000011101000011000001110100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~68_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~324_q\,
	combout => \bancoRegistradores|registrador~1092_combout\);

\ULA1|Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~121_sumout\ = SUM(( (\bancoRegistradores|registrador~1092_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~118\ ))
-- \ULA1|Add0~122\ = CARRY(( (\bancoRegistradores|registrador~1092_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ULA1|ALT_INV_Equal1~0_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1092_combout\,
	cin => \ULA1|Add0~118\,
	sumout => \ULA1|Add0~121_sumout\,
	cout => \ULA1|Add0~122\);

\ULA1|saida[30]~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[30]~30_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~121_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~121_sumout\,
	combout => \ULA1|saida[30]~30_combout\);

\ULA1|Add0~125_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~125_wirecell_combout\ = !\ULA1|Add0~125_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA1|ALT_INV_Add0~125_sumout\,
	combout => \ULA1|Add0~125_wirecell_combout\);

\bancoRegistradores|registrador~69\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~125_wirecell_combout\,
	asdata => VCC,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1094_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~69_q\);

\bancoRegistradores|registrador~325\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \ULA1|Add0~125_sumout\,
	asdata => \~GND~combout\,
	sload => \OP[1]~input_o\,
	ena => \bancoRegistradores|registrador~1095_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bancoRegistradores|registrador~325_q\);

\bancoRegistradores|registrador~1093\ : cyclonev_lcell_comb
-- Equation(s):
-- \bancoRegistradores|registrador~1093_combout\ = (!\ROM1|memROM~0_combout\ & (((!\bancoRegistradores|registrador~69_q\)))) # (\ROM1|memROM~0_combout\ & (\PC|DOUT\(2) & ((\bancoRegistradores|registrador~325_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011010001110000001101000111000000110100011100000011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(2),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \bancoRegistradores|ALT_INV_registrador~69_q\,
	datad => \bancoRegistradores|ALT_INV_registrador~325_q\,
	combout => \bancoRegistradores|registrador~1093_combout\);

\ULA1|Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|Add0~125_sumout\ = SUM(( (\bancoRegistradores|registrador~1093_combout\ & ((\ROM1|memROM~0_combout\) # (\ROM1|memROM~1_combout\))) ) + ( !\ULA1|Equal1~0_combout\ ) + ( \ULA1|Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000000001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \ULA1|ALT_INV_Equal1~0_combout\,
	datad => \bancoRegistradores|ALT_INV_registrador~1093_combout\,
	cin => \ULA1|Add0~122\,
	sumout => \ULA1|Add0~125_sumout\);

\ULA1|saida[31]~31\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA1|saida[31]~31_combout\ = (!\OP[1]~input_o\ & \ULA1|Add0~125_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_OP[1]~input_o\,
	datab => \ULA1|ALT_INV_Add0~125_sumout\,
	combout => \ULA1|saida[31]~31_combout\);

\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);
END structure;


