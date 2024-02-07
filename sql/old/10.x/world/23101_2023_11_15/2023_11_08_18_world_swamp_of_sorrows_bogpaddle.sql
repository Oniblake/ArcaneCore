SET @OGUID := 3005202;

-- Gameobject templates
UPDATE `gameobject_template` SET `ContentTuningId`=425, `VerifiedBuild`=51886 WHERE `entry`=208139; -- Candy Bucket

UPDATE `gameobject_template_addon` SET `faction`=35 WHERE `entry`=208139; -- Candy Bucket

-- Quests
DELETE FROM `quest_offer_reward` WHERE `ID`=28967;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(28967, 0, 0, 0, 0, 0, 0, 0, 0, 'Candy buckets like this are located in inns throughout the realms. Go ahead... take some!', 51886); -- Candy Bucket

DELETE FROM `gameobject_queststarter` WHERE `id`=208139;
INSERT INTO `gameobject_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES
(208139, 28967, 51886);

UPDATE `gameobject_questender` SET `VerifiedBuild`=51886 WHERE (`id`=208139 AND `quest`=28967);

DELETE FROM `game_event_gameobject_quest` WHERE `id`=208139;

-- Old gameobject spawns
DELETE FROM `gameobject` WHERE `guid` BETWEEN 231280 AND 231485;
DELETE FROM `gameobject` WHERE `guid`=232007;
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN 231280 AND 231485;
DELETE FROM `game_event_gameobject` WHERE `guid`=232007;

-- Gameobject spawns
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+114;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID+0, 180405, 0, 8, 5458, '0', 0, 0, -9746.126953125, -3888.64404296875, 27.67670631408691406, 1.85004889965057373, 0, 0, 0.798635482788085937, 0.60181504487991333, 120, 255, 1, 51886), -- G_Pumpkin_01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+1, 180405, 0, 8, 5458, '0', 0, 0, -9778.8798828125, -3877.255126953125, 24.39068031311035156, 5.044002056121826171, 0, 0, -0.58070278167724609, 0.814115643501281738, 120, 255, 1, 51886), -- G_Pumpkin_01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+2, 180405, 0, 8, 5458, '0', 0, 0, -9736.7236328125, -3934.845458984375, 21.78411865234375, 3.752462387084960937, 0, 0, -0.95371627807617187, 0.300707906484603881, 120, 255, 1, 51886), -- G_Pumpkin_01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+3, 180405, 0, 8, 5458, '0', 0, 0, -9801.064453125, -3852.36279296875, 27.83259773254394531, 3.560472726821899414, 0, 0, -0.97814750671386718, 0.207912087440490722, 120, 255, 1, 51886), -- G_Pumpkin_01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+4, 180405, 0, 8, 5458, '0', 0, 0, -9815.8486328125, -3897.157958984375, 21.8435821533203125, 3.194002151489257812, 0, 0, -0.99965667724609375, 0.026201646775007247, 120, 255, 1, 51886), -- G_Pumpkin_01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+5, 180405, 0, 8, 5458, '0', 0, 0, -9829.203125, -3880.98779296875, 27.59727668762207031, 5.113816738128662109, 0, 0, -0.55193614959716796, 0.833886384963989257, 120, 255, 1, 51886), -- G_Pumpkin_01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+6, 180405, 0, 8, 5458, '0', 0, 0, -9759.8994140625, -3982.772705078125, 28.77989768981933593, 0.383971005678176879, 0, 0, 0.190808296203613281, 0.981627285480499267, 120, 255, 1, 51886), -- G_Pumpkin_01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+7, 180406, 0, 8, 5458, '0', 0, 0, -9779.0625, -3883.241455078125, 24.38010597229003906, 5.166176319122314453, 0, 0, -0.52991867065429687, 0.84804844856262207, 120, 255, 1, 51886), -- G_Pumpkin_02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+8, 180406, 0, 8, 5458, '0', 0, 0, -9770.3212890625, -3943.720458984375, 28.016387939453125, 1.623155713081359863, 0, 0, 0.725374221801757812, 0.688354730606079101, 120, 255, 1, 51886), -- G_Pumpkin_02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+9, 180406, 0, 8, 5458, '0', 0, 0, -9801, -3898.751708984375, 21.68892860412597656, 2.932138919830322265, 0, 0, 0.994521141052246093, 0.104535527527332305, 120, 255, 1, 51886), -- G_Pumpkin_02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+10, 180406, 0, 8, 5458, '0', 0, 0, -9723.216796875, -3975.807373046875, 28.69442176818847656, 2.024578809738159179, 0, 0, 0.848047256469726562, 0.529920578002929687, 120, 255, 1, 51886), -- G_Pumpkin_02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+11, 180406, 0, 8, 5458, '0', 0, 0, -9828.7705078125, -3897.213623046875, 27.67819595336914062, 4.97418975830078125, 0, 0, -0.60876083374023437, 0.793353796005249023, 120, 255, 1, 51886), -- G_Pumpkin_02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+12, 180407, 0, 8, 5458, '0', 0, 0, -9737.796875, -3903.829833984375, 22.64487648010253906, 4.223697185516357421, 0, 0, -0.85716724395751953, 0.515038192272186279, 120, 255, 1, 51886), -- G_Pumpkin_03 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+13, 180407, 0, 8, 5458, '0', 0, 0, -9720.8388671875, -3897.585205078125, 34.18621826171875, 1.815141916275024414, 0, 0, 0.788010597229003906, 0.615661680698394775, 120, 255, 1, 51886), -- G_Pumpkin_03 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+14, 180407, 0, 8, 5458, '0', 0, 0, -9781.2412109375, -3853.288330078125, 27.71799659729003906, 3.630291461944580078, 0, 0, -0.97029495239257812, 0.241925001144409179, 120, 255, 1, 51886), -- G_Pumpkin_03 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+15, 180407, 0, 8, 5458, '0', 0, 0, -9772.875, -3924.947998046875, 21.60287094116210937, 2.530723094940185546, 0, 0, 0.953716278076171875, 0.300707906484603881, 120, 255, 1, 51886), -- G_Pumpkin_03 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+16, 180407, 0, 8, 5458, '0', 0, 0, -9768.6650390625, -3972.210205078125, 27.52300453186035156, 2.530723094940185546, 0, 0, 0.953716278076171875, 0.300707906484603881, 120, 255, 1, 51886), -- G_Pumpkin_03 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+17, 180407, 0, 8, 5458, '0', 0, 0, -9743.421875, -3982.0556640625, 28.63459968566894531, 0.349065244197845458, 0, 0, 0.173647880554199218, 0.984807789325714111, 120, 255, 1, 51886), -- G_Pumpkin_03 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+18, 180411, 0, 8, 5458, '0', 0, 0, -9823.9658203125, -3889.920166015625, 25.9282073974609375, 5.829400539398193359, 0, 0, -0.22495079040527343, 0.974370121955871582, 120, 255, 1, 51886), -- G_Ghost_01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+19, 180415, 0, 8, 5458, '0', 0, 0, -9745.9775390625, -3892.298583984375, 23.05868339538574218, 0.174532130360603332, 0, 0, 0.087155342102050781, 0.996194720268249511, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+20, 180415, 0, 8, 5458, '0', 0, 0, -9747.123046875, -3896.473876953125, 23.15369415283203125, 2.548179388046264648, 0, 0, 0.956304550170898437, 0.292372345924377441, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+21, 180415, 0, 8, 5458, '0', 0, 0, -9736.31640625, -3898.904541015625, 23.59190177917480468, 2.827429771423339843, 0, 0, 0.987688064575195312, 0.156436234712600708, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+22, 180415, 0, 8, 5458, '0', 0, 0, -9736.111328125, -3899.076416015625, 23.66608428955078125, 1.151916384696960449, 0, 0, 0.544638633728027343, 0.838670849800109863, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+23, 180415, 0, 8, 5458, '0', 0, 0, -9746.06640625, -3892.62158203125, 22.85357475280761718, 2.007128477096557617, 0, 0, 0.84339141845703125, 0.537299633026123046, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+24, 180415, 0, 8, 5458, '0', 0, 0, -9735.6337890625, -3901.1181640625, 23.62952804565429687, 1.082102894783020019, 0, 0, 0.51503753662109375, 0.857167601585388183, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+25, 180415, 0, 8, 5458, '0', 0, 0, -9780.71875, -3882.552001953125, 21.59832382202148437, 1.762782454490661621, 0, 0, 0.771624565124511718, 0.636078238487243652, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+26, 180415, 0, 8, 5458, '0', 0, 0, -9740.75390625, -3905.251708984375, 24.53799819946289062, 1.186823248863220214, 0, 0, 0.559192657470703125, 0.829037725925445556, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+27, 180415, 0, 8, 5458, '0', 0, 0, -9781, -3883.944580078125, 21.71990394592285156, 4.555310726165771484, 0, 0, -0.76040554046630859, 0.649448513984680175, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+28, 180415, 0, 8, 5458, '0', 0, 0, -9780.345703125, -3883.576416015625, 21.69286155700683593, 5.654868602752685546, 0, 0, -0.30901622772216796, 0.95105677843093872, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+29, 180415, 0, 8, 5458, '0', 0, 0, -9783.919921875, -3863.59375, 21.76359176635742187, 2.740161895751953125, 0, 0, 0.979924201965332031, 0.199370384216308593, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+30, 180415, 0, 8, 5458, '0', 0, 0, -9784.26953125, -3863.619873046875, 21.80497169494628906, 5.375615119934082031, 0, 0, -0.4383707046508789, 0.898794233798980712, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+31, 180415, 0, 8, 5458, '0', 0, 0, -9789.78125, -3914.967041015625, 22.21663856506347656, 4.799657344818115234, 0, 0, -0.67558956146240234, 0.737277925014495849, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+32, 180415, 0, 8, 5458, '0', 0, 0, -9790.6181640625, -3909.182373046875, 23.399505615234375, 5.777040958404541015, 0, 0, -0.25037956237792968, 0.968147754669189453, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+33, 180415, 0, 8, 5458, '0', 0, 0, -9790.34765625, -3909.27783203125, 23.44681930541992187, 4.555310726165771484, 0, 0, -0.76040554046630859, 0.649448513984680175, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+34, 180415, 0, 8, 5458, '0', 0, 0, -9790.0224609375, -3909.3681640625, 23.36617469787597656, 5.619962215423583984, 0, 0, -0.32556724548339843, 0.945518851280212402, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+35, 180415, 0, 8, 5458, '0', 0, 0, -9781.388671875, -3882.798583984375, 21.63618087768554687, 2.67034769058227539, 0, 0, 0.972369194030761718, 0.233448356389999389, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+36, 180415, 0, 8, 5458, '0', 0, 0, -9781.5107421875, -3883.4150390625, 21.69519805908203125, 3.543023586273193359, 0, 0, -0.97992420196533203, 0.199370384216308593, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+37, 180415, 0, 8, 5458, '0', 0, 0, -9790.876953125, -3909.083251953125, 23.305633544921875, 5.89921426773071289, 0, 0, -0.19080829620361328, 0.981627285480499267, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+38, 180415, 0, 8, 5458, '0', 0, 0, -9744.55078125, -3936.741455078125, 22.93662643432617187, 1.675513744354248046, 0, 0, 0.743144035339355468, 0.669131457805633544, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+39, 180415, 0, 8, 5458, '0', 0, 0, -9784.0849609375, -3863.93408203125, 21.67277336120605468, 0, 0, 0, 0, 1, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+40, 180415, 0, 8, 5458, '0', 0, 0, -9789.95703125, -3914.78125, 22.10446739196777343, 5.427974700927734375, 0, 0, -0.41469287872314453, 0.909961462020874023, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+41, 180415, 0, 8, 5458, '0', 0, 0, -9789.6875, -3909.46533203125, 23.25378227233886718, 2.007128477096557617, 0, 0, 0.84339141845703125, 0.537299633026123046, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+42, 180415, 0, 8, 5458, '0', 0, 0, -9789.392578125, -3909.579833984375, 23.09548377990722656, 4.293513298034667968, 0, 0, -0.8386697769165039, 0.544640243053436279, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+43, 180415, 0, 8, 5458, '0', 0, 0, -9744.1181640625, -3936.48779296875, 22.92554283142089843, 1.221729278564453125, 0, 0, 0.573575973510742187, 0.819152355194091796, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+44, 180415, 0, 8, 5458, '0', 0, 0, -9790.0712890625, -3915.08154296875, 22.26119422912597656, 5.113816738128662109, 0, 0, -0.55193614959716796, 0.833886384963989257, 120, 255, 1, 51886), -- CandleBlack01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+45, 180425, 0, 8, 5458, '0', 0, 0, -9746.9306640625, -3896.119873046875, 23.23897743225097656, 5.829400539398193359, 0, 0, -0.22495079040527343, 0.974370121955871582, 120, 255, 1, 51886), -- SkullCandle01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+46, 180425, 0, 8, 5458, '0', 0, 0, -9768.3388671875, -3900.44970703125, 23.56763648986816406, 4.380776405334472656, 0, 0, -0.81411552429199218, 0.580702960491180419, 120, 255, 1, 51886), -- SkullCandle01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+47, 180425, 0, 8, 5458, '0', 0, 0, -9741.154296875, -3905.38720703125, 24.76087760925292968, 1.727874636650085449, 0, 0, 0.760405540466308593, 0.649448513984680175, 120, 255, 1, 51886), -- SkullCandle01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+48, 180425, 0, 8, 5458, '0', 0, 0, -9744.548828125, -3936.423583984375, 23.00011634826660156, 2.426007747650146484, 0, 0, 0.936672210693359375, 0.350207358598709106, 120, 255, 1, 51886), -- SkullCandle01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+49, 180425, 0, 8, 5458, '0', 0, 0, -9745.4736328125, -3959.947998046875, 23.41820907592773437, 3.194002151489257812, 0, 0, -0.99965667724609375, 0.026201646775007247, 120, 255, 1, 51886), -- SkullCandle01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+50, 180426, 0, 8, 5458, '0', 0, 0, -9739.1181640625, -3893.720458984375, 30.44158554077148437, 0.314158439636230468, 0, 0, 0.156434059143066406, 0.987688362598419189, 120, 255, 1, 51886), -- Bat01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+51, 180426, 0, 8, 5458, '0', 0, 0, -9757.1943359375, -3907.041748046875, 31.45549964904785156, 3.665196180343627929, 0, 0, -0.96592521667480468, 0.258821308612823486, 120, 255, 1, 51886), -- Bat01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+52, 180426, 0, 8, 5458, '0', 0, 0, -9764.888671875, -3914.05908203125, 32.32550811767578125, 3.036838293075561523, 0, 0, 0.998628616333007812, 0.052353221923112869, 120, 255, 1, 51886), -- Bat01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+53, 180426, 0, 8, 5458, '0', 0, 0, -9746.0693359375, -3930.10595703125, 32.73180007934570312, 5.305802345275878906, 0, 0, -0.46947097778320312, 0.882947921752929687, 120, 255, 1, 51886), -- Bat01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+54, 180426, 0, 8, 5458, '0', 0, 0, -9790.7470703125, -3883.546875, 29.13756370544433593, 1.256635904312133789, 0, 0, 0.587784767150878906, 0.809017360210418701, 120, 255, 1, 51886), -- Bat01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+55, 180427, 0, 8, 5458, '0', 0, 0, -9775.90625, -3900.760498046875, 26.19120216369628906, 1.256635904312133789, 0, 0, 0.587784767150878906, 0.809017360210418701, 120, 255, 1, 51886), -- Bat02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+56, 180427, 0, 8, 5458, '0', 0, 0, -9753.091796875, -3908.435791015625, 34.17998886108398437, 0.942476630210876464, 0, 0, 0.453989982604980468, 0.891006767749786376, 120, 255, 1, 51886), -- Bat02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+57, 180427, 0, 8, 5458, '0', 0, 0, -9759.1298828125, -3909.06591796875, 32.19264602661132812, 1.518436193466186523, 0, 0, 0.6883544921875, 0.725374460220336914, 120, 255, 1, 51886), -- Bat02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+58, 180427, 0, 8, 5458, '0', 0, 0, -9771.09375, -3908.03125, 21.66600990295410156, 1.692969322204589843, 0, 0, 0.748955726623535156, 0.662620067596435546, 120, 255, 1, 51886), -- Bat02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+59, 180471, 0, 8, 5458, '0', 0, 0, -9752.8349609375, -3897.177001953125, 25.63694953918457031, 0, 0, 0, 0, 1, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+60, 180471, 0, 8, 5458, '0', 0, 0, -9736.0673828125, -3883.782958984375, 24.3715667724609375, 5.759587764739990234, 0, 0, -0.25881862640380859, 0.965925931930541992, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+61, 180471, 0, 8, 5458, '0', 0, 0, -9747.5048828125, -3881.51904296875, 26.52299690246582031, 1.588248729705810546, 0, 0, 0.713250160217285156, 0.700909554958343505, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+62, 180471, 0, 8, 5458, '0', 0, 0, -9736.4794921875, -3896.657958984375, 24.93480873107910156, 4.48549652099609375, 0, 0, -0.7826080322265625, 0.622514784336090087, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+63, 180471, 0, 8, 5458, '0', 0, 0, -9743.296875, -3883.388916015625, 25.02009963989257812, 5.794494152069091796, 0, 0, -0.24192142486572265, 0.970295846462249755, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+64, 180471, 0, 8, 5458, '0', 0, 0, -9747.767578125, -3891.255126953125, 26.44188117980957031, 1.658061861991882324, 0, 0, 0.737277030944824218, 0.67559051513671875, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+65, 180471, 0, 8, 5458, '0', 0, 0, -9771.3701171875, -3863.0244140625, 25.61910438537597656, 3.22885894775390625, 0, 0, -0.99904823303222656, 0.043619260191917419, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+66, 180471, 0, 8, 5458, '0', 0, 0, -9746.67578125, -3915.1181640625, 26.341766357421875, 4.729844093322753906, 0, 0, -0.70090866088867187, 0.713251054286956787, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+67, 180471, 0, 8, 5458, '0', 0, 0, -9736.2080078125, -3901.892333984375, 25.10577583312988281, 4.48549652099609375, 0, 0, -0.7826080322265625, 0.622514784336090087, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+68, 180471, 0, 8, 5458, '0', 0, 0, -9776.3544921875, -3868.984375, 26.47265052795410156, 4.660029888153076171, 0, 0, -0.72537422180175781, 0.688354730606079101, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+69, 180471, 0, 8, 5458, '0', 0, 0, -9770.6044921875, -3897.107666015625, 26.48838996887207031, 6.248279094696044921, 0, 0, -0.01745223999023437, 0.999847710132598876, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+70, 180471, 0, 8, 5458, '0', 0, 0, -9776.96875, -3891.579833984375, 26.57023811340332031, 4.799657344818115234, 0, 0, -0.67558956146240234, 0.737277925014495849, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+71, 180471, 0, 8, 5458, '0', 0, 0, -9747.23828125, -3869.9462890625, 26.53369331359863281, 1.640606880187988281, 0, 0, 0.731352806091308593, 0.6819993257522583, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+72, 180471, 0, 8, 5458, '0', 0, 0, -9745.357421875, -3919.755126953125, 26.637451171875, 5.427974700927734375, 0, 0, -0.41469287872314453, 0.909961462020874023, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+73, 180471, 0, 8, 5458, '0', 0, 0, -9762.5107421875, -3863.404541015625, 26.35652351379394531, 3.106652259826660156, 0, 0, 0.999847412109375, 0.017469281330704689, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+74, 180471, 0, 8, 5458, '0', 0, 0, -9763.4775390625, -3897.1875, 26.43466377258300781, 6.195919513702392578, 0, 0, -0.04361915588378906, 0.999048233032226562, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+75, 180471, 0, 8, 5458, '0', 0, 0, -9754.642578125, -3863.897705078125, 26.54823493957519531, 3.194002151489257812, 0, 0, -0.99965667724609375, 0.026201646775007247, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+76, 180471, 0, 8, 5458, '0', 0, 0, -9746.55078125, -3913.942626953125, 26.560272216796875, 4.555310726165771484, 0, 0, -0.76040554046630859, 0.649448513984680175, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+77, 180471, 0, 8, 5458, '0', 0, 0, -9746.576171875, -3943.288330078125, 26.50214195251464843, 4.555310726165771484, 0, 0, -0.76040554046630859, 0.649448513984680175, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+78, 180471, 0, 8, 5458, '0', 0, 0, -9787.8125, -3914.322998046875, 24.08747482299804687, 2.356194972991943359, 0, 0, 0.923879623413085937, 0.382683247327804565, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+79, 180471, 0, 8, 5458, '0', 0, 0, -9770.201171875, -3930.76904296875, 23.38775062561035156, 2.181660413742065429, 0, 0, 0.887010574340820312, 0.461749136447906494, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+80, 180471, 0, 8, 5458, '0', 0, 0, -9802.31640625, -3870.03466796875, 27.01796340942382812, 1.692969322204589843, 0, 0, 0.748955726623535156, 0.662620067596435546, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+81, 180471, 0, 8, 5458, '0', 0, 0, -9770.7880859375, -3926.208251953125, 23.55050277709960937, 2.338739633560180664, 0, 0, 0.920504570007324218, 0.3907318115234375, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+82, 180471, 0, 8, 5458, '0', 0, 0, -9745, -3940.15283203125, 26.17565345764160156, 3.78736734390258789, 0, 0, -0.94832324981689453, 0.317305892705917358, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+83, 180471, 0, 8, 5458, '0', 0, 0, -9773.9150390625, -3923.213623046875, 23.15941429138183593, 2.356194972991943359, 0, 0, 0.923879623413085937, 0.382683247327804565, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+84, 180471, 0, 8, 5458, '0', 0, 0, -9743.9423828125, -3939.045166015625, 26.35261154174804687, 3.94444584846496582, 0, 0, -0.92050457000732421, 0.3907318115234375, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+85, 180471, 0, 8, 5458, '0', 0, 0, -9746.3232421875, -3947.651123046875, 26.66068649291992187, 5.253442287445068359, 0, 0, -0.49242305755615234, 0.870355963706970214, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+86, 180471, 0, 8, 5458, '0', 0, 0, -9804.4638671875, -3876.28125, 26.41395950317382812, 0.890116631984710693, 0, 0, 0.430510520935058593, 0.902585566043853759, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+87, 180471, 0, 8, 5458, '0', 0, 0, -9802.638671875, -3873.239501953125, 26.74565505981445312, 1.378809213638305664, 0, 0, 0.636077880859375, 0.771624863147735595, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+88, 180471, 0, 8, 5458, '0', 0, 0, -9791.87890625, -3910.98095703125, 24.24026107788085937, 2.356194972991943359, 0, 0, 0.923879623413085937, 0.382683247327804565, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+89, 180471, 0, 8, 5458, '0', 0, 0, -9792.98828125, -3857.19091796875, 30.52347755432128906, 3.22885894775390625, 0, 0, -0.99904823303222656, 0.043619260191917419, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+90, 180471, 0, 8, 5458, '0', 0, 0, -9790.44140625, -3857.3212890625, 30.55438613891601562, 3.211419343948364257, 0, 0, -0.9993906021118164, 0.034906134009361267, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+91, 180471, 0, 8, 5458, '0', 0, 0, -9791.7470703125, -3857.234375, 30.53296279907226562, 3.281238555908203125, 0, 0, -0.99756336212158203, 0.069766148924827575, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+92, 180471, 0, 8, 5458, '0', 0, 0, -9746.748046875, -3946.54345703125, 26.71694374084472656, 5.201082706451416015, 0, 0, -0.51503753662109375, 0.857167601585388183, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+93, 180471, 0, 8, 5458, '0', 0, 0, -9776.86328125, -3919.689208984375, 23.32061576843261718, 2.356194972991943359, 0, 0, 0.923879623413085937, 0.382683247327804565, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+94, 180471, 0, 8, 5458, '0', 0, 0, -9806.26953125, -3877.803955078125, 26.72670364379882812, 0.558503925800323486, 0, 0, 0.275636672973632812, 0.961261868476867675, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+95, 180471, 0, 8, 5458, '0', 0, 0, -9751.2607421875, -3976.557373046875, 30.40369987487792968, 6.265733242034912109, 0, 0, -0.00872611999511718, 0.999961912631988525, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+96, 180471, 0, 8, 5458, '0', 0, 0, -9748.4580078125, -3976.619873046875, 30.69185829162597656, 6.161012649536132812, 0, 0, -0.06104850769042968, 0.998134791851043701, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+97, 180471, 0, 8, 5458, '0', 0, 0, -9750.2412109375, -3976.579833984375, 30.56848907470703125, 6.248279094696044921, 0, 0, -0.01745223999023437, 0.999847710132598876, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+98, 180471, 0, 8, 5458, '0', 0, 0, -9823.560546875, -3890.3994140625, 30.47779273986816406, 4.694936752319335937, 0, 0, -0.71325016021728515, 0.700909554958343505, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+99, 180471, 0, 8, 5458, '0', 0, 0, -9823.6220703125, -3888.920166015625, 30.74230384826660156, 4.817109584808349609, 0, 0, -0.66913032531738281, 0.74314504861831665, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+100, 180471, 0, 8, 5458, '0', 0, 0, -9749.3544921875, -3976.6181640625, 30.39021492004394531, 6.248279094696044921, 0, 0, -0.01745223999023437, 0.999847710132598876, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+101, 180471, 0, 8, 5458, '0', 0, 0, -9823.5419921875, -3887.3681640625, 30.21129417419433593, 4.729844093322753906, 0, 0, -0.70090866088867187, 0.713251054286956787, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+102, 180471, 0, 8, 5458, '0', 0, 0, -9752.390625, -3976.59033203125, 30.79532241821289062, 6.265733242034912109, 0, 0, -0.00872611999511718, 0.999961912631988525, 120, 255, 1, 51886), -- HangingSkullLight01 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+103, 180472, 0, 8, 5458, '0', 0, 0, -9777.4150390625, -3880.052001953125, 28.00757408142089843, 3.263772249221801757, 0, 0, -0.99813461303710937, 0.061051756143569946, 120, 255, 1, 51886), -- HangingSkullLight02 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+104, 180523, 0, 8, 5458, '0', 0, 0, -9780.47265625, -3867.829833984375, 21.82470321655273437, 4.171337604522705078, 0, 0, -0.87035560607910156, 0.492423713207244873, 120, 255, 1, 51886), -- Apple Bob (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+105, 207941, 0, 8, 5458, '0', 0, 0, -9763.03515625, -3880.130126953125, 34.73355865478515625, 4.520402908325195312, 0, 0, -0.77162456512451171, 0.636078238487243652, 120, 255, 1, 51886), -- G_WitchHat_01 scale 2.0 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+106, 207941, 0, 8, 5458, '0', 0, 0, -9738.640625, -3914.779541015625, 33.50423431396484375, 5.061456203460693359, 0, 0, -0.57357597351074218, 0.819152355194091796, 120, 255, 1, 51886), -- G_WitchHat_01 scale 2.0 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+107, 207941, 0, 8, 5458, '0', 0, 0, -9738.1826171875, -3944.65625, 33.48528289794921875, 5.061456203460693359, 0, 0, -0.57357597351074218, 0.819152355194091796, 120, 255, 1, 51886), -- G_WitchHat_01 scale 2.0 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+108, 207941, 0, 8, 5458, '0', 0, 0, -9810.3857421875, -3870.814208984375, 33.63306427001953125, 1.221729278564453125, 0, 0, 0.573575973510742187, 0.819152355194091796, 120, 255, 1, 51886), -- G_WitchHat_01 scale 2.0 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+109, 208069, 0, 8, 5458, '0', 0, 0, -9781.4755859375, -3920.208251953125, 24.84844779968261718, 2.949595451354980468, 0, 0, 0.995395660400390625, 0.095851235091686248, 120, 255, 1, 51886), -- G_Pumpkin_02 Scale 0.5 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+110, 208069, 0, 8, 5458, '0', 0, 0, -9813.7275390625, -3900.7119140625, 25.2358245849609375, 2.652894020080566406, 0, 0, 0.970294952392578125, 0.241925001144409179, 120, 255, 1, 51886), -- G_Pumpkin_02 Scale 0.5 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+111, 208072, 0, 8, 5458, '0', 0, 0, -9747.294921875, -3910.744873046875, 24.81595420837402343, 4.206246376037597656, 0, 0, -0.86162853240966796, 0.50753939151763916, 120, 255, 1, 51886), -- G_Pumpkin_03 Scale 0.5 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+112, 208072, 0, 8, 5458, '0', 0, 0, -9811.8193359375, -3898.842041015625, 22.88781929016113281, 3.24634718894958496, 0, 0, -0.99862861633300781, 0.052353221923112869, 120, 255, 1, 51886), -- G_Pumpkin_03 Scale 0.5 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+113, 208078, 0, 8, 5458, '0', 0, 0, -9807.1943359375, -3881.354248046875, 24.64743232727050781, 0.802850961685180664, 0, 0, 0.390730857849121093, 0.920504987239837646, 120, 255, 1, 51886), -- G_Pumpkin_01 scale 0.5 (Area: Bogpaddle - Difficulty: 0) CreateObject1
(@OGUID+114, 208139, 0, 8, 5458, '0', 0, 0, -9771.267578125, -3878.373291015625, 21.8904876708984375, 5.270895957946777343, 0, 0, -0.48480892181396484, 0.87462007999420166, 120, 255, 1, 51886); -- Candy Bucket (Area: Bogpaddle - Difficulty: 0) CreateObject1

-- Event spawns
DELETE FROM `game_event_gameobject` WHERE `eventEntry`=12 AND `guid` BETWEEN @OGUID+0 AND @OGUID+114;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(12, @OGUID+0),
(12, @OGUID+1),
(12, @OGUID+2),
(12, @OGUID+3),
(12, @OGUID+4),
(12, @OGUID+5),
(12, @OGUID+6),
(12, @OGUID+7),
(12, @OGUID+8),
(12, @OGUID+9),
(12, @OGUID+10),
(12, @OGUID+11),
(12, @OGUID+12),
(12, @OGUID+13),
(12, @OGUID+14),
(12, @OGUID+15),
(12, @OGUID+16),
(12, @OGUID+17),
(12, @OGUID+18),
(12, @OGUID+19),
(12, @OGUID+20),
(12, @OGUID+21),
(12, @OGUID+22),
(12, @OGUID+23),
(12, @OGUID+24),
(12, @OGUID+25),
(12, @OGUID+26),
(12, @OGUID+27),
(12, @OGUID+28),
(12, @OGUID+29),
(12, @OGUID+30),
(12, @OGUID+31),
(12, @OGUID+32),
(12, @OGUID+33),
(12, @OGUID+34),
(12, @OGUID+35),
(12, @OGUID+36),
(12, @OGUID+37),
(12, @OGUID+38),
(12, @OGUID+39),
(12, @OGUID+40),
(12, @OGUID+41),
(12, @OGUID+42),
(12, @OGUID+43),
(12, @OGUID+44),
(12, @OGUID+45),
(12, @OGUID+46),
(12, @OGUID+47),
(12, @OGUID+48),
(12, @OGUID+49),
(12, @OGUID+50),
(12, @OGUID+51),
(12, @OGUID+52),
(12, @OGUID+53),
(12, @OGUID+54),
(12, @OGUID+55),
(12, @OGUID+56),
(12, @OGUID+57),
(12, @OGUID+58),
(12, @OGUID+59),
(12, @OGUID+60),
(12, @OGUID+61),
(12, @OGUID+62),
(12, @OGUID+63),
(12, @OGUID+64),
(12, @OGUID+65),
(12, @OGUID+66),
(12, @OGUID+67),
(12, @OGUID+68),
(12, @OGUID+69),
(12, @OGUID+70),
(12, @OGUID+71),
(12, @OGUID+72),
(12, @OGUID+73),
(12, @OGUID+74),
(12, @OGUID+75),
(12, @OGUID+76),
(12, @OGUID+77),
(12, @OGUID+78),
(12, @OGUID+79),
(12, @OGUID+80),
(12, @OGUID+81),
(12, @OGUID+82),
(12, @OGUID+83),
(12, @OGUID+84),
(12, @OGUID+85),
(12, @OGUID+86),
(12, @OGUID+87),
(12, @OGUID+88),
(12, @OGUID+89),
(12, @OGUID+90),
(12, @OGUID+91),
(12, @OGUID+92),
(12, @OGUID+93),
(12, @OGUID+94),
(12, @OGUID+95),
(12, @OGUID+96),
(12, @OGUID+97),
(12, @OGUID+98),
(12, @OGUID+99),
(12, @OGUID+100),
(12, @OGUID+101),
(12, @OGUID+102),
(12, @OGUID+103),
(12, @OGUID+104),
(12, @OGUID+105),
(12, @OGUID+106),
(12, @OGUID+107),
(12, @OGUID+108),
(12, @OGUID+109),
(12, @OGUID+110),
(12, @OGUID+111),
(12, @OGUID+112),
(12, @OGUID+113),
(12, @OGUID+114);
