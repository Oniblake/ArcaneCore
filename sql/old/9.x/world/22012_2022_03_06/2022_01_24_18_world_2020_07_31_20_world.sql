--
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `id` IN (16208,16946,23383,19362,20922,23115,23139,23140,23149,23270,23271,23619,23623,23624,23625,23626,23721,24410,24727,24854,24886,25039,25059,25148,25149,25150,25151,25152,25162,25169,25170,25175,25236,25967,25976,25977,26089,26090,26091,26092,26253,26560,34986,34999,35000) AND `map` != 230;
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `id` IN (23689,23755,23771,23804,23810,23823,23875,23934,23983,23989,23990,23991,23992,24014,24040,24120,24145,24169,24330,24516,24517,24524,24528,24531,24532,24534,24535,24562,24567,24580,24613,24614,24637,24643,24717,24718,24719,24720,24750,24752,24767,24785,24807,24817,24820,24832,24884,24896,24897,24902,24957,25171,25224,25228,25233,25258,25259,25261,25284,25294,25328,25332,25333,25334,25335,25338,25391,25392,25422,25434,25440,25464,25467,25468,25470,25471,25472,25493,25498,25501,25516,25534,25607,25610,25654,25664,25665,25666,25680,25684,25705,25743,25791,25797,25806,25829,25836,25843,25984,26043,26073,26076,26217,26233,26234,26252,26257,26266,26319,26356,26357,26371,26375,26428,26434,26436,26492,26493,26523,26616,26643,26656,26663,26772,26779,26780,26809,26816,26839,26870,26909,26924,26934,26935,26942,26943,26948,26965,26966,26983,27024);

-- Doomwalker, currently respawns in one day but should share the same respawn rate / system with
-- Doom Lord Kazzak https://www.mmo-champion.com/threads/720835-Doom-Lord-Kazzak
-- https://wowwiki.fandom.com/wiki/World_boss
-- so let's set it to 3 hours
UPDATE `creature` SET `spawntimesecs` = 10800 WHERE `id` = 17711;

-- Daggertail Lizard were removed in TBC and were added back in Cata
-- https://www.wowhead.com/npc=22255/daggertail-lizard#comments:id=1167780
-- If page was not archived (in 2010), it usually means creature was unused at that moment
-- http://web.archive.org/web/20160601000000*/www.wowhead.com/npc=22255
-- DELETE FROM `creature` WHERE `id` = 22255;
