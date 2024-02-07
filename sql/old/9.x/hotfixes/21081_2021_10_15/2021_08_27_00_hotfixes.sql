DELETE FROM `player_condition_locale` WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU' AND `ID` IN (89249);
INSERT INTO `player_condition_locale` (`ID`, `locale`, `FailureDescription_lang`, `VerifiedBuild`) VALUES
(89249, 'ruRU', '', 39804);

DELETE FROM `item_search_name_locale` WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU' AND `ID` IN (182247, 182246, 182245, 182244, 182243, 182242, 182241, 182229, 182228, 182227, 182226, 182225, 182224, 182223, 177203, 177202, 177201, 177200, 177199, 177198, 177197, 174303);
INSERT INTO `item_search_name_locale` (`ID`, `locale`, `Display_lang`, `VerifiedBuild`) VALUES
(174303, 'ruRU', 'Гармоничный тесак автоматурга', 39804),
(177197, 'ruRU', 'Гармоничная бригантина носителя', 39804),
(177198, 'ruRU', 'Гармоничные боевые сапоги носителя', 39804),
(177199, 'ruRU', 'Гармоничные рукавицы носителя', 39804),
(177200, 'ruRU', 'Гармоничные набедренники носителя', 39804),
(177201, 'ruRU', 'Гармоничное наплечье носителя', 39804),
(177202, 'ruRU', 'Гармоничный ремень носителя', 39804),
(177203, 'ruRU', 'Гармоничные напульсники носителя', 39804),
(182223, 'ruRU', 'Жакет совершенного умертвия', 39804),
(182224, 'ruRU', 'Сапоги совершенного умертвия', 39804),
(182225, 'ruRU', 'Душители совершенного умертвия', 39804),
(182226, 'ruRU', 'Штаны совершенного умертвия', 39804),
(182227, 'ruRU', 'Наплечье совершенного умертвия', 39804),
(182228, 'ruRU', 'Пояс совершенного умертвия', 39804),
(182229, 'ruRU', 'Боевые наручи совершенного умертвия', 39804),
(182241, 'ruRU', 'Хауберк совершенного тактика', 39804),
(182242, 'ruRU', 'Башмаки совершенного тактика', 39804),
(182243, 'ruRU', 'Рукавицы совершенного тактика', 39804),
(182244, 'ruRU', 'Шоссы совершенного тактика', 39804),
(182245, 'ruRU', 'Наплеч совершенного тактика', 39804),
(182246, 'ruRU', 'Ремень совершенного тактика', 39804),
(182247, 'ruRU', 'Наручи совершенного тактика', 39804);

UPDATE `hotfix_optional_data` SET `VerifiedBuild` = 39804 WHERE (`TableHash` = 35137211) AND (`RecordId` = 212142) AND (`locale` = 'ruRU') AND (`Key` = 3744420815);
UPDATE `hotfix_optional_data` SET `VerifiedBuild` = 39804 WHERE (`TableHash` = 35137211) AND (`RecordId` = 211463) AND (`locale` = 'ruRU') AND (`Key` = 3744420815);
UPDATE `hotfix_optional_data` SET `VerifiedBuild` = 39804 WHERE (`TableHash` = 35137211) AND (`RecordId` = 211262) AND (`locale` = 'ruRU') AND (`Key` = 3744420815);
UPDATE `hotfix_optional_data` SET `VerifiedBuild` = 39804 WHERE (`TableHash` = 35137211) AND (`RecordId` = 210350) AND (`locale` = 'ruRU') AND (`Key` = 3744420815);
UPDATE `hotfix_optional_data` SET `VerifiedBuild` = 39804 WHERE (`TableHash` = 35137211) AND (`RecordId` = 210349) AND (`locale` = 'ruRU') AND (`Key` = 3744420815);
UPDATE `hotfix_optional_data` SET `VerifiedBuild` = 39804 WHERE (`TableHash` = 35137211) AND (`RecordId` = 210338) AND (`locale` = 'ruRU') AND (`Key` = 3744420815);
UPDATE `hotfix_optional_data` SET `VerifiedBuild` = 39804 WHERE (`TableHash` = 35137211) AND (`RecordId` = 210336) AND (`locale` = 'ruRU') AND (`Key` = 3744420815);
UPDATE `hotfix_optional_data` SET `VerifiedBuild` = 39804 WHERE (`TableHash` = 35137211) AND (`RecordId` = 209146) AND (`locale` = 'ruRU') AND (`Key` = 3744420815);
UPDATE `hotfix_optional_data` SET `VerifiedBuild` = 39804 WHERE (`TableHash` = 35137211) AND (`RecordId` = 208310) AND (`locale` = 'ruRU') AND (`Key` = 3744420815);

DELETE FROM `criteria_tree_locale` WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU' AND `ID` IN (92566);
INSERT INTO `criteria_tree_locale` (`ID`, `locale`, `Description_lang`, `VerifiedBuild`) VALUES
(92566, 'ruRU', '', 39804);

UPDATE `hotfix_blob` SET `Blob` = 0x554B5F414144435F504F5055505F5445585400576F726C64206F6620576172637261667420E2809320D181D0B5D182D0B5D0B2D0B0D18F20D0B8D0B3D180D0B02C20D0B220D0BAD0BED182D0BED180D0BED0B920D0B8D0B3D180D0BED0BAD0B820D0BCD0BED0B3D183D18220D0BED0B1D189D0B0D182D18CD181D18F20D0B4D180D183D0B320D18120D0B4D180D183D0B3D0BED0BC2E20D09FD180D0BED181D0B8D0BC20D0B2D0B0D18120D0B2D0B5D181D182D0B820D181D0B5D0B1D18F20D0BED181D0BCD0BED182D180D0B8D182D0B5D0BBD18CD0BDD0BE20D0B820D0BDD0B520D0B4D0B5D0BBD0B8D182D18CD181D18F20D0BBD0B8D187D0BDD0BED0B920D0B8D0BDD184D0BED180D0BCD0B0D186D0B8D0B5D0B920D18120D0BDD0B5D0B7D0BDD0B0D0BAD0BED0BCD186D0B0D0BCD0B82E7C6E7C6ED0A2D0B0D0BAD0B6D0B520D0BFD180D0B8D0B7D18BD0B2D0B0D0B5D0BC20D0B2D0B0D18120D181D0BED0B1D0BBD18ED0B4D0B0D182D18C20D0BFD180D0B0D0B2D0B8D0BBD0B020D0BED0B1D189D0B5D0BDD0B8D18F20D0B220D0B8D0B3D180D0B520D0B820D181D0BED0BED0B1D189D0B0D182D18C20D0BE20D0BBD18ED0B1D18BD18520D181D0BBD183D187D0B0D18FD18520D0BFD180D0B8D182D0B5D181D0BDD0B5D0BDD0B8D18F20D0B820D0BDD0B5D0BAD0BED180D180D0B5D0BAD182D0BDD0BED0B3D0BE20D0BFD0BED0B2D0B5D0B4D0B5D0BDD0B8D18F20D0B220D187D0B0D182D0B52C20D0B020D182D0B0D0BAD0B6D0B520D0BE20D0BBD18ED0B1D18BD18520D0B4D180D183D0B3D0B8D18520D0B4D0B5D0B9D181D182D0B2D0B8D18FD1852C20D0BCD0B5D188D0B0D18ED189D0B8D18520D0B4D180D183D0B3D0B8D0BC20D0B8D0B3D180D0BED0BAD0B0D0BC2C20D18120D0BFD0BED0BCD0BED189D18CD18E20D181D0BFD0B5D186D0B8D0B0D0BBD18CD0BDD18BD18520D0B2D0BDD183D182D180D0B8D0B8D0B3D180D0BED0B2D18BD18520D184D183D0BDD0BAD186D0B8D0B920E2809420D0BCD18B20D0BFD180D0BED0B2D0B5D180D0B8D0BC20D0B8D181D182D0BED180D0B8D18E20D187D0B0D182D0B020D0B820D0BFD180D0B8D0BCD0B5D0BC20D0BDD0B5D0BED0B1D185D0BED0B4D0B8D0BCD18BD0B520D0BCD0B5D180D18B2E0001, `VerifiedBuild` = 39804 WHERE (`TableHash` = 3205218938) AND (`RecordId` = 44250) AND (`locale` = 'ruRU');

DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 187917 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 187863 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182247 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182246 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182245 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182244 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182243 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182242 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182241 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182229 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182228 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182227 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182226 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182225 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182224 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 182223 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 177203 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 177202 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 177201 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 177200 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 177199 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 177198 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 177197 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3865974254 AND `RecordId` = 174303 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 360832 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 360829 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 360749 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 360592 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 358693 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 358692 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 358518 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 357073 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 357069 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 357062 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 357058 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 357052 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 357049 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 357034 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 357031 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 356593 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 356248 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 355741 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 355721 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 354098 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 354058 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 345482 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 341724 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 340433 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3776013982 AND `RecordId` = 138083 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3557796329 AND `RecordId` = 3223 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3557796329 AND `RecordId` = 2477 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3386943305 AND `RecordId` = 92453 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3386291891 AND `RecordId` = 93030 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3205218938 AND `RecordId` = 43120 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3072882582 AND `RecordId` = 9878 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3072882582 AND `RecordId` = 8001 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3072882582 AND `RecordId` = 7998 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3031818311 AND `RecordId` = 4138 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 3031818311 AND `RecordId` = 4137 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 2939349194 AND `RecordId` = 746 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 2939349194 AND `RecordId` = 744 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 2939349194 AND `RecordId` = 743 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 2381039112 AND `RecordId` = 3271 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 2299908982 AND `RecordId` = 560 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 1385971161 AND `RecordId` = 12023 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 1369604944 AND `RecordId` = 6963 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 1369604944 AND `RecordId` = 6960 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 336222293 AND `RecordId` = 8447 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 336222293 AND `RecordId` = 8446 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 336222293 AND `RecordId` = 8445 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 48336690 AND `RecordId` = 39162 AND `locale` = 'ruRU';
DELETE FROM `hotfix_blob` WHERE `TableHash` = 48336690 AND `RecordId` = 39161 AND `locale` = 'ruRU';
INSERT INTO `hotfix_blob` (`TableHash`, `RecordId`, `locale`, `Blob`, `VerifiedBuild`) VALUES
(3865974254, 187917, 'ruRU', 0x00000000, 39804),
(3865974254, 187863, 'ruRU', 0x00000000, 39804),
(3865974254, 182247, 'ruRU', 0x00000000, 39804),
(3865974254, 182246, 'ruRU', 0x00000000, 39804),
(3865974254, 182245, 'ruRU', 0x00000000, 39804),
(3865974254, 182244, 'ruRU', 0x00000000, 39804),
(3865974254, 182243, 'ruRU', 0x00000000, 39804),
(3865974254, 182242, 'ruRU', 0x00000000, 39804),
(3865974254, 182241, 'ruRU', 0x00000000, 39804),
(3865974254, 182229, 'ruRU', 0x00000000, 39804),
(3865974254, 182228, 'ruRU', 0x00000000, 39804),
(3865974254, 182227, 'ruRU', 0x00000000, 39804),
(3865974254, 182226, 'ruRU', 0x00000000, 39804),
(3865974254, 182225, 'ruRU', 0x00000000, 39804),
(3865974254, 182224, 'ruRU', 0x00000000, 39804),
(3865974254, 182223, 'ruRU', 0x00000000, 39804),
(3865974254, 177203, 'ruRU', 0x00000000, 39804),
(3865974254, 177202, 'ruRU', 0x00000000, 39804),
(3865974254, 177201, 'ruRU', 0x00000000, 39804),
(3865974254, 177200, 'ruRU', 0x00000000, 39804),
(3865974254, 177199, 'ruRU', 0x00000000, 39804),
(3865974254, 177198, 'ruRU', 0x00000000, 39804),
(3865974254, 177197, 'ruRU', 0x00000000, 39804),
(3865974254, 174303, 'ruRU', 0x00000000, 39804),
(3776013982, 360832, 'ruRU', 0x000000, 39804),
(3776013982, 360829, 'ruRU', 0x0024407370656C6C646573633332333939390000, 39804),
(3776013982, 360749, 'ruRU', 0x000000, 39804),
(3776013982, 360592, 'ruRU', 0x000000, 39804),
(3776013982, 358693, 'ruRU', 0x00D0A3D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D18220D184D0B8D0B7D0B8D187D0B5D181D0BAD0B8D0B920D183D180D0BED0BD2C20D0BDD0B0D0BDD0BED181D0B8D0BCD18BD0B920D0BDD0B0D185D0BED0B4D18FD189D0B8D0BCD0B8D181D18F20D180D18FD0B4D0BED0BC20D0B8D0B3D180D0BED0BAD0B0D0BCD0B82C20D0BDD0B0202473312520D0BDD0B02024642E20D0ADD184D184D0B5D0BAD18220D181D183D0BCD0BCD0B8D180D183D0B5D182D181D18F2E00D09DD0B0D0BDD0BED181D0B8D0BCD18BD0B920D184D0B8D0B7D0B8D187D0B5D181D0BAD0B8D0B920D183D180D0BED0BD20D183D0B2D0B5D0BBD0B8D187D0B5D0BD20D0BDD0B020247331252E00, 39804),
(3776013982, 358692, 'ruRU', 0x00D0A3D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D18220D183D180D0BED0BD20D0BED18220D182D0B5D0BCD0BDD0BED0B920D0BCD0B0D0B3D0B8D0B82C20D0BDD0B0D0BDD0BED181D0B8D0BCD18BD0B920D0BDD0B0D185D0BED0B4D18FD189D0B8D0BCD0B8D181D18F20D180D18FD0B4D0BED0BC20D0B8D0B3D180D0BED0BAD0B0D0BCD0B82C20D0BDD0B0202473312520D0BDD0B02024642E20D0ADD184D184D0B5D0BAD18220D181D183D0BCD0BCD0B8D180D183D0B5D182D181D18F2E00D0A3D180D0BED0BD20D0BED18220D182D0B5D0BCD0BDD0BED0B920D0BCD0B0D0B3D0B8D0B820D183D0B2D0B5D0BBD0B8D187D0B5D0BD20D0BDD0B020247331252E00, 39804),
(3776013982, 358518, 'ruRU', 0x00D09DD0B020246420D0BFD180D0B8D0B7D18BD0B2D0B0D0B5D18220D0B4D183D185D0B020D0A1D18ED18DD0BDD18F2C20D091D0B5D0BBD0BED0B3D0BE20D0A2D0B8D0B3D180D0B02E20D0A1D18ED18DD0BDD18C20D0B0D182D0B0D0BAD183D0B5D18220D0B2D0B0D188D18320D0BED181D0BDD0BED0B2D0BDD183D18E20D186D0B5D0BBD18C20D0B820D180D0B0D0B720D0B22024313233393939743120D181D0B5D0BA2E20D0BFD180D0B8D0BCD0B5D0BDD18FD0B5D1822022D0A2D0B8D0B3D180D0B8D0BDD183D18E20D0BCD0BED0BBD0BDD0B8D18E222C20D0BDD0B0D0BDD0BED181D18F2024313233393936733120D0B5D0B42E20D183D180D0BED0BDD0B020D0BED18220D181D0B8D0BB20D0BFD180D0B8D180D0BED0B4D18B203320D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B0D0BC20D0B220D180D0B0D0B4D0B8D183D181D0B52024313233393936413120D0BC2E0000, 39804),
(3776013982, 357073, 'ruRU', 0x007C434646323066663230D0A3D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D18220D0B2D0B0D18820D183D180D0BED0BD20D0BDD0B020247B2473312F3130307D2E322520D0BDD0B02024333536333634642E20D0BFD0BED181D0BBD0B520D182D0BED0B3D0BE2C20D0BAD0B0D0BA20D0B2D18B20D0B0D182D0B0D0BAD183D0B5D182D0B520D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B02C20D0BAD0BED182D0BED180D0BED0BCD18320D0B5D189D0B520D0BDD0B520D0BDD0B0D0BDD0BED181D0B8D0BBD0B820D183D180D0BED0BD2E7C520000, 39804),
(3776013982, 357069, 'ruRU', 0x007C434646323066663230D09AD0BED0B3D0B4D0B020D183D180D0BED0B2D0B5D0BDD18C20D0B2D0B0D188D0B5D0B3D0BE20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0B5D0B2D18BD188D0B0D0B5D18220D183D180D0BED0B2D0B5D0BDD18C20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B020D0BDD0B0202473322520D0B820D0B1D0BED0BBD0B5D0B52C20D0B2D0B0D18820D183D180D0BED0BD20D183D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D182D181D18F20D0BDD0B020247B2473312F3130307D2E31252E7C520000, 39804),
(3776013982, 357062, 'ruRU', 0x007C434646323066663230D0A3D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D18220D0B2D0B0D18820D183D180D0BED0BD20D0BDD0B020247B2473312F3130307D2E322520D0BDD0B02024333536333634642E20D0BFD0BED181D0BBD0B520D182D0BED0B3D0BE2C20D0BAD0B0D0BA20D0B2D18B20D0B0D182D0B0D0BAD183D0B5D182D0B520D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B02C20D0BAD0BED182D0BED180D0BED0BCD18320D0B5D189D0B520D0BDD0B520D0BDD0B0D0BDD0BED181D0B8D0BBD0B820D183D180D0BED0BD2E7C520000, 39804),
(3776013982, 357058, 'ruRU', 0x007C434646323066663230D09AD0BED0B3D0B4D0B020D183D180D0BED0B2D0B5D0BDD18C20D0B2D0B0D188D0B5D0B3D0BE20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0B5D0B2D18BD188D0B0D0B5D18220D183D180D0BED0B2D0B5D0BDD18C20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B020D0BDD0B0202473322520D0B820D0B1D0BED0BBD0B5D0B52C20D0B2D0B0D18820D183D180D0BED0BD20D183D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D182D181D18F20D0BDD0B020247B2473312F3130307D2E31252E7C520000, 39804),
(3776013982, 357052, 'ruRU', 0x007C434646323066663230D0A3D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D18220D0B2D0B0D18820D183D180D0BED0BD20D0BDD0B020247B2473312F3130307D2E322520D0BDD0B02024333536333634642E20D0BFD0BED181D0BBD0B520D182D0BED0B3D0BE2C20D0BAD0B0D0BA20D0B2D18B20D0B0D182D0B0D0BAD183D0B5D182D0B520D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B02C20D0BAD0BED182D0BED180D0BED0BCD18320D0B5D189D0B520D0BDD0B520D0BDD0B0D0BDD0BED181D0B8D0BBD0B820D183D180D0BED0BD2E7C520000, 39804),
(3776013982, 357049, 'ruRU', 0x007C434646323066663230D09AD0BED0B3D0B4D0B020D183D180D0BED0B2D0B5D0BDD18C20D0B2D0B0D188D0B5D0B3D0BE20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0B5D0B2D18BD188D0B0D0B5D18220D183D180D0BED0B2D0B5D0BDD18C20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B020D0BDD0B0202473322520D0B820D0B1D0BED0BBD0B5D0B52C20D0B2D0B0D18820D183D180D0BED0BD20D183D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D182D181D18F20D0BDD0B020247B2473312F3130307D2E31252E7C520000, 39804),
(3776013982, 357034, 'ruRU', 0x007C434646323066663230D0A3D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D18220D0B2D0B0D18820D183D180D0BED0BD20D0BDD0B020247B2473312F3130307D2E322520D0BDD0B02024333536333634642E20D0BFD0BED181D0BBD0B520D182D0BED0B3D0BE2C20D0BAD0B0D0BA20D0B2D18B20D0B0D182D0B0D0BAD183D0B5D182D0B520D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B02C20D0BAD0BED182D0BED180D0BED0BCD18320D0B5D189D0B520D0BDD0B520D0BDD0B0D0BDD0BED181D0B8D0BBD0B820D183D180D0BED0BD2E7C520000, 39804),
(3776013982, 357031, 'ruRU', 0x007C434646323066663230D09AD0BED0B3D0B4D0B020D183D180D0BED0B2D0B5D0BDD18C20D0B2D0B0D188D0B5D0B3D0BE20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0B5D0B2D18BD188D0B0D0B5D18220D183D180D0BED0B2D0B5D0BDD18C20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B020D0BDD0B0202473322520D0B820D0B1D0BED0BBD0B5D0B52C20D0B2D0B0D18820D183D180D0BED0BD20D183D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D182D181D18F20D0BDD0B020247B2473312F3130307D2E31252E7C520000, 39804),
(3776013982, 356593, 'ruRU', 0x00D09DD0B0D185D0BED0B4D0B8D18220D183D0BBD183D187D188D0B5D0BDD0B8D0B520D0B4D0BBD18F20D0BED0B4D0BDD0BED0B3D0BE20D0B8D0B720D0BFD180D0BED0B2D0BED0B4D0BDD0B8D0BAD0BED0B220D0B4D0BBD18F20D0B2D0B0D188D0B5D0B920D181D0BFD0B5D186D0B8D0B0D0BBD0B8D0B7D0B0D186D0B8D0B820D18120D181D0B0D0BCD18BD0BC20D0BDD0B8D0B7D0BAD0B8D0BC20D183D180D0BED0B2D0BDD0B5D0BC20D181D180D0B5D0B4D0B820D182D0B5D1852C20D187D182D0BE20D18320D0B2D0B0D18120D0B5D181D182D18C2E20D09CD0B0D0BAD181D0B8D0BCD0B0D0BBD18CD0BDD18BD0B920D183D180D0BED0B2D0B5D0BDD18C20D0BFD180D0B5D0B4D0BCD0B5D182D0B020E28093203232362E0000, 39804),
(3776013982, 356248, 'ruRU', 0x00D09DD0B0D185D0BED0B4D0B8D18220D183D0BBD183D187D188D0B5D0BDD0B8D0B520D0B4D0BBD18F20D0BED0B4D0BDD0BED0B3D0BE20D0B8D0B720D0BFD180D0BED0B2D0BED0B4D0BDD0B8D0BAD0BED0B220D0B4D0BBD18F20D0B2D0B0D188D0B5D0B920D181D0BFD0B5D186D0B8D0B0D0BBD0B8D0B7D0B0D186D0B8D0B820D18120D181D0B0D0BCD18BD0BC20D0BDD0B8D0B7D0BAD0B8D0BC20D183D180D0BED0B2D0BDD0B5D0BC20D181D180D0B5D0B4D0B820D182D0B5D1852C20D187D182D0BE20D18320D0B2D0B0D18120D0B5D181D182D18C2E20D09CD0B0D0BAD181D0B8D0BCD0B0D0BBD18CD0BDD18BD0B920D183D180D0BED0B2D0B5D0BDD18C20D0BFD180D0B5D0B4D0BCD0B5D182D0B020E28093203235322E0000, 39804),
(3776013982, 355741, 'ruRU', 0x007C434646323066663230D0A3D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D18220D0B2D0B0D18820D183D180D0BED0BD20D0BDD0B020247B2473312F3130307D2E322520D0BDD0B02024333536333634642E20D0BFD0BED181D0BBD0B520D182D0BED0B3D0BE2C20D0BAD0B0D0BA20D0B2D18B20D0B0D182D0B0D0BAD183D0B5D182D0B520D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B02C20D0BAD0BED182D0BED180D0BED0BCD18320D0B5D189D0B520D0BDD0B520D0BDD0B0D0BDD0BED181D0B8D0BBD0B820D183D180D0BED0BD2E7C520000, 39804),
(3776013982, 355721, 'ruRU', 0x007C434646323066663230D09AD0BED0B3D0B4D0B020D183D180D0BED0B2D0B5D0BDD18C20D0B2D0B0D188D0B5D0B3D0BE20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0B5D0B2D18BD188D0B0D0B5D18220D183D180D0BED0B2D0B5D0BDD18C20D0B7D0B4D0BED180D0BED0B2D18CD18F20D0BFD180D0BED182D0B8D0B2D0BDD0B8D0BAD0B020D0BDD0B0202473322520D0B820D0B1D0BED0BBD0B5D0B52C20D0B2D0B0D18820D183D180D0BED0BD20D183D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D0B5D182D181D18F20D0BDD0B020247B2473312F3130307D2E32252E7C520000, 39804),
(3776013982, 354098, 'ruRU', 0x00D09FD180D0B5D0B4D0BBD0BED0B6D0B8D182D18C20D0BAD0BED180D182D0B8D0B9D181D0BAD0BED0BCD18320D0B7D0B2D0B5D180D18CD0BAD18320D0B5D0B4D1832E0000, 39804),
(3776013982, 354058, 'ruRU', 0x00D091D180D0BED181D0B8D182D18C20D183D0B3D0BED189D0B5D0BDD0B8D0B52C20D187D182D0BED0B1D18B20D0BFD0BED0B4D0BED0B1D180D0B0D182D18CD181D18F20D0BA20D0B3D0BED0BBD0BED0B4D0BDD0BED0BCD18320D0BAD0BED180D182D0B8D0B9D181D0BAD0BED0BCD18320D0B7D0B2D0B5D180D18CD0BAD18320D0BFD0BED0B1D0BBD0B8D0B6D0B5210000, 39804),
(3776013982, 345482, 'ruRU', 0x00D09DD0B0D185D0BED0B4D0B8D18220D183D0BBD183D187D188D0B5D0BDD0B8D0B520D0B4D0BBD18F20D0BED0B4D0BDD0BED0B3D0BE20D0B8D0B720D0BFD180D0BED0B2D0BED0B4D0BDD0B8D0BAD0BED0B220D0B4D0BBD18F20D0B2D0B0D188D0B5D0B920D181D0BFD0B5D186D0B8D0B0D0BBD0B8D0B7D0B0D186D0B8D0B820D18120D181D0B0D0BCD18BD0BC20D0BDD0B8D0B7D0BAD0B8D0BC20D183D180D0BED0B2D0BDD0B5D0BC20D181D180D0B5D0B4D0B820D182D0B5D1852C20D187D182D0BE20D18320D0B2D0B0D18120D0B5D181D182D18C2E20D09CD0B0D0BAD181D0B8D0BCD0B0D0BBD18CD0BDD18BD0B920D183D180D0BED0B2D0B5D0BDD18C20D0BFD180D0B5D0B4D0BCD0B5D182D0B020E28093203232362E0000, 39804),
(3776013982, 341724, 'ruRU', 0x0022D0A3D0BDD0B8D187D182D0BED0B6D0B5D0BDD0B8D0B52220D18120D0BFD0BED0B2D18BD188D0B5D0BDD0BDD0BED0B920D0BDD0B0202473312520D0B2D0B5D180D0BED18FD182D0BDD0BED181D182D18CD18E20D0BCD0BED0B6D0B5D18220D0B0D0BAD182D0B8D0B2D0B8D180D0BED0B2D0B0D182D18C2022D098D0BDD0B5D0B9222C20D0B02022D092D0BED18ED189D0B8D0B920D0B2D0B5D182D0B5D1802220D0B4D0B0D0B5D18220247B2433343137323573312F31307D20D0B5D0B42E20D181D0B8D0BBD18B20D180D183D0BD2C20D0BFD0BED0BAD0B020D0B0D0BAD182D0B8D0B2D0B5D0BD2022D098D0BDD0B5D0B9222E0000, 39804),
(3776013982, 340433, 'ruRU', 0x00D092D0B0D18120D0BFD0B5D180D0B5D0BFD0BED0BBD0BDD18FD0B5D18220D0BFD0B5D180D0B5D180D0B0D0B1D0BED182D0B0D0BDD0BDD0B0D18F20D0B0D0BDD0B8D0BCD0B02C20D183D0B2D0B5D0BBD0B8D187D0B8D0B2D0B0D18ED189D0B0D18F20D0BDD0B0D0BDD0BED181D0B8D0BCD18BD0B920D183D180D0BED0BD20D0B820D0BED0B1D18AD0B5D0BC20D0B8D181D185D0BED0B4D18FD189D0B5D0B3D0BE20D0B8D181D186D0B5D0BBD0B5D0BDD0B8D18F20D0BDD0B0202473312520D0BDD0B02024642E00D09DD0B0D0BDD0BED181D0B8D0BCD18BD0B920D183D180D0BED0BD20D183D0B2D0B5D0BBD0B8D187D0B5D0BD20D0BDD0B020247331252E0D0AD098D181D185D0BED0B4D18FD189D0B5D0B520D0B8D181D186D0B5D0BBD0B5D0BDD0B8D0B520D183D181D0B8D0BBD0B5D0BDD0BE20D0BDD0B020247332252E00, 39804),
(3776013982, 138083, 'ruRU', 0x00D09FD180D0B5D0B2D180D0B0D189D0B0D0B5D18220D182D0B5D0BAD183D189D183D18E20D186D0B5D0BBD18C20D0B220D181D0B2D0BED18E20D0BAD0BED0BFD0B8D18E2E0000, 39804),
(3557796329, 3223, 'ruRU', 0x05000000E1E2000000009642DD000000, 39804),
(3557796329, 2477, 'ruRU', 0x08000000D32D050000005842AB000000, 39804),
(3386943305, 92453, 'ruRU', 0x00000000000000000E004C0100000000881048400000000000010200000000000001000000000000010000000000666B0100, 39804),
(3386291891, 93030, 'ruRU', 0xD096D0B5D0BBD0B5D0B7D0BDD0BED0B4D180D0B5D0B20000D094D180D0B5D0B2D0BE20D0B2D0BED0B9D0BDD18B0000040400000028FE00000000000000000000000000000000803F0000803F0000803F0000803F000000000000000000000000, 39804),
(3205218938, 43120, 'ruRU', 0x5350454C4C5F4641494C45445F435553544F4D5F4552524F525F35323900D092D18B20D0BFD0BED0BBD0BDD0BED181D182D18CD18E20D183D0BBD183D187D188D0B8D0BBD0B820D0B2D181D0B520D0BFD180D0BED0B2D0BED0B4D0BDD0B8D0BAD0B820D0B4D0BBD18F20D0B2D18BD0B1D180D0B0D0BDD0BDD0BED0B920D181D0BFD0B5D186D0B8D0B0D0BBD0B8D0B7D0B0D186D0B8D0B82E0001, 39804),
(3072882582, 9878, 'ruRU', 0xF50100000000C70C0000, 39804),
(3072882582, 8001, 'ruRU', 0xA90100000000C70C0000, 39804),
(3072882582, 7998, 'ruRU', 0x110005000000C70C0000, 39804),
(3031818311, 4138, 'ruRU', 0x4C00360A670500C70C0000, 39804),
(3031818311, 4137, 'ruRU', 0x1200370A670500C70C0000, 39804),
(2939349194, 746, 'ruRU', 0xD0A2D0B0D0B9D0BDD18BD0B920D180D18BD0BDD0BED0BA20D0A2D0B0D0B7D0B0D0B2D0B5D1882028D18DD0BFD0BED185D0B0D0BBD18CD0BDD18BD0B920D180D0B5D0B6D0B8D0BC2900D0ADD0BFD0BED185D0B0D0BBD18CD0BDD18BD0B900020310016300000073008C4E01008909170000050100000000, 39804),
(2939349194, 744, 'ruRU', 0xD0A1D0B2D18FD182D0B8D0BBD0B8D189D0B520D093D0BED181D0BFD0BED0B4D181D182D0B2D0B02028D0B3D0B5D180D0BED0B8D187D0B5D181D0BAD0B8D0B920D180D0B5D0B6D0B8D0BC2900D093D0B5D180D0BED0B8D187D0B5D181D0BAD0B8D0B90003020F0123000000E2008C4E010092090F00001E0000000000, 39804),
(2939349194, 743, 'ruRU', 0xD0A1D0B2D18FD182D0B8D0BBD0B8D189D0B520D093D0BED181D0BFD0BED0B4D181D182D0B2D0B02028D0BED0B1D18BD187D0BDD18BD0B920D180D0B5D0B6D0B8D0BC2900D09ED0B1D18BD187D0BDD18BD0B90003010F0123000000D5008C4E010092090E00001E0000000000, 39804),
(2381039112, 3271, 'ruRU', 0x00C70C000000000000A70400005407000000000000000000000000000000, 39804),
(2299908982, 560, 'ruRU', 0x0000000000, 39804),
(1385971161, 12023, 'ruRU', 0x30020000C70C0000, 39804),
(1369604944, 6963, 'ruRU', 0x000000000000000000000000000000000000000000000000331B0000FA9800000000162200000000000000002C010000EE02140200003A0B0000000000000000001218, 39804),
(1369604944, 6960, 'ruRU', 0x000000000000000000000000000000000000000000000000301B0000210200000000162200000000000000002C010000EE021402000000000000000000000000001218, 39804),
(336222293, 8447, 'ruRU', 0x00D000C70C0000, 39804),
(336222293, 8446, 'ruRU', 0x001101C70C0000, 39804),
(336222293, 8445, 'ruRU', 0x001300C70C0000, 39804),
(48336690, 39162, 'ruRU', 0x0000000000000000000040400000C03F000090400000803F00000000000000000000000009000000000000000000000000000000FFFFFFFF00, 39804),
(48336690, 39161, 'ruRU', 0x0000000000000000000040400000C03F000090400000803F0000000000000000000000000A000000000000000000000000000000FFFFFFFF00, 39804);

DELETE FROM `spell_name_locale` WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU' AND `ID` IN (360832, 360829, 360749, 360592, 358693, 358692, 358518, 357073, 357069, 357062, 357058, 357052, 357049, 357034, 357031, 356593, 356248, 355741, 355721, 354098, 354058, 345482, 341724, 340433, 138083);
INSERT INTO `spell_name_locale` (`ID`, `locale`, `Name_lang`, `VerifiedBuild`) VALUES
(138083, 'ruRU', 'Буря, земля и огонь', 39804),
(340433, 'ruRU', 'Благословение Грехопада', 39804),
(341724, 'ruRU', 'Ярость ледяного защитника', 39804),
(345482, 'ruRU', 'Освобожденная реальность', 39804),
(354058, 'ruRU', 'Угощение', 39804),
(354098, 'ruRU', 'Предложить лакомство', 39804),
(355721, 'ruRU', 'Осколок Бек', 39804),
(355741, 'ruRU', 'Осколок Кор', 39804),
(356248, 'ruRU', 'Потусторонний переплет', 39804),
(356593, 'ruRU', 'Энергия распада', 39804),
(357031, 'ruRU', 'Зловещий осколок Бек', 39804),
(357034, 'ruRU', 'Зловещий осколок Кор', 39804),
(357049, 'ruRU', 'Опустошенный осколок Бек', 39804),
(357052, 'ruRU', 'Опустошенный осколок Кор', 39804),
(357058, 'ruRU', 'Пугающий осколок Бек', 39804),
(357062, 'ruRU', 'Пугающий осколок Кор', 39804),
(357069, 'ruRU', 'Сулящий беду осколок Бек', 39804),
(357073, 'ruRU', 'Сулящий беду осколок Кор', 39804),
(358518, 'ruRU', 'Призыв Сюэня, Белого Тигра', 39804),
(358692, 'ruRU', 'Тьма души', 39804),
(358693, 'ruRU', 'Ярость души', 39804),
(360592, 'ruRU', 'Spectral Feline', 39804),
(360749, 'ruRU', 'Kill Credit', 39804),
(360829, 'ruRU', 'Усиленная тигриная молния', 39804),
(360832, 'ruRU', 'Crackling Tiger Lightning Driver', 39804);

DELETE FROM `map_locale` WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU' AND `ID` IN (2450);
INSERT INTO `map_locale` (`ID`, `locale`, `MapName_lang`, `MapDescription0_lang`, `MapDescription1_lang`, `PvpShortDescription_lang`, `PvpLongDescription_lang`, `VerifiedBuild`) VALUES
(2450, 'ruRU', 'Святилище Господства', '', '', '', '', 39804);

DELETE FROM `item_sparse_locale` WHERE (`ID` = 136605) AND (`locale` = 'ruRU');

DELETE FROM `item_sparse_locale` WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU' AND `ID` IN (187917, 187863, 182247, 182246, 182245, 182244, 182243, 182242, 182241, 182229, 182228, 182227, 182226, 182225, 182224, 182223, 177203, 177202, 177201, 177200, 177199, 177198, 177197, 174303);
INSERT INTO `item_sparse_locale` (`ID`, `locale`, `Description_lang`, `Display3_lang`, `Display2_lang`, `Display1_lang`, `Display_lang`, `VerifiedBuild`) VALUES
(174303, 'ruRU', '', '', '', '', 'Гармоничный тесак автоматурга', 39804),
(177197, 'ruRU', '', '', '', '', 'Гармоничная бригантина носителя', 39804),
(177198, 'ruRU', '', '', '', '', 'Гармоничные боевые сапоги носителя', 39804),
(177199, 'ruRU', '', '', '', '', 'Гармоничные рукавицы носителя', 39804),
(177200, 'ruRU', '', '', '', '', 'Гармоничные набедренники носителя', 39804),
(177201, 'ruRU', '', '', '', '', 'Гармоничное наплечье носителя', 39804),
(177202, 'ruRU', '', '', '', '', 'Гармоничный ремень носителя', 39804),
(177203, 'ruRU', '', '', '', '', 'Гармоничные напульсники носителя', 39804),
(182223, 'ruRU', '', '', '', '', 'Жакет совершенного умертвия', 39804),
(182224, 'ruRU', '', '', '', '', 'Сапоги совершенного умертвия', 39804),
(182225, 'ruRU', '', '', '', '', 'Душители совершенного умертвия', 39804),
(182226, 'ruRU', '', '', '', '', 'Штаны совершенного умертвия', 39804),
(182227, 'ruRU', '', '', '', '', 'Наплечье совершенного умертвия', 39804),
(182228, 'ruRU', '', '', '', '', 'Пояс совершенного умертвия', 39804),
(182229, 'ruRU', '', '', '', '', 'Боевые наручи совершенного умертвия', 39804),
(182241, 'ruRU', '', '', '', '', 'Хауберк совершенного тактика', 39804),
(182242, 'ruRU', '', '', '', '', 'Башмаки совершенного тактика', 39804),
(182243, 'ruRU', '', '', '', '', 'Рукавицы совершенного тактика', 39804),
(182244, 'ruRU', '', '', '', '', 'Шоссы совершенного тактика', 39804),
(182245, 'ruRU', '', '', '', '', 'Наплеч совершенного тактика', 39804),
(182246, 'ruRU', '', '', '', '', 'Ремень совершенного тактика', 39804),
(182247, 'ruRU', '', '', '', '', 'Наручи совершенного тактика', 39804),
(187863, 'ruRU', 'Ключ постоянно то появляется, то снова уходит в небытие. Сложно как следует разглядеть... или хотя бы понять, есть ли он на самом деле.', '', '', '', 'Эфемерный ключ', 39804),
(187917, 'ruRU', '', '', '', '', 'Чай безумного герцога', 39804);

UPDATE `broadcast_text_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU' AND `ID` IN (212589, 212227, 212142, 211907, 211463, 211262, 210756, 210419, 210350, 210349, 210338, 210336, 209648, 209146, 208310, 207999, 202525, 130831, 116249, 56587, 56586, 56585, 56582, 56581, 56312, 56277, 56276, 56270, 56269, 54347, 54338, 53929, 48182, 48181, 48180, 47584, 45365, 31716, 27048, 27046, 27043, 27042, 26970, 26969, 26968, 26967, 26966, 26965, 26964, 26963, 26956, 26936, 26798, 9875, 9874, 9872, 9870);
UPDATE `faction_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `currency_types_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `item_name_description_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `gameobjects_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `hotfix_blob` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `item_sparse_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `friendship_reputation_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `lfg_dungeons_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `mount_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `item_search_name_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `map_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `map_difficulty_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `achievement_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `area_table_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `criteria_tree_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `dungeon_encounter_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `adventure_journal_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `pvp_talent_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `player_condition_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `spell_name_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `toy_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `transmog_set_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `wmo_area_table_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';
UPDATE `ui_map_locale` SET `VerifiedBuild` = 39804 WHERE `VerifiedBuild` > 0 AND `locale` = 'ruRU';