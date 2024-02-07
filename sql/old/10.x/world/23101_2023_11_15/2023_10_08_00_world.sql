-- 
DELETE FROM `serverside_spell` WHERE `Id` IN (95940, 108997, 109108, 115607, 129630, 132382, 132428, 169793, 182603, 222453) AND `DifficultyID`=0;
INSERT INTO `serverside_spell` (`Id`, `DifficultyID`, `CategoryId`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `AttributesEx8`, `AttributesEx9`, `AttributesEx10`, `AttributesEx11`, `AttributesEx12`, `AttributesEx13`, `AttributesEx14`, `Stances`, `StancesNot`, `Targets`, `TargetCreatureType`, `RequiresSpellFocus`, `FacingCasterFlags`, `CasterAuraState`, `TargetAuraState`, `ExcludeCasterAuraState`, `ExcludeTargetAuraState`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CasterAuraType`, `TargetAuraType`, `ExcludeCasterAuraType`, `ExcludeTargetAuraType`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `StartRecoveryCategory`, `StartRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags1`, `AuraInterruptFlags2`, `ChannelInterruptFlags1`, `ChannelInterruptFlags2`, `ProcFlags`, `ProcFlags2`, `ProcChance`, `ProcCharges`, `ProcCooldown`, `ProcBasePPM`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `Speed`, `LaunchDelay`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `ContentTuningId`, `SpellName`, `ConeAngle`, `ConeWidth`, `MaxTargetLevel`, `MaxAffectedTargets`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `SpellFamilyFlags4`, `DmgClass`, `PreventionType`, `AreaGroupId`, `SchoolMask`, `ChargeCategoryId`) VALUES
(95940, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 165, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift - 7 Second Delay', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(108997, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift - 1 Second Delay', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(109108, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift - 2 Second Delay', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(115607, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift - 5 Second Delay', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(129630, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 407, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift - 0.1 Second Delay', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(132382, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift - 1.5 Second Delay', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(132428, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 407, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift - 0.1 Second Delay', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(169793, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 407, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift - 0.1 Second Delay', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(182603, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 327, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift -  0.5 Second Delay', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(222453, 0, 0, 0, 0, (0x29800180), (0x420), (0x10484005), (0x10130200), (0x800080), (0x60008), (0x1200), 0, 0, (0x100000), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 1, 0, 0, 0, -1, 0, 0, 0, '(Serverside/Non-DB2) Update Zone Auras and Phase Shift Delayed 5 seconds', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);

DELETE FROM `serverside_spell_effect` WHERE `SpellID` IN (95940, 108997, 109108, 115607, 129630, 132382, 132428, 169793, 182603, 222453) AND `EffectIndex` = 0 AND `DifficultyID`=0;
INSERT INTO `serverside_spell_effect` (`SpellID`, `EffectIndex`, `DifficultyID`, `Effect`, `EffectAura`, `EffectAmplitude`, `EffectAttributes`, `EffectAuraPeriod`, `EffectBonusCoefficient`, `EffectChainAmplitude`, `EffectChainTargets`, `EffectItemType`, `EffectMechanic`, `EffectPointsPerResource`, `EffectPosFacing`, `EffectRealPointsPerLevel`, `EffectTriggerSpell`, `BonusCoefficientFromAP`, `PvpMultiplier`, `Coefficient`, `Variance`, `ResourceCoefficient`, `GroupSizeBasePointsCoefficient`, `EffectBasePoints`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectSpellClassMask1`, `EffectSpellClassMask2`, `EffectSpellClassMask3`, `EffectSpellClassMask4`, `ImplicitTarget1`, `ImplicitTarget2`) VALUES
(95940, 0, 0, 6, 23, 0, 0, 7000, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(108997, 0, 0, 6, 23, 0, 0, 1000, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(109108, 0, 0, 6, 23, 0, 0, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(115607, 0, 0, 6, 23, 0, 0, 5000, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(129630, 0, 0, 6, 23, 0, 0, 100, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(132382, 0, 0, 6, 23, 0, 0, 1500, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(132428, 0, 0, 6, 23, 0, 0, 100, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(169793, 0, 0, 6, 23, 0, 0, 100, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(182603, 0, 0, 6, 23, 0, 0, 500, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(222453, 0, 0, 6, 23, 0, 0, 5000, 0, 1, 0, 0, 0, 0, 0, 0, 81040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);