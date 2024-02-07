-- Barkeep Daniels
DELETE FROM `creature_text` WHERE `CreatureID`=346;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(346,0,0,"Pull up a stool and have a drink!",12,7,100,0,0,0,47,0,"Barkeep Daniels"),
(346,0,1,"The bottles are dusty but the liquor goes down clean!",12,7,100,0,0,0,48,0,"Barkeep Daniels");
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=346;
DELETE FROM `smart_scripts` WHERE `entryorguid`=346 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(346,0,0,0,1,0,100,0,1000,15000,150000,180000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Barkeep Daniels - Out of Combat - Say Line 0");
