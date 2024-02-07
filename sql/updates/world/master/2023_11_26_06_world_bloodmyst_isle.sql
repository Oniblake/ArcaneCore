--
SET @OGUID := 3006964;

-- Old gameobject spawns
DELETE FROM `gameobject` WHERE `guid` BETWEEN 245850 AND 245912;
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN 245850 AND 245912;

-- Gameobject spawns
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+62;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID+0, 180405, 530, 3525, 3584, '0', 0, 0, -1971.005615234375, -11867.123046875, 49.0355224609375, 4.345870018005371093, 0, 0, -0.82412624359130859, 0.566406130790710449, 120, 255, 1, 46366), -- G_Pumpkin_01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+1, 180405, 530, 3525, 3584, '0', 0, 0, -1886.126708984375, -11892.0283203125, 37.16268157958984375, 1.884953022003173828, 0, 0, 0.809016227722167968, 0.587786316871643066, 120, 255, 1, 46366), -- G_Pumpkin_01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+2, 180405, 530, 3525, 3584, '0', 0, 0, -2092.205078125, -11850.0517578125, 52.0183563232421875, 4.520402908325195312, 0, 0, -0.77162456512451171, 0.636078238487243652, 120, 255, 1, 46366), -- G_Pumpkin_01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+3, 180406, 530, 3525, 3584, '0', 0, 0, -1929.4615478515625, -11964.478515625, 57.55423355102539062, 5.166176319122314453, 0, 0, -0.52991867065429687, 0.84804844856262207, 120, 255, 1, 46366), -- G_Pumpkin_02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+4, 180406, 530, 3525, 3584, '0', 0, 0, -1968.48486328125, -11875.4658203125, 48.83435821533203125, 0.104719325900077819, 0, 0, 0.052335739135742187, 0.998629570007324218, 120, 255, 1, 46366), -- G_Pumpkin_02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+5, 180406, 530, 3525, 3584, '0', 0, 0, -2039.5360107421875, -11898.8251953125, 46.463531494140625, 0.209439441561698913, 0, 0, 0.104528427124023437, 0.994521915912628173, 120, 255, 1, 46366), -- G_Pumpkin_02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+6, 180407, 530, 3525, 3584, '0', 0, 0, -1961.8824462890625, -11869.126953125, 49.53715896606445312, 2.216565132141113281, 0, 0, 0.894933700561523437, 0.44619917869567871, 120, 255, 1, 46366), -- G_Pumpkin_03 (Area: Blood Watch - Difficulty: 0)
(@OGUID+7, 180407, 530, 3525, 3584, '0', 0, 0, -1890.3828125, -11868.1572265625, 36.95304489135742187, 1.989672422409057617, 0, 0, 0.838669776916503906, 0.544640243053436279, 120, 255, 1, 46366), -- G_Pumpkin_03 (Area: Blood Watch - Difficulty: 0)
(@OGUID+8, 180407, 530, 3525, 3584, '0', 0, 0, -2027.5677490234375, -11903.46875, 47.02361297607421875, 0.314158439636230468, 0, 0, 0.156434059143066406, 0.987688362598419189, 120, 255, 1, 46366), -- G_Pumpkin_03 (Area: Blood Watch - Difficulty: 0)
(@OGUID+9, 180407, 530, 3525, 3584, '0', 0, 0, -2014.1978759765625, -11803.8076171875, 54.66114044189453125, 0.471238493919372558, 0, 0, 0.233445167541503906, 0.972369968891143798, 120, 255, 1, 46366), -- G_Pumpkin_03 (Area: Blood Watch - Difficulty: 0)
(@OGUID+10, 180411, 530, 3525, 3584, '0', 0, 0, -1914.009765625, -11794.5703125, 73.4864654541015625, 0.069811686873435974, 0, 0, 0.034898757934570312, 0.999390840530395507, 120, 255, 1, 46366), -- G_Ghost_01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+11, 180425, 530, 3525, 3584, '0', 0, 0, -1960.275634765625, -11891.7060546875, 50.1805419921875, 2.181660413742065429, 0, 0, 0.887010574340820312, 0.461749136447906494, 120, 255, 1, 46366), -- SkullCandle01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+12, 180425, 530, 3525, 3584, '0', 0, 0, -1989.674072265625, -11918.416015625, 52.61247634887695312, 2.478367090225219726, 0, 0, 0.94551849365234375, 0.325568377971649169, 120, 255, 1, 46366), -- SkullCandle01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+13, 180426, 530, 3525, 3584, '0', 0, 0, -1958.907958984375, -11899.7158203125, 58.21694564819335937, 2.652894020080566406, 0, 0, 0.970294952392578125, 0.241925001144409179, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+14, 180426, 530, 3525, 3584, '0', 0, 0, -1943.71875, -11896.1923828125, 55.97334671020507812, 2.757613182067871093, 0, 0, 0.981626510620117187, 0.190812408924102783, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+15, 180426, 530, 3525, 3584, '0', 0, 0, -1971.1302490234375, -11903.6611328125, 61.39725875854492187, 3.752462387084960937, 0, 0, -0.95371627807617187, 0.300707906484603881, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+16, 180426, 530, 3525, 3584, '0', 0, 0, -1934.2882080078125, -11881.09765625, 56.73195266723632812, 4.223697185516357421, 0, 0, -0.85716724395751953, 0.515038192272186279, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+17, 180426, 530, 3525, 3584, '0', 0, 0, -1983.001708984375, -11899.2431640625, 58.54936981201171875, 4.293513298034667968, 0, 0, -0.8386697769165039, 0.544640243053436279, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+18, 180426, 530, 3525, 3584, '0', 0, 0, -1989.9600830078125, -11877.6767578125, 58.25811004638671875, 3.508116960525512695, 0, 0, -0.98325443267822265, 0.182238012552261352, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+19, 180426, 530, 3525, 3584, '0', 0, 0, -1990.25, -11888.75, 57.30620574951171875, 0.733038187026977539, 0, 0, 0.358367919921875, 0.933580458164215087, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+20, 180426, 530, 3525, 3584, '0', 0, 0, -1944.046875, -11864.8525390625, 56.884063720703125, 1.553341388702392578, 0, 0, 0.700908660888671875, 0.713251054286956787, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+21, 180426, 530, 3525, 3584, '0', 0, 0, -1957.3975830078125, -11856.326171875, 62.97618484497070312, 2.356194972991943359, 0, 0, 0.923879623413085937, 0.382683247327804565, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+22, 180426, 530, 3525, 3584, '0', 0, 0, -1987.998291015625, -11863.455078125, 50.67772293090820312, 1.780233979225158691, 0, 0, 0.7771453857421875, 0.629321098327636718, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+23, 180426, 530, 3525, 3584, '0', 0, 0, -1975.23095703125, -11857.2568359375, 54.67333602905273437, 2.391098499298095703, 0, 0, 0.930417060852050781, 0.366502493619918823, 120, 255, 1, 46366), -- Bat01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+24, 180427, 530, 3525, 3584, '0', 0, 0, -1977.4410400390625, -11901.4150390625, 61.03636932373046875, 5.462882041931152343, 0, 0, -0.39874839782714843, 0.917060375213623046, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+25, 180427, 530, 3525, 3584, '0', 0, 0, -1937.7100830078125, -11889.140625, 55.27680206298828125, 2.652894020080566406, 0, 0, 0.970294952392578125, 0.241925001144409179, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+26, 180427, 530, 3525, 3584, '0', 0, 0, -1963.8228759765625, -11900.5068359375, 57.15956497192382812, 3.804818391799926757, 0, 0, -0.94551849365234375, 0.325568377971649169, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+27, 180427, 530, 3525, 3584, '0', 0, 0, -1948.875, -11898.8681640625, 57.657958984375, 5.619962215423583984, 0, 0, -0.32556724548339843, 0.945518851280212402, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+28, 180427, 530, 3525, 3584, '0', 0, 0, -1987.454833984375, -11894.5576171875, 54.70169830322265625, 5.410521507263183593, 0, 0, -0.42261791229248046, 0.906307935714721679, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+29, 180427, 530, 3525, 3584, '0', 0, 0, -1990.6614990234375, -11883.2783203125, 54.50783157348632812, 2.076939344406127929, 0, 0, 0.861628532409667968, 0.50753939151763916, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+30, 180427, 530, 3525, 3584, '0', 0, 0, -1937.7379150390625, -11871.5107421875, 58.08891677856445312, 4.328419685363769531, 0, 0, -0.82903671264648437, 0.559194147586822509, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+31, 180427, 530, 3525, 3584, '0', 0, 0, -1951.4410400390625, -11860.423828125, 59.8607177734375, 3.001946926116943359, 0, 0, 0.997563362121582031, 0.069766148924827575, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+32, 180427, 530, 3525, 3584, '0', 0, 0, -1990.4879150390625, -11871.798828125, 52.47985458374023437, 0.872663915157318115, 0, 0, 0.422617912292480468, 0.906307935714721679, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+33, 180427, 530, 3525, 3584, '0', 0, 0, -1967.4010009765625, -11856.0986328125, 56.9408111572265625, 0.733038187026977539, 0, 0, 0.358367919921875, 0.933580458164215087, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+34, 180427, 530, 3525, 3584, '0', 0, 0, -1982.9930419921875, -11859.28515625, 58.3022613525390625, 4.188792228698730468, 0, 0, -0.86602497100830078, 0.50000077486038208, 120, 255, 1, 46366), -- Bat02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+35, 180471, 530, 3525, 3584, '0', 0, 0, -1982.751708984375, -11817.4580078125, 57.89363479614257812, 5.724681377410888671, 0, 0, -0.27563667297363281, 0.961261868476867675, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+36, 180471, 530, 3525, 3584, '0', 0, 0, -1983.3541259765625, -11816.9345703125, 58.388427734375, 5.70722818374633789, 0, 0, -0.28401470184326171, 0.958819925785064697, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+37, 180471, 530, 3525, 3584, '0', 0, 0, -1982.0382080078125, -11818.044921875, 57.3370513916015625, 5.532694816589355468, 0, 0, -0.3665008544921875, 0.93041771650314331, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+38, 180471, 530, 3525, 3584, '0', 0, 0, -2000.88720703125, -11811.623046875, 59.51848602294921875, 5.829400539398193359, 0, 0, -0.22495079040527343, 0.974370121955871582, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+39, 180471, 530, 3525, 3584, '0', 0, 0, -2001.5616455078125, -11811.4111328125, 58.97216796875, 6.073746204376220703, 0, 0, -0.10452842712402343, 0.994521915912628173, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+40, 180471, 530, 3525, 3584, '0', 0, 0, -1990.486083984375, -11814.2763671875, 60.2953033447265625, 6.03883981704711914, 0, 0, -0.12186908721923828, 0.9925462007522583, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+41, 180471, 530, 3525, 3584, '0', 0, 0, -1996.595458984375, -11812.810546875, 58.75216293334960937, 5.6897735595703125, 0, 0, -0.29237174987792968, 0.956304728984832763, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+42, 180471, 530, 3525, 3584, '0', 0, 0, -1991.9478759765625, -11813.986328125, 60.04421615600585937, 5.742135047912597656, 0, 0, -0.26723766326904296, 0.96363067626953125, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+43, 180471, 530, 3525, 3584, '0', 0, 0, -1988.9478759765625, -11814.783203125, 60.31566238403320312, 6.03883981704711914, 0, 0, -0.12186908721923828, 0.9925462007522583, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+44, 180471, 530, 3525, 3584, '0', 0, 0, -1999.375, -11811.8349609375, 60.13572311401367187, 5.969027042388916015, 0, 0, -0.1564340591430664, 0.987688362598419189, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+45, 180471, 530, 3525, 3584, '0', 0, 0, -1992.888916015625, -11813.6494140625, 59.75961685180664062, 6.161012649536132812, 0, 0, -0.06104850769042968, 0.998134791851043701, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+46, 180471, 530, 3525, 3584, '0', 0, 0, -1993.5106201171875, -11813.369140625, 59.88570022583007812, 5.811946868896484375, 0, 0, -0.2334451675415039, 0.972369968891143798, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+47, 180471, 530, 3525, 3584, '0', 0, 0, -1991.2430419921875, -11814.0986328125, 60.65585708618164062, 5.84685373306274414, 0, 0, -0.21643924713134765, 0.976296067237854003, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+48, 180471, 530, 3525, 3584, '0', 0, 0, -2000.1197509765625, -11811.75, 59.49271774291992187, 5.986480236053466796, 0, 0, -0.14780902862548828, 0.989015936851501464, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+49, 180471, 530, 3525, 3584, '0', 0, 0, -1998.0728759765625, -11812.3095703125, 59.95083236694335937, 5.70722818374633789, 0, 0, -0.28401470184326171, 0.958819925785064697, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+50, 180471, 530, 3525, 3584, '0', 0, 0, -1998.6978759765625, -11812.048828125, 59.96184539794921875, 6.021387100219726562, 0, 0, -0.13052558898925781, 0.991444945335388183, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+51, 180471, 530, 3525, 3584, '0', 0, 0, -1997.4166259765625, -11812.419921875, 59.43864059448242187, 6.09120035171508789, 0, 0, -0.09584522247314453, 0.995396256446838378, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+52, 180471, 530, 3525, 3584, '0', 0, 0, -1985.65625, -11815.7607421875, 57.7563629150390625, 5.742135047912597656, 0, 0, -0.26723766326904296, 0.96363067626953125, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+53, 180471, 530, 3525, 3584, '0', 0, 0, -1984.19970703125, -11816.59765625, 57.97170639038085937, 5.724681377410888671, 0, 0, -0.27563667297363281, 0.961261868476867675, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+54, 180471, 530, 3525, 3584, '0', 0, 0, -1989.595458984375, -11814.4501953125, 60.1123199462890625, 5.742135047912597656, 0, 0, -0.26723766326904296, 0.96363067626953125, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+55, 180471, 530, 3525, 3584, '0', 0, 0, -1984.9913330078125, -11816.1982421875, 57.97513198852539062, 5.777040958404541015, 0, 0, -0.25037956237792968, 0.968147754669189453, 120, 255, 1, 46366), -- HangingSkullLight01 (Area: Blood Watch - Difficulty: 0)
(@OGUID+56, 180472, 530, 3525, 3584, '0', 0, 0, -1996.326416015625, -11919.7470703125, 55.69097518920898437, 1.431168079376220703, 0, 0, 0.656058311462402343, 0.754710197448730468, 120, 255, 1, 46366), -- HangingSkullLight02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+57, 180472, 530, 3525, 3584, '0', 0, 0, -1925.3016357421875, -11858.427734375, 55.81879043579101562, 2.879789113998413085, 0, 0, 0.991444587707519531, 0.130528271198272705, 120, 255, 1, 46366), -- HangingSkullLight02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+58, 180472, 530, 3525, 3584, '0', 0, 0, -2002.6978759765625, -11897.4140625, 55.77862548828125, 1.396261811256408691, 0, 0, 0.642786979675292968, 0.766044974327087402, 120, 255, 1, 46366), -- HangingSkullLight02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+59, 180472, 530, 3525, 3584, '0', 0, 0, -1941.1881103515625, -11848.171875, 56.1128387451171875, 3.926995515823364257, 0, 0, -0.92387866973876953, 0.38268551230430603, 120, 255, 1, 46366), -- HangingSkullLight02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+60, 180472, 530, 3525, 3584, '0', 0, 0, -2051.3671875, -11878.04296875, 52.93396377563476562, 1.256635904312133789, 0, 0, 0.587784767150878906, 0.809017360210418701, 120, 255, 1, 46366), -- HangingSkullLight02 (Area: Blood Watch - Difficulty: 0)
(@OGUID+61, 180523, 530, 3525, 3584, '0', 0, 0, -2053.140625, -11895.9443359375, 46.58018875122070312, 4.555310726165771484, 0, 0, -0.76040554046630859, 0.649448513984680175, 120, 255, 1, 46366), -- Apple Bob (Area: Blood Watch - Difficulty: 0)
(@OGUID+62, 190045, 530, 3525, 3584, '0', 0, 0, -2062.625732421875, -11891.9951171875, 46.14381790161132812, 1.151916384696960449, 0, 0, 0.544638633728027343, 0.838670849800109863, 120, 255, 1, 46366); -- Candy Bucket (Area: Blood Watch - Difficulty: 0)

-- Event spawns
DELETE FROM `game_event_gameobject` WHERE `eventEntry`=12 AND `guid` BETWEEN @OGUID+0 AND @OGUID+62;
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
(12, @OGUID+62);
