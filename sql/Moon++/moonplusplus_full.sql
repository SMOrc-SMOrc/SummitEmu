/* moonplusplus_full.sql
This file contains every SQL query needed by our blizzlike scripts */


/* INSTANCE SCRIPTS */


/* Karazhan */

-- needed for Prince Malchezaar Infernals to work properly
UPDATE `creature_proto` SET `faction` = 14, `minhealth` = 10000000, `maxhealth` = 10000000 WHERE `entry` = 17646;
-- Level,HP, Damage fix for Prince Malchezaar Axes
UPDATE `creature_proto` SET `minlevel` = 73, `maxlevel` = 73, `minhealth`=99999999, `maxhealth`=99999999, `maxdamage`=600, `mindamage`=400 WHERE `entry`= 1765;
-- Netherspite Infernal Level Fix, so players dont resist its spells
update `creature_proto` set `maxlevel`='70', `minlevel`='70' where `entry`= 17646;
-- Shade of Aran Water Elemental Damage fix
UPDATE `creature_proto` SET `maxdamage`=1500, `mindamage`=1000 WHERE `entry`=17167;
-- Totem of Spirit nerf, so players cannot use them as pets (untill this quest gets scripted)
UPDATE `creature_proto` SET `minhealth`='1', `maxhealth`='1', `maxdamage`='1', `attacktime`='140000', `mindamage`='1' WHERE `entry`='21071';
-- Opera Stage Right Door should be closed by default, whoever sniffed NCDB GO's in kara, did it after the instance was fully cleared.
update `gameobject_spawns` set `State`='1' where `id`='102508';
-- Berthold Flag Fix
update `creature_names` set `Flags1` = 1 where `entry`= 16153;
update `creature_spawns` set `flags`= 1 where `id`= 16153;
update `creature_proto` set `npcflags`= 1 where `entry`= 16153;
-- Curator Scale Fix
update `creature_proto` set `scale`= 5 where `entry`= 15691;
update `creature_proto` set `scale`='5' where `entry`='15691';


/* The Eye */

/*Solarian & Friends faction chain pull, & so they dont attack eachother*/
UPDATE creature_proto SET faction = 16 where entry = 18925;
UPDATE creature_proto SET faction = 16 where entry = 18806;
UPDATE creature_proto SET faction = 16 where entry = 18805;
-- remove void reaver agent
DELETE FROM ai_agents WHERE entry=19516;
-- Void Reaver: arcane orb target
UPDATE creature_names SET male_displayid =11686,female_displayid =0 WHERE entry =19577;
-- Void Reaver: arcane orb target
UPDATE creature_proto SET faction =14,minlevel =70,maxlevel =70 WHERE entry =19577;

-- Delete Kael's Advisors loot, they should not drop the legendaries
delete from creatureloot where entryid in (20064, 20060, 20062, 20063);

-- Advisors should have equiped the legendary weapons
UPDATE creature_proto SET equipmodel1 = 45345, equipinfo1 = 33490690, equipslot1 = 789  where entry = 20060; -- Lord Sanguinar
update creature_proto set equipmodel2 = '40867', equipslot2='1038', equipinfo2='33490436' where entry='20060'; -- Lord Sanguinar Shield

UPDATE creature_proto SET equipmodel1 = 41895, equipinfo1 = 50268674, equipslot1 = 512  where entry = 20062; -- capernian
UPDATE creature_proto SET equipmodel1 = 41872, equipinfo1 = 33490690, equipslot1 = 789  where entry = 20063; -- Telonicus
UPDATE creature_proto SET equipmodel1 = 41560, equipinfo1 = 33490946, equipslot1 = 256  where entry = 20064; -- Thaladred The Darkener

-- Thaladread should 1 shot ppl
UPDATE creature_proto SET mindamage = 15000, maxdamage = 20000 where entry = 20064; -- Thaladred The Darkener

-- Legendary wep's have equip stuff messed up.
update creature_proto set equipmodel1 = '0', equipslot1='0', equipinfo1='0' where entry='21273'; -- Phaseshift Bulwark
update creature_proto set equipmodel2 = '40867', equipslot2='1038', equipinfo2='33490436' where entry='21273'; -- Phaseshift Bulwark

update creature_proto set equipslot1='512',  equipinfo1='50268674' where entry='21274'; -- Staf of disintegraton
update creature_proto set equipslot1='256',  equipinfo1='33490946' where entry='21269'; -- Devastation

-- Needed for Alar
insert into `creature_proto` (`entry`, `minlevel`, `maxlevel`, `faction`, `minhealth`, `maxhealth`, `mana`, `scale`, `bounding_radius`, `auras`) values('20602','70','70','16','10000','10000','0','1','1','0');

/* Dark Portal event */

DELETE FROM creature_spawns WHERE entry = 18625;
DELETE FROM creature_proto WHERE entry = 18625;
DELETE FROM creature_names WHERE entry = 18625;
INSERT INTO `creature_names` (`entry`, `name`, `subname`, `info_str`, `Flags1`, `type`, `family`, `rank`, `unk4`, `spelldataid`, `male_displayid`, `female_displayid`, `male_displayid2`, `female_displayid2`, `unknown_float1`, `unknown_float2`, `civilian`, `leader`) VALUES
('18625','Dark Portal Event Trigger','','','0','10','0','0','0','0',169,0,0,0,'1','1','0',0);
INSERT INTO `creature_proto` (`entry`, `minlevel`, `maxlevel`, `faction`, `minhealth`, `maxhealth`, `mana`, `scale`, `npcflags`, `attacktime`, `mindamage`, `maxdamage`, `rangedattacktime`, `rangedmindamage`, `rangedmaxdamage`, `mountdisplayid`, `equipmodel1`, `equipinfo1`, `equipslot1`, `equipmodel2`, `equipinfo2`, `equipslot2`, `equipmodel3`, `equipinfo3`, `equipslot3`, `respawntime`, `armor`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `combat_reach`, `bounding_radius`, `auras`, `boss`, `money`, `invisibility_type`, `death_state`, `walk_speed`, `run_speed`, `fly_speed`, `extra_a9_flags`) VALUES
('18625','70','70','35','1000000','1000000','0','0','1758','1000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','2.5','8','14',0);
INSERT INTO `creature_spawns` (`entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`) VALUES
(18625,530,'-263.719','1101.18','73.7167','4.64415',0,'169',35,33554432,0,0,0,0,0,0,0);
UPDATE creature_proto SET faction = 1757 WHERE entry = 18966;
UPDATE creature_spawns SET faction = 1757 WHERE entry = 18966;


/* The Deadmines */

UPDATE `gameobject_spawns` SET `flags` = '1' WHERE `entry` = '13965';
UPDATE `gameobject_spawns` SET `flags` = '1' WHERE `entry` = '16400';
UPDATE `gameobject_spawns` SET `flags` = '1' WHERE `entry` = '16399';
DELETE FROM `creature_spawns` WHERE `entry` = '643';


/* Black Temple */

-- Warlord Kalithresh

INSERT INTO `creature_spawns` (`entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`) VALUES
(17954,545,'-107.059','-543.903','8.27027','5.89921',0,'17423',14,0,16908544,4097,0,0,0,0,0,0),
(17954,545,'-80.7551','-550.946','8.27027','3.80482',0,'17423',14,0,16908544,4097,0,0,0,0,0,0),
(17954,545,'-96.2409','-571.375','8.27027','2.3911',0,'17423',14,0,16908544,4097,0,0,0,0,0,0),
(17954,545,'-74.3098','-520.419','8.25508','4.61263',0,'17423',14,256,0,0,0,0,0,0,0,0),
(17954,545,'-116.221','-520.14','8.19892','5.12707',0,'17423',14,256,0,0,0,0,0,0,0,0),
(17954,545,'-76.881','-489.165','8.23619','2.10328',0,'17423',14,256,0,0,0,0,0,0,0,0),
(17954,545,'-113.184','-488.599','8.19631','6.13473',0,'17423',14,256,0,0,0,0,0,0,0,0);

-- Shadowy Constructs (Teron Gorefiend encounter)

-- REPLACE INTO `creature_names` VALUES ('23111', 'Shadowy Construct', '', '0', '0', '6', '0', '1', '0', null, '21305', '0', '0', '0', '8.5', '1', '0', null);
-- REPLACE INTO `creature_proto` VALUES ('23111', '70', '70', '14', '59000', '59000', '100', '1', '0', '1000', '660', '990', '1200', '87', '104', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '300000', '2035', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '2.5', '8', '14', '0');

-- Illidan Encounter

REPLACE INTO creature_names (`entry`, `name`, `subname`, `info_str`, `Flags1`, `type`, `family`, `rank`, `unk4`, `spelldataid`, `male_displayid`, `female_displayid`, `male_displayid2`, `female_displayid2`, `unknown_float1`, `unknown_float2`, `civilian`, `leader`) VALUES 
(22917, 'Illidan Stormrage', 'The Betrayer', '', 0, 3, 0, 3, 0, 0, 21135, 0, 0, 0, 2, 1, 0, 1),
(22990, 'Akama', '', '', 0, 7, 0, 3, 0, 0, 20681, 0, 0, 0, 1, 1, 0, 0),
(22996, 'Blade of Azzinoth', '', '', 0, 0, 0, 0, 0, 0, 21431, 0, 0, 0, 1, 1, 0, 0),
(22997, 'Flame of Azzinoth', '', '', 0, 3, 0, 0, 0, 0, 20431, 0, 0, 0, 1, 1, 0, 0),
(23197, 'Maiev Shadowsong', '', '', 0, 10, 0, 3, 0, 0, 20628, 0, 0, 0, 1, 1, 0, 0),
(23259, 'Blaze', 'Blaze Effect', '', 0, 0, 0, 0, 0, 0, 15294, 0, 0, 0, 1, 1, 0, 0),
(23336, 'Flame Crash', 'Flame Crash Effect', '', 0, 0, 0, 0, 0, 0, 15294, 0, 0, 0, 1, 1, 0, 0),
(30000, 'Trigger', '', '', 0, 0, 0, 0, 0, 0, 15294, 0, 0, 0, 1, 1, 0, 0),
(23069, 'Demon Fire', ' ', '', 0, 0, 0, 0, 0, 0, 15294, 0, 0, 0, 1, 1, 0, 0),
(30001, 'Door Event Trigger', ' ', '', 0, 0, 0, 0, 0, 0, 15294, 0, 0, 0, 1, 1, 0, 0);

REPLACE INTO creature_proto (`entry`, `minlevel`, `maxlevel`, `faction`, `minhealth`, `maxhealth`, `mana`, `scale`, `npcflags`, `attacktime`, `mindamage`, `maxdamage`, `rangedattacktime`, `rangedmindamage`, `rangedmaxdamage`, `mountdisplayid`, `equipmodel1`, `equipinfo1`, `equipslot1`, `equipmodel2`, `equipinfo2`, `equipslot2`, `equipmodel3`, `equipinfo3`, `equipslot3`, `respawntime`, `armor`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `combat_reach`, `bounding_radius`, `auras`, `boss`, `money`, `invisibility_type`, `death_state`, `walk_speed`, `run_speed`, `fly_speed`, `extra_a9_flags`) VALUES 
(22917, 73, 73, 1825, 5534309, 5534309, 6774, 1.3, 0, 2000, 10000, 14000, 0, 0, 0, 0, 45479, 33488898, 0, 45481, 33488898, 0, 0, 0, 0, 360000, 8000, 25, 25, 25, 25, 25, 25, 1.25, 1, "", 1, 0, 0, 0, 2.5, 8, 14, 0),
(22990, 73, 73, 1858, 480000, 480000, 338700, 2.0, 1, 2000, 350, 550, 0, 0, 0, 0, 43903, 33488898, 781, 43903, 33488898, 781, 0, 0, 0, 360000, 0, 0, 0, 0, 0, 0, 0, 1.3, 1.3, "", 0, 0, 0, 0, 2.5, 8, 14, 0),
(22996, 73, 73, 35, 16000, 16000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, " ", 1, 0, 0, 0, 2.5, 8, 14, 0),
(22997, 73, 73, 1825, 1100000, 1100000, 0, 4, 0, 2000, 650, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3600, 0, 0, 0, 0, 0, 0, 0, 2, 3, "", 0, 0, 0, 0, 2.5, 8, 14, 0),
(23197, 73, 73, 1867, 27000, 27000, 3387, 2, 0, 2000, 643, 898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 360000, 0, 0, 0, 0, 0, 0, 0, 2, 1, "", 1, 0, 0, 0, 2.5, 8, 14, 0),
(23259, 70, 70, 1825, 6000, 6000, 6000, 1, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 8, 14, 0),
(23336, 70, 70, 1825, 6000, 6000, 6000, 1, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 8, 14, 0),
(23069, 70, 70, 1825, 100000, 100000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 8, 14, 0),
(30000, 70, 70, 1825, 100000, 100000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 8, 14, 0),
(30001, 70, 70, 35, 100000, 100000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 8, 14, 0);

delete from creature_spawns where entry in (22917, 22990, 22996, 22997, 23336, 30001);
INSERT INTO creature_spawns (`entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`) VALUES 
(22917, 564, 704.539, 305.282, 353.919, 6.14417, 0, 21135, 1825, 256, 0, 0, 0, 0, 0, 0, 0),
(22990, 564, 661.563, 305.711, 271.689, 0.00628138, 4, 20681, 1858, 256, 0, 1, 0, 0, 0, 0, 0),
(30001, 564, 771.5, 304.7, 319, 3.10568, 0, 15294, 35, 0, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO gameobject_names (entry, Type, DisplayID, Name, spellfocus, sound1, sound2, sound3, sound4, sound5, sound6, sound7, sound8, sound9, unknown1, unknown2, unknown3, unknown4, unknown5, unknown6, unknown7, unknown8, unknown9, unknown10, unknown11, unknown12, unknown13, unknown14) VALUES 
(185905, 0, 7388, "Gate", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200000, 0, 7421, 'BT_ILLIDAN_DOOR_RIGHT', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200001, 0, 7422, 'BT_ILLIDAN_DOOR_LEFT', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

delete from gameobject_spawns where entry in (185905, 200000, 200001);
INSERT INTO gameobject_spawns (Entry, map, position_x, position_y, position_z, Facing, orientation1, orientation2, orientation3, orientation4, State, Flags, Faction, Scale, stateNpcLink) VALUES 
(185905, 564, 774.7, 304.6, 314.85, 1.53, 0, 0, 0.706767, 0.707446, 1, 1, 0, 1, 0),
(200000, 564, 745.07, 241.802, 354.292, 0.79225, 0, 0, 0.385846, 0.922563, 0, 1, 0, 1, 0),
(200001, 564, 744.829, 369.276, 354.324, 2.35855, 0, 0, 0.92433, 0.381594, 0, 1, 0, 1, 0);

REPLACE INTO npc_text (`entry`, `prob0`, `text0_0`, `text0_1`, `lang0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `prob1`, `text1_0`, `text1_1`, `lang1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `prob2`, `text2_0`, `text2_1`, `lang2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `prob3`, `text3_0`, `text3_1`, `lang3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `prob4`, `text4_0`, `text4_1`, `lang4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `prob5`, `text5_0`, `text5_1`, `lang5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `prob6`, `text6_0`, `text6_1`, `lang6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `prob7`, `text7_0`, `text7_1`, `lang7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES 
(229901, 1, 'The time has come to face Illidan, $N. Are you ready?', 'The time has come to face Illidan, $N. Are you ready?', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0),
(229902, 1, 'Be wary, friends. The Betrayer meditates in the court just beyond.', 'Be wary, friends. The Betrayer meditates in the court just beyond.', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0, 0, ' ', ' ', 0, 0, 0, 0, 0, 0, 0);


/* Naxxramas */

-- Kel'thuzad Encounter

REPLACE INTO creature_names (`entry`, `name`, `subname`, `info_str`, `Flags1`, `type`, `family`, `rank`, `unk4`, `spelldataid`, `male_displayid`, `female_displayid`, `male_displayid2`, `female_displayid2`, `unknown_float1`, `unknown_float2`, `civilian`, `leader`) VALUES 
(15990, 'Kel\'Thuzad', '', '', 76, 6, 0, 3, 0, 0, 15945, 0, 0, 0, 1, 1, 0, 0),
(16427, 'Soldier of the Frozen Wastes', '', '', 8, 6, 0, 1, 0, 0, 7869, 0, 0, 0, 1, 1, 0, 0),
(16428, 'Unstoppable Abomination', '', '', 8, 6, 0, 1, 0, 0, 12818, 0, 0, 0, 1, 1, 0, 0),
(16429, 'Soul Weaver', '', '', 8, 6, 0, 1, 0, 0, 16178, 0, 0, 0, 1, 1, 0, 0),
(16441, 'Guardian of Icecrown', '', '', 8, 6, 0, 0, 0, 0, 16586, 0, 0, 0, 1, 1, 0, 0),
(30002, 'The Lich King', ' ', '', 0, 0, 0, 0, 0, 0, 15294, 0, 0, 0, 1, 1, 0, 0);

REPLACE INTO creature_proto (`entry`, `minlevel`, `maxlevel`, `faction`, `minhealth`, `maxhealth`, `mana`, `scale`, `npcflags`, `attacktime`, `mindamage`, `maxdamage`, `rangedattacktime`, `rangedmindamage`, `rangedmaxdamage`, `mountdisplayid`, `equipmodel1`, `equipinfo1`, `equipslot1`, `equipmodel2`, `equipinfo2`, `equipslot2`, `equipmodel3`, `equipinfo3`, `equipslot3`, `respawntime`, `armor`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `combat_reach`, `bounding_radius`, `auras`, `boss`, `money`, `invisibility_type`, `death_state`, `walk_speed`, `run_speed`, `fly_speed`, `extra_a9_flags`) VALUES 
(15990, 73, 73, 14, 2527186, 2527186, 1572000, 4, 0, 1150, 950, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.842, '0', 0, 277838, 0, 0, 2.5, 8, 14, 0),
(16427, 60, 60, 14, 8900, 8900, 0, 1.5, 0, 1550, 1750, 2250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 2.5, 14, 0),
(16428, 60, 60, 14, 97000, 97000, 0, 2, 0, 1250, 1550, 2300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 2.5, 14, 0),
(16429, 60, 60, 14, 70000, 70000, 0, 2.5, 0, 1500, 366, 472.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 2.5, 14, 0),
(16441, 60, 60, 14, 350000, 350000, 0, 0.5, 0, 1250, 3150, 4100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 8, 14, 0),
(30002, 70, 70, 14, 100000, 100000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '0', 0, 0, 0, 0, 2.5, 8, 14, 0);

DELETE FROM creature_spawns WHERE entry IN (15990, 30002);
INSERT INTO creature_spawns (`entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`) VALUES 
(15990, 533, 3749.95, -5113.46, 142.03, 2.92278, 0, 15945, 14, 0, 0, 0, 0, 0, 0, 0, 0),
(30002, 533, 3767.58, -5117.15, 174.49, 2.95544, 0, 15294, 14, 33554432, 0, 0, 0, 0, 0, 0, 0);

REPLACE INTO gameobject_names (`entry`, `Type`, `DisplayID`, `Name`, `spellfocus`, `sound1`, `sound2`, `sound3`, `sound4`, `sound5`, `sound6`, `sound7`, `sound8`, `sound9`, `unknown1`, `unknown2`, `unknown3`, `unknown4`, `unknown5`, `unknown6`, `unknown7`, `unknown8`, `unknown9`, `unknown10`, `unknown11`, `unknown12`, `unknown13`, `unknown14`) VALUES 
(181228, 0, 6675, 'KelThuzad Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(181640, 7, 6690, 'Doodad_kelthuzad_throne02', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200002, 0, 6770, 'KELTHUZAD_WINDOW_PORTAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM gameobject_spawns WHERE Entry IN (181640, 181228, 200002);
INSERT INTO gameobject_spawns (`Entry`, `map`, `position_x`, `position_y`, `position_z`, `Facing`, `orientation1`, `orientation2`, `orientation3`, `orientation4`, `State`, `Flags`, `Faction`, `Scale`, `stateNpcLink`) VALUES 
(181640, 533, 3762.47, -5116.29, 143.861, 2.95281, 0, 0, 0.995549, 0.0942488, 1, 1, 0, 1, 0),
(181228, 533, 3635.44, -5090.33, 143.205, 1.38302, 0, 0, 0.637702, 0.770283, 0, 1, 0, 1, 0),
(200002, 533, 3700, -5186.52, 152.211, 1.44024, 0, 0, 0.659474, 0.751728, 1, 1, 0, 1, 0),
(200002, 533, 3761.43, -5174.22, 151.833, 2.15482, 0, 0, 0.880735, 0.47361, 1, 1, 0, 1, 0),
(200002, 533, 3731.97, -5026.51, 154.339, 4.47667, 0, 0, 0.785346, -0.619056, 1, 1, 0, 1, 0),
(200002, 533, 3784.51, -5062.25, 153.354, 3.69184, 0, 0, 0.962392, -0.271665, 1, 1, 0, 1, 0);

-- Sapphiron Encounter

DELETE FROM creature_names WHERE entry IN (50011, 50010, 50012, 50013);
DELETE FROM creature_proto WHERE entry IN (50011, 50010, 50012, 50013);
DELETE FROM gameobject_names WHERE entry = 181225;
DELETE FROM gameobject_spawns WHERE entry = 181225;
INSERT INTO `creature_names` (`entry`, `name`, `subname`, `info_str`, `Flags1`, `type`, `family`, `rank`, `unk4`, `spelldataid`, `male_displayid`, `female_displayid`, `male_displayid2`, `female_displayid2`, `unknown_float1`, `unknown_float2`, `civilian`, `leader`) VALUES
('50011','Sapphiron','','0','0','0','0','0','0','0',13069,0,0,0,'1','1','0',0),
('50010','Sapphiron Frost Breath Trigger','','0','0','0','0','0','0','0',13069,0,0,0,'1','1','0',0),
('50012','Sapphiron','','0','0','0','0','0','0','0',13069,0,0,0,'1','1','0',0),
('50013','Sapphiron','','0','0','0','0','0','0','0',13069,0,0,0,'1','1','0',0);
INSERT INTO `creature_proto` (`entry`, `minlevel`, `maxlevel`, `faction`, `minhealth`, `maxhealth`, `mana`, `scale`, `npcflags`, `attacktime`, `attacktype`, `mindamage`, `maxdamage`, `rangedattacktime`, `rangedmindamage`, `rangedmaxdamage`, `mountdisplayid`, `equipmodel1`, `equipinfo1`, `equipslot1`, `equipmodel2`, `equipinfo2`, `equipslot2`, `equipmodel3`, `equipinfo3`, `equipslot3`, `respawntime`, `armor`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `combat_reach`, `bounding_radius`, `auras`, `boss`, `money`, `invisibility_type`, `death_state`, `walk_speed`, `run_speed`, `fly_speed`, `extra_a9_flags`) VALUES
('50010','70','70','21','100000','100000','0','1','0','10000',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','1.5','1.5','1.5',0),
('50011','70','70','21','100000','100000','0','1','0','10000',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','0','0','0',0),
('50012','70','70','21','100000','100000','0','3','0','10000',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','0','0','0',0),
('50013','70','70','21','100000','100000','0','1','0','10000',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','0','0','0',0);
INSERT INTO `gameobject_names` (`entry`, `Type`, `DisplayID`, `Name`, `spellfocus`, `sound1`, `sound2`, `sound3`, `sound4`, `sound5`, `sound6`, `sound7`, `sound8`, `sound9`, `unknown1`, `unknown2`, `unknown3`, `unknown4`, `unknown5`, `unknown6`, `unknown7`, `unknown8`, `unknown9`, `unknown10`, `unknown11`, `unknown12`, `unknown13`, `unknown14`) VALUES
('181225','0','6695','Frostwyrm Waterfall Door','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `gameobject_spawns` (`Entry`, `map`, `position_x`, `position_y`, `position_z`, `Facing`, `orientation1`, `orientation2`, `orientation3`, `orientation4`, `State`, `Flags`, `Faction`, `Scale`, `stateNpcLink`) VALUES
('181225','533','3536.9','-5159.75','143.666','4.51997','0','0','0.771762','-0.635911','0','1','0','1','0');


/* Magtheridon's Lair */

-- must be filled with Triggers deleted in NCDB

REPLACE INTO `creature_names` (`entry`, `name`, `subname`, `info_str`, `Flags1`, `type`, `family`, `rank`, `unk4`, `spelldataid`, `male_displayid`, `female_displayid`, `male_displayid2`, `female_displayid2`, `unknown_float1`, `unknown_float2`, `civilian`, `leader`) VALUES
('17376','Hellfire Raid Trigger','','','0','10','0','0','0','0',18783,13069,0,0,'1.35','1','0',0),
('17474','Target Trigger','','','0','10','0','0','0','0',169,15435,0,0,'1.35','1','0',0),
('133338','Magtheridon Encounter Trigger','','','0','10','0','0','0','0',169,0,0,0,'1','1','0',0);

REPLACE INTO `creature_proto` (`entry`, `minlevel`, `maxlevel`, `faction`, `minhealth`, `maxhealth`, `mana`, `scale`, `npcflags`, `attacktime`, `attacktype`, `mindamage`, `maxdamage`, `rangedattacktime`, `rangedmindamage`, `rangedmaxdamage`, `mountdisplayid`, `equipmodel1`, `equipinfo1`, `equipslot1`, `equipmodel2`, `equipinfo2`, `equipslot2`, `equipmodel3`, `equipinfo3`, `equipslot3`, `respawntime`, `armor`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `combat_reach`, `bounding_radius`, `auras`, `boss`, `money`, `invisibility_type`, `death_state`, `walk_speed`, `run_speed`, `fly_speed`, `extra_a9_flags`) VALUES
('17376','1','1','35','1','1','0','1','0','1500',0,'3','3.87','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','2','1','0','0',0,'0','0','2.5','8','14',0),
('17474','1','1','35','1','1','0','1','0','1400',0,'3','3.87','0','0','0','0','0','0','0','0','0','0','0','0','0','0','20','0','0','0','0','0','0','1','1','0','0',0,'0','0','2.5','8','14',0),
('133338','70','70','35','1000000','1000000','0','0','1758','1000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0',0,'0','2.5','8','14',0);

DELETE FROM creature_spawns WHERE entry IN (17376, 17474, 133338) AND map = 544;
INSERT INTO `creature_spawns` (`entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`) VALUES
(17376,544,'8.79722','-19.4801','2.53646','3.07178',12,'13069',114,0,16777472,4097,0,0,0,0,0,0),
(17474,544,'13.1331','2.75793','-0.312492','0.264242',12,'15435',35,0,16777472,4097,0,0,0,0,0,0),
(17376,544,'9.3589','23.2286','2.34895','3.89208',12,'13069',114,0,16777472,4097,0,0,0,0,0,0),
(17474,544,'-12.1116','1.01105','-0.303638','6.08346',12,'15435',35,0,16777472,4097,0,0,0,0,0,0),
(17474,544,'-11.3749','-29.1214','-0.312463','4.99445',12,'15435',35,0,16777472,4097,0,0,0,0,0,0),
(17474,544,'-7.10759','25.524','-0.312497','5.1917',12,'15435',35,0,16777472,4097,0,0,0,0,0,0),
(17474,544,'-3.11093','29.1424','-0.31249','5.67216',12,'15435',35,0,16777472,4097,0,0,0,0,0,0),
(17376,544,'-31.471','-34.156','2.3351','1.06465',12,'13069',114,0,16777472,4097,0,0,0,0,0,0),
(17376,544,'-54.2772','2.34374','2.40456','1.3439',12,'13069',114,0,16777472,4097,0,0,0,0,0,0),
(17474,544,'-37.1834','-19.4914','-0.312451','5.05616',12,'15435',35,0,16777472,4097,0,0,0,0,0,0),
(17376,544,'-31.8918','38.4303','2.28647','5.07891',12,'13069',114,0,16777472,4097,0,0,0,0,0,0),
(17474,544,'-29.691','29.643','-0.034676','0.478655',12,'15435',35,0,16777472,4097,0,0,0,0,0,0),
(133338,544,'-16.6199','2.19251','-0.405228','2.98687',0,'169',35,33554432,0,0,0,0,0,0,0,0);

REPLACE INTO `gameobject_names` (`entry`, `Type`, `DisplayID`, `Name`, `spellfocus`, `sound1`, `sound2`, `sound3`, `sound4`, `sound5`, `sound6`, `sound7`, `sound8`, `sound9`, `unknown1`, `unknown2`, `unknown3`, `unknown4`, `unknown5`, `unknown6`, `unknown7`, `unknown8`, `unknown9`, `unknown10`, `unknown11`, `unknown12`, `unknown13`, `unknown14`) VALUES
('181713','10','6896','Manticron Cube','0','0','0','65536','0','0','0','0','0','0','30420','0','0','1','0','0','0','0','0','0','0','0','0','0'),
('183847','0','7093','Doodad_HF_Mag_door01','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('184634','0','7206','Magtheridon Column 003','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('184635','0','7206','Magtheridon Column 002','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('184636','0','7206','Magtheridon Column 004','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('184637','0','7206','Magtheridon Column 005','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('184638','0','7206','Magtheridon Column 000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('184639','0','7206','Magtheridon Column 001','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('184653','0','7208','Doodad_Hellfire_Raid_FX01','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');

DELETE FROM gameobject_spawns WHERE entry IN (181713, 183847, 184634, 184635, 184636, 184637, 184638, 184639, 184653) AND map = 544;
INSERT INTO `gameobject_spawns` (`Entry`, `map`, `position_x`, `position_y`, `position_z`, `Facing`, `orientation1`, `orientation2`, `orientation3`, `orientation4`, `State`, `Flags`, `Faction`, `Scale`, `stateNpcLink`) VALUES
('184635','544','19.0966','-29.2772','0.133036','-1.26399','0','0','-0.590754','0.806852','1','32','1375','1','0'),
('184638','544','-60.8202','-21.9269','-0.03026','3.08278','0','0','0.999568','0.029401','1','32','1375','1','0'),
('184639','544','-29.7699','-43.4445','-0.522461','-2.37604','0','0','0.927631','-0.373497','1','32','1375','1','0'),
('181713','544','8.89169','-19.392','0.630908','2.44346','0','0','0.939693','0.34202','1','0','0','1.5','0'),
('181713','544','-31.4977','-34.0832','0.630935','1.22173','0','0','0.573576','0.819152','1','0','0','1.5','0'),
('184634','544','17.7522','34.5464','0.144816','0.179666','0','0','0.089712','0.995968','1','32','1375','1','0'),
('184653','544','0','0','0','3.14159','0','0','1','-4.37114E-8','1','32','1375','1','0'),
('183847','544','-72.5866','1.559','0','3.14159','0','0','1','-4.37114E-8','0','32','1375','1','0'),
('184636','544','-30.8852','46.6723','-0.497104','1.23468','0','0','0.578867','0.815422','1','32','1375','1','0'),
('184637','544','-60.2491','27.9361','-0.018443','1.94711','0','0','0.826891','0.562362','1','32','1375','1','0'),
('181713','544','9.39513','23.2389','0.630891','-2.49582','0','0','0.948324','-0.317305','1','0','0','1.5','0'),
('181713','544','-54.2302','2.32818','0.630945','0.0174533','0','0','0.00872654','0.999962','1','0','0','1.5','0'),
('181713','544','-31.7948','38.3964','0.630919','-1.20428','0','0','0.566406','-0.824126','1','0','0','1.5','0');

UPDATE gameobject_spawns SET Flags = 0 WHERE Entry = 181713 AND map = 544;


/* The Mechanar */

REPLACE INTO `creature_names` (`entry`, `name`, `subname`, `info_str`, `Flags1`, `type`, `family`, `rank`, `unk4`, `spelldataid`, `male_displayid`, `female_displayid`, `male_displayid2`, `female_displayid2`, `unknown_float1`, `unknown_float2`, `civilian`, `leader`) VALUES
('50000','Nether Bomb','','','0','0','0','0','0','0',13069,0,0,0,'1','1','0',0);
REPLACE INTO `creature_proto` (`entry`, `minlevel`, `maxlevel`, `faction`, `minhealth`, `maxhealth`, `mana`, `scale`, `npcflags`, `attacktime`, `attacktype`, `mindamage`, `maxdamage`, `rangedattacktime`, `rangedmindamage`, `rangedmaxdamage`, `mountdisplayid`, `equipmodel1`, `equipinfo1`, `equipslot1`, `equipmodel2`, `equipinfo2`, `equipslot2`, `equipmodel3`, `equipinfo3`, `equipslot3`, `respawntime`, `armor`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `combat_reach`, `bounding_radius`, `auras`, `boss`, `money`, `invisibility_type`, `death_state`, `walk_speed`, `run_speed`, `fly_speed`, `extra_a9_flags`) VALUES
('50000','70','70','168','100000','100000','100000','1','0','20000',0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','0','0',0,'0','0','2.5','8','14',0);


/* Shadowfang Keep */

UPDATE `gameobject_spawns` SET `flags` = '1' WHERE `entry` = '18972';
UPDATE `gameobject_spawns` SET `flags` = '1' WHERE `entry` = '18971';


/* The Arcatraz */

-- Zereketh the Unbound
UPDATE `creature_proto` SET `minlevel` = '70' WHERE `entry` = '21101';
UPDATE `creature_proto` SET `maxlevel` = '70' WHERE `entry` = '21101';
UPDATE `creature_proto` SET `minhealth` = '100000' WHERE `entry` = '21101';
UPDATE `creature_proto` SET `maxhealth` = '100000' WHERE `entry` = '21101';
UPDATE `creature_proto` SET `scale` = '.1' WHERE `entry` = '21101';
UPDATE `creature_proto` SET `attacktype` = '5' WHERE `entry` = '20870';


/* Ragefire Chasm */

DELETE FROM `creature_spawns` WHERE `entry`= 10268;
DELETE FROM `creature_spawns` WHERE `entry`= 10268;
DELETE FROM `creature_spawns` WHERE `entry`= 8996 AND `map`= 389;
REPLACE INTO creature_names (`entry`, `name`, `subname`, `info_str`, `Flags1`, `type`, `family`, `rank`, `unk4`, `spelldataid`, `male_displayid`, `female_displayid`, `male_displayid2`, `female_displayid2`, `unknown_float1`, `unknown_float2`, `civilian`, `leader`) VALUES 
(500000, 'Voidwalker', 'Searing Blade Warlock Minion', '', 0, 3, 16, 0, 0, 0, 1132, 0, 0, 0, 1.4, 0.77, 0, 0);
REPLACE INTO creature_proto (`entry`, `minlevel`, `maxlevel`, `faction`, `minhealth`, `maxhealth`, `mana`, `scale`, `npcflags`, `attacktime`, `attacktype`, `mindamage`, `maxdamage`, `rangedattacktime`, `rangedmindamage`, `rangedmaxdamage`, `mountdisplayid`, `equipmodel1`, `equipinfo1`, `equipslot1`, `equipmodel2`, `equipinfo2`, `equipslot2`, `equipmodel3`, `equipinfo3`, `equipslot3`, `respawntime`, `armor`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `combat_reach`, `bounding_radius`, `auras`, `boss`, `money`, `invisibility_type`, `death_state`, `walk_speed`, `run_speed`, `fly_speed`, `extra_a9_flags`) VALUES 
(500000, 17, 17, 554, 460, 460, 4439, 1, 0, 1870, 0, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0.8, 0, 0, 0, 0, 0, 2.5, 8, 14, 0);


/* Blackrock Spire */

-- Gizrul
DELETE FROM `creature_spawns` WHERE `entry`=('10268');
-- Warchied Rend Blackhand
DELETE FROM `creature_spawns` WHERE `entry`=('10268');


/* Serpentshrine Caverns */

-- Hydross the Unstable event
UPDATE creature_proto SET faction=14 WHERE entry IN (21216, 22036, 22035);

-- Leotheras the Blind event
DELETE FROM creature_spawns WHERE entry IN (21875, 21812);
UPDATE `creature_proto` SET `minhealth` = 3700000,`maxhealth` = 3700000 WHERE `entry` = 21875;
UPDATE creature_proto SET faction=14 WHERE entry IN (21875, 21215);

-- Lady Vashj event
UPDATE creature_names SET male_displayid =11686,female_displayid =0 WHERE entry =19870;
UPDATE creature_proto SET faction=14 WHERe entry IN (21212, 21958, 22055, 22056);
UPDATE creature_spawns SET faction=14 WHERE entry IN (21212, 21958, 22055, 22056);
INSERT IGNORE INTO `gameobject_names` (`entry`, `Type`, `DisplayID`, `Name`, `spellfocus`, `sound1`, `sound2`, `sound3`, `sound4`, `sound5`, `sound6`, `sound7`, `sound8`, `sound9`, `unknown1`, `unknown2`, `unknown3`, `unknown4`, `unknown5`, `unknown6`, `unknown7`, `unknown8`, `unknown9`, `unknown10`, `unknown11`, `unknown12`, `unknown13`, `unknown14`) VALUES
(185051, 0, 7265, 'Shield Generator', 0, 1718, 131072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM gameobject_spawns WHERE entry=185051;
INSERT INTO `gameobject_spawns` (`Entry`, `map`, `position_x`, `position_y`, `position_z`, `Facing`, `orientation1`, `orientation2`, `orientation3`, `orientation4`, `State`, `Flags`, `Faction`, `Scale`, `stateNpcLink`) VALUES
(185051, 548, 49.256, -902.354, 42.9769, 3.93902, 0, 0, 0.929729, -0.368245, 1, 0, 0, 1.5, 0),
(185051, 548, 49.687, -944.406, 42.7324, 2.31089, 0, 0, 0.914975, 0.403512, 1, 0, 0, 1.5, 0),
(185051, 548, 10.4122, -944.613, 42.8262, 0.817042, 0, 0, 0.39257, 0.919722, 1, 0, 0, 1.5, 0),
(185051, 548, 9.78695, -902.882, 42.9, 5.4399, 0, 0, 0.382205, -0.924078, 1, 0, 0, 1.5, 0);
-- tainted elemental
UPDATE `creature_proto` SET `scale` = 2 WHERE `entry` = 22009;

-- Karathress event
DELETE FROM creature_spawns WHERE Entry=22820;

-- Morogrim Tidewalker Lurker
UPDATE `creature_proto` SET `faction` = 16 WHERE `entry` = 21920;

/* QUEST SCRIPTS */


/* Arcane Disturbances */

-- Change for Gameobject "TEMP Shrine of Remulos"
UPDATE `gameobject_names` SET `spellfocus` = '1390' WHERE `entry` = 300142;


/* Misc */

-- Sickly Gazelle & Sickly Deer
UPDATE `creature_proto` SET `auras`='19502' WHERE `entry`=12296;
UPDATE `creature_proto` SET `auras`='19502' WHERE `entry`=12298;



/* OTHER QUERIES */

-- Gruuls Lair, Black Temple, Tempest Keep, Magtheridons Lair, Karazhan, This Does NOT eat ur cpu up, so dont worry(tested it)
UPDATE `worldmap_info` SET `viewingDistance`='250' WHERE `entry` in ('565','564','550','544','532');
-- Serpentshrine Cavern Viewing Distance
UPDATE `worldmap_info` SET `viewingDistance`='250' WHERE `entry` = 548;
-- Wailing Caverns Viewing Distance
UPDATE `worldmap_info` SET `viewingDistance`='4000' WHERE `entry` = 43;