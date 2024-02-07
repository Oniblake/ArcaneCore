#include "Arcanium.h"

namespace GlobalSystemBattleSystem
{

    unordered_map <uint32, float> ZONE_XP_SCALING;
    unordered_map <uint32, float> ZONE_XP_SCALING_FOR_PLAYER;
    unordered_map <uint32, uint32> CREATE_SPELL_LEARN;
    unordered_map <uint32, string> SPELL_AURA;
    unordered_map <uint32, string> SPELL_CAST;

    static int SPELL_MAX_COUNT = 10;

    class CommandScriptBattleSystem : public CommandScript
    {
        private:
            static void updateClientData(Player * player)
            {}
        public:
            CommandScriptBattleSystem() : CommandScript("CommandScriptBattleSystem") { };

            ChatCommandTable GetCommands() const override
            {
                static ChatCommandTable bsLearnSubList =
                {
                    { "",                    handleBsLearnStatCommand,              /**/                                  rbac::COMMAND_BS_LEARN,                   Console::No   },
                };
                static ChatCommandTable bsSetSubList =
                {
                    { "pvp heal",            handleBsSetPvpHeal,             LANG_COMMAND_BS_SET_PVP_HEAL_HELP,           rbac::COMMAND_BS_SET_PVP_HEAL,            Console::No   },
                    { "pvp critical",        handleBsSetPvpCritical,         LANG_COMMAND_BS_SET_PVP_CRITICAL_HELP,       rbac::COMMAND_BS_SET_PVP_CRITICAL,        Console::No   },
                    { "pvp armor",           handleBsSetPvpArmor,            LANG_COMMAND_BS_SET_PVP_ARMOR_HELP,          rbac::COMMAND_BS_SET_PVP_ARMOR,           Console::No   },
                    { "pvp damage",          handleBsSetPvpDamage,           LANG_COMMAND_BS_SET_PVP_DAMAGE_HELP,         rbac::COMMAND_BS_SET_PVP_DAMAGE,          Console::No   },
                    { "pvp free",            handleBsSetPvpFree,             LANG_COMMAND_BS_SET_PVP_FREE_HELP,           rbac::COMMAND_BS_SET_PVP_FREE,            Console::No   },
                    { "pve heal",            handleBsSetPveHeal,             LANG_COMMAND_BS_SET_PVE_HEAL_HELP,           rbac::COMMAND_BS_SET_PVE_HEAL,            Console::No   },
                    { "pve defense magic",   handleBsSetPveDefenseMagic,     LANG_COMMAND_BS_SET_PVE_DEFENSE_MAGIC_HELP,  rbac::COMMAND_BS_SET_PVE_DEFENSE_MAGIC,   Console::No   },
                    { "pve defense ranged",  handleBsSetPveDefenseRanged,    LANG_COMMAND_BS_SET_PVE_DEFENSE_RANGED_HELP, rbac::COMMAND_BS_SET_PVE_DEFENSE_RANGED,  Console::No   },
                    { "pve defense melee",   handleBsSetPveDefenseMelee,     LANG_COMMAND_BS_SET_PVE_DEFENSE_MELEE_HELP,  rbac::COMMAND_BS_SET_PVE_DEFENSE_MELEE,   Console::No   },
                    { "pve attack magic",    handleBsSetPveAttackMagic,      LANG_COMMAND_BS_SET_PVE_ATTACK_MAGIC_HELP,   rbac::COMMAND_BS_SET_PVE_ATTACK_MAGIC,    Console::No   },
                    { "pve attack ranged",   handleBsSetPveAttackRanged,     LANG_COMMAND_BS_SET_PVE_ATTACK_RANGED_HELP,  rbac::COMMAND_BS_SET_PVE_ATTACK_RANGED,   Console::No   },
                    { "pve attack melee",    handleBsSetPveAttackMelee,      LANG_COMMAND_BS_SET_PVE_ATTACK_MELEE_HELP,   rbac::COMMAND_BS_SET_PVE_ATTACK_MELEE,    Console::No   },
                    { "pve free",            handleBsSetPveFreeCommand,      LANG_COMMAND_BS_SET_PVE_FREE_HELP,           rbac::COMMAND_BS_SET_PVE_FREE,            Console::No   },
                    { "chatmodifier",        handleBsSetChatModifierCommand, LANG_COMMAND_BS_SET_CHATMODIFIER_HELP,       rbac::COMMAND_BS_SET_CHATMODIFIER,        Console::No   },
                    { "",                    handleBsSetCommand,             LANG_COMMAND_BS_SET_HELP,                    rbac::COMMAND_BS_SET,                     Console::No   },
                };
                static ChatCommandTable bsSubList =
                {
                    { "cast",                handleBsCastCommand,                                                         rbac::COMMAND_BS_CAST,                    Console::No   },
                    { "learn",               bsLearnSubList,                                                                                                                      },
                    { "info",                handleBsInfoCommand,                                                         rbac::COMMAND_BS_INFO,                    Console::No   },
                    { "set",                 bsSetSubList,                                                                                                                        },
                    { "",                    handleBsCommand,                LANG_COMMAND_BS_HELP,                        rbac::COMMAND_BS,                         Console::Yes  },
                };
                static ChatCommandTable rpsSetSublist =
                {
                    { "animkit",            handleRpsSetAnimkitCommand,                                                   rbac::COMMAND_RPS_SET_ANIMKIT,            Console::No   },
                    { "scale",              handleRpsSetScaleCommand,                                                     rbac::COMMAND_RPS_SET_SCALE,              Console::No   },
                    { "",                   handleRpsSetCommand,                                                          rbac::COMMAND_RPS,                        Console::No   },
                };
                static ChatCommandTable rpsSubList =
                {
                    { "barbershop",          handleRpsBarbershopCommand,                                                  rbac::COMMAND_RPS_BARBERSHOP,             Console::No   },
                    { "set",                 rpsSetSublist                                                                                                                        },
                    { "",                    handleRpsCommand,                                                            rbac::COMMAND_RPS,                        Console::No   },
                };
                static ChatCommandTable mainList =
                {
                    { "rps",                 rpsSubList                                                                                                                           },
                    { "bs",                  bsSubList                                                                                                                            },
                };
                return mainList;
            };
            static bool handleBsCastCommand(ChatHandler * ch, uint32 spellid)
            {
                if (spellid <= 0)
                    return true;

                Player* _player = ch->GetPlayer();

                Unit* _target = _player->GetSelectedUnit();

                if (!_target)
                    _target = _player;

                if (SPELL_AURA.count(spellid) == 1)
                {
                    Unit::AuraApplicationMap const& PlayerAuras = _player->GetAppliedAuras();
                    int auranum = 0;
                    for (auto const& [AuraUID, AuraApp] : PlayerAuras) {
                        if (SPELL_AURA.count(AuraUID) == 1) {
                            auranum++;
                        }
                        if (auranum >= SPELL_MAX_COUNT) {
                            ch->SendSysMessage("[Arcanium System]: |cffFF0000Maximum auras count, resetting...|r");
                            for (auto const& [AuraUID, AuraApp] : PlayerAuras) {
                                if (SPELL_AURA.count(AuraUID) == 1 && _player->HasAura(AuraUID)) {
                                    _player->RemoveAura(AuraApp);
                                }
                            }
                        }
                    }
                    if (SPELL_AURA.count(spellid) == 1)
                    {
                        if (_player->HasAura(spellid))
                            _player->RemoveAura(spellid);
                        else
                            _player->AddAura(spellid, _player);
                    }
                    return true;
                }

                if (SPELL_CAST.count(spellid) == 1)
                {
                    if (SPELL_CAST.count(spellid) == 1)
                    {
                        _player->CastSpell(_target, spellid, TRIGGERED_FULL_DEBUG_MASK);
                    }
                    return true;
                }

                return true;
            }
            static bool handleRpsSetAnimkitCommand(ChatHandler * ch, uint16 animkit)
            {
                Player* player = ch->GetPlayer();
                player->SetAIAnimKitId(0);
                player->PlayOneShotAnimKitId(0);
                player->SetAIAnimKitId(animkit);

                return true;
            }
            static bool handleRpsBarbershopCommand(ChatHandler* ch)
            {
                Player* player = ch->GetPlayer();

                if (player)
                {
                    if (!player->HasAura(AURA_FREE_BARBER))
                    {
                        player->AddAura(AURA_FREE_BARBER, player);
                    }

                    player->sendBarbershopUI();
                }

                return true;
            }
            static bool handleRpsChangeScale(ChatHandler* ch, float scale)
            {
                Player* player = ch->GetPlayer();
                Player* target = player->GetSelectedPlayer();
                if (target)
                {
                    uint64 guid = target->GetGUID().GetCounter();
                    if (guid == player->GetGUID().GetCounter())
                        return true;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `scale`={} WHERE `guid`={}", scale, guid);
                    player->SetObjectScale(scale);
                    return true;
                }
                return true;
            }
            static bool handleRpsSetScaleCommand(ChatHandler* ch, float scale)
            {
                Player* player = ch->GetPlayer();
                uint64 guid = player->GetGUID().GetCounter();
                if (scale < 0.9f || scale > 1.1f)
                    return true;
                CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `scale`={} WHERE `guid`={}", scale, guid);
                player->SetObjectScale(scale);
                return true;
            }
            static bool handleRpsSetCommand(ChatHandler* ch)
            {
                return true;
            }
            static bool handleRpsCommand(ChatHandler* ch)
            {
                return true;
            }
            static bool handleBsLearnStatCommand(ChatHandler* ch, uint32 stat, uint32 count) {
                Player* player = ch->GetPlayer();
                uint64 guid = player->GetGUID().GetCounter();
                if (player->isAddonEnabled == false)
                    return true;
                if (count > player->stat_pve_free && count > player->stat_pvp_free)
                    return true;
                uint32 pvp_dmg = player->stat_pvp_damage + count;
                uint32 pvp_armor = player->stat_pvp_armor + count;
                uint32 pvp_critical = player->stat_pvp_critical + count;
                uint32 pvp_heal = player->stat_pvp_heal + count;
                uint32 pve_dmg = player->stat_pve_attack_melee + count;
                uint32 pve_dmg_r = player->stat_pve_attack_ranged + count;
                uint32 pve_dmg_mag = player->stat_pve_attack_magic + count;
                uint32 pve_def = player->stat_pve_defense_melee + count;
                uint32 pve_def_r = player->stat_pve_defense_ranged + count;
                uint32 pve_def_m = player->stat_pve_defense_magic + count;
                uint32 pve_heal = player->stat_pve_heal + count;

                if (
                    pvp_dmg > 80 ||
                    pvp_armor > 80 ||
                    pvp_critical > 80 ||
                    pvp_heal > 80 ||
                    pve_dmg > 80 ||
                    pve_dmg_r > 80 ||
                    pve_dmg_mag > 80 ||
                    pve_def > 80 ||
                    pve_def_r > 80 ||
                    pve_def_m > 80 ||
                    pve_heal > 80
                    )
                {
                    return true;
                }

                // Preventing out of range
                switch (stat)
                {
                case 1:
                    player->stat_pvp_damage += count;
                    player->stat_pvp_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pvp_damage`={}, `stat_pvp_free`={} WHERE `guid`={}", player->stat_pvp_damage, player->stat_pvp_free, guid);
                    break;
                case 2:
                    player->stat_pvp_armor += count;
                    player->stat_pvp_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pvp_armor`={}, `stat_pvp_free`={} WHERE `guid`={}", player->stat_pvp_armor, player->stat_pvp_free, guid);
                    break;
                case 3:
                    player->stat_pvp_critical += count;
                    player->stat_pvp_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pvp_crit`={}, `stat_pvp_free`={} WHERE `guid`={}", player->stat_pvp_critical, player->stat_pvp_free, guid);
                    break;
                case 4:
                    player->stat_pvp_heal += count;
                    player->stat_pvp_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pvp_heal`={}, `stat_pvp_free`={} WHERE `guid`={}", player->stat_pvp_heal, player->stat_pvp_free, guid);
                    break;
                case 5:
                    player->stat_pve_attack_melee += count;
                    player->stat_pve_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_defense_melee`={}, `stat_pve_free`={} WHERE `guid`={}", player->stat_pve_defense_melee, player->stat_pve_free, guid);
                    break;
                case 6:
                    player->stat_pve_attack_ranged += count;
                    player->stat_pve_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_attack_ranged`={}, `stat_pve_free`={} WHERE `guid`={}", player->stat_pve_attack_ranged, player->stat_pve_free, guid);
                    break;
                case 7:
                    player->stat_pve_attack_magic += count;
                    player->stat_pve_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_attack_magic`={}, `stat_pve_free`={} WHERE `guid`={}", player->stat_pve_attack_magic, player->stat_pve_free, guid);
                    break;
                case 8:
                    player->stat_pve_defense_melee += count;
                    player->stat_pve_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_defense_melee`={}, `stat_pve_free`={} WHERE `guid`={}", player->stat_pve_defense_melee, player->stat_pve_free, guid);
                    break;
                case 9:
                    player->stat_pve_defense_ranged += count;
                    player->stat_pve_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_defense_ranged`={}, `stat_pve_free`={} WHERE `guid`={}", player->stat_pve_defense_ranged, player->stat_pve_free, guid);
                    break;
                case 10:
                    player->stat_pve_defense_magic += count;
                    player->stat_pve_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_defense_magic`={}, `stat_pve_free`={} WHERE `guid`={}", player->stat_pve_defense_magic, player->stat_pve_free, guid);
                    break;
                case 11:
                    player->stat_pve_heal += count;
                    player->stat_pve_free -= count;
                    CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_heal`={}, `stat_pve_free`={} WHERE `guid`={}", player->stat_pve_heal, player->stat_pve_free, guid);
                    break;
                default:
                    return true;
                    break;
                }
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:START");
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVP_FREE:" + to_string(player->stat_pvp_free));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVP_DAMAGE:" + to_string(player->stat_pvp_damage));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVP_ARMOR:" + to_string(player->stat_pvp_armor));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVP_CRITICAL:" + to_string(player->stat_pvp_critical));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVP_HEAL:" + to_string(player->stat_pvp_heal));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVE_FREE:" + to_string(player->stat_pve_free));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVE_ATTACK_MELEE:" + to_string(player->stat_pve_attack_melee));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVE_ATTACK_RANGED:" + to_string(player->stat_pve_attack_ranged));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVE_ATTACK_MAGIC:" + to_string(player->stat_pve_attack_magic));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVE_DEFENSE_MELEE:" + to_string(player->stat_pve_defense_melee));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVE_DEFENSE_RANGED:" + to_string(player->stat_pve_defense_ranged));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVE_DEFENSE_MAGIC:" + to_string(player->stat_pve_defense_magic));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:PVE_HEAL:" + to_string(player->stat_pve_heal));
                addonAnnouncePlayer(player, "SMSG:SERVER:STATS:END");

                return true;
            }
            static bool handleBsCommand(ChatHandler*ch) { return false; }
            static bool handleBsSetCommand(ChatHandler* ch) { return false; }
            static bool handleBsSetChatModifierCommand(ChatHandler* ch, Optional<float> value) {
                if (!value.has_value())
                    return false;
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pve_free = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `chatbox_modifier`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_CHATMODIFIER_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPveFreeCommand(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if(me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if(target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pve_free = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_free`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_PVE_FREE_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPvpHeal(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pvp_heal = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pvp_heal`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_PVP_HEAL_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPvpCritical(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pvp_critical = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pvp_crit`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_PVP_CRITICAL_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPvpArmor(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pvp_armor = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pvp_armor`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_PVP_ARMOR_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPvpDamage(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pvp_damage = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pvp_damage`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_PVP_ATTACK_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPvpFree(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pvp_free = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pvp_free`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_PVP_FREE_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPveHeal(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pve_heal = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_heal`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_HEAL_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPveDefenseMagic(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pve_defense_magic = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_defense_magic`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_DEFENSE_MAGIC_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPveDefenseRanged(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pve_defense_ranged = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_defense_ranged`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_DEFENSE_RANGED_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPveDefenseMelee(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pve_defense_melee = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_defense_melee`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_DEFENSE_MELEE_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPveAttackMagic(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pve_attack_magic = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_attack_magic`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_ATTACK_MAGIC_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPveAttackRanged(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pve_attack_ranged = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_attack_ranged`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_ATTACK_RANGED_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsSetPveAttackMelee(ChatHandler* ch, Optional<uint32> value) {
                if (!value.has_value())
                    return false;
                if (value.value() > STAT_MAX)
                {
                    return true;
                }
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if (target)
                    {
                        if (!target->IsPlayer()) return false;
                        Player* pTarget = target->ToPlayer();
                        pTarget->stat_pve_attack_melee = value.value();
                        CharacterDatabase.PExecute("UPDATE `characters_custom_info` SET `stat_pve_attack_melee`={} WHERE `guid`={}", value.value(), pTarget->GetGUID().GetCounter());
                        ch->PSendSysMessage(LANG_MSG_ATTACK_MELEE_SUCCESS, value.value(), ch->playerLink(pTarget->GetName()));
                        updateClientData(pTarget);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            static bool handleBsInfoCommand(ChatHandler* ch) {
                Player* me = ch->GetPlayer();
                if (me)
                {
                    Unit* target = me->GetSelectedUnit();
                    if(target)
                    {
                        if(target->IsPlayer())
                        {
                            Player* pTarget = target->ToPlayer();
                            ch->PSendSysMessage("===========================");
                            ch->PSendSysMessage("Information about player stats (%s):", ch->playerLink(pTarget->GetName()));
                            ch->PSendSysMessage("ChatBox modifier: %f", pTarget->chatbox_modifier);
                            ch->PSendSysMessage("PVP Free: %u", pTarget->stat_pvp_free);
                            ch->PSendSysMessage("PVE Free: %u", pTarget->stat_pve_free);
                            ch->PSendSysMessage("PVE Stats:");
                            ch->PSendSysMessage("PVE Attack Melee: %u-100", pTarget->stat_pve_attack_melee);
                            ch->PSendSysMessage("PVE Attack Ranged: %u-100", pTarget->stat_pve_attack_ranged);
                            ch->PSendSysMessage("PVE Attack Magic: %u-100", pTarget->stat_pve_attack_magic);
                            ch->PSendSysMessage("PVE Defense Melee: %u-100", pTarget->stat_pve_defense_melee);
                            ch->PSendSysMessage("PVE Defense Ranged: %u-100", pTarget->stat_pve_defense_ranged);
                            ch->PSendSysMessage("PVE Defense Magic: %u-100", pTarget->stat_pve_defense_magic);
                            ch->PSendSysMessage("PVE Heal: %u-100", pTarget->stat_pve_heal);
                            ch->PSendSysMessage("PVP Stats:");
                            ch->PSendSysMessage("PVP Attack: %u-100", pTarget->stat_pvp_damage);
                            ch->PSendSysMessage("PVP Armor: %u-100", pTarget->stat_pvp_armor);
                            ch->PSendSysMessage("PVP Critical: %u-100", pTarget->stat_pvp_critical);
                            ch->PSendSysMessage("PVP Heal: %u-100", pTarget->stat_pvp_heal);
                            ch->PSendSysMessage("===========================");
                            return true;
                        }
                        ch->PSendSysMessage("You must selected a player, (or youself in target).");
                        return true;
                    }
                    ch->PSendSysMessage("You must selected a player, (or youself in target).");
                    return true;
                }
                return true;
            }
    };
    class WorldScriptBattleSystem : public WorldScript
    {
        public:
            WorldScriptBattleSystem() : WorldScript("WorldScriptBattleSystem") {}

            void OnStartup()
            {
                TC_LOG_INFO("server.worldserver", "[Arcanium BattleSystem]: >> Loading zone xp scaling data...");
                QueryResult zoneScaling = WorldDatabase.PQuery("SELECT * FROM `custom_zone_scaling`");
                if (zoneScaling)
                {
                    do
                    {
                        Field* scalingData = zoneScaling->Fetch();
                        uint32 map = scalingData[0].GetUInt32();
                        uint32 area = scalingData[1].GetUInt32();
                        float modifier = scalingData[2].GetFloat();
                        ZONE_XP_SCALING[area] = modifier;
                    } while (zoneScaling->NextRow());
                }
                TC_LOG_INFO("server.worldserver", "[Arcanium BattleSystem]: Loaded {} zone xp scaling data", ZONE_XP_SCALING.size());
                TC_LOG_INFO("server.worldserver", "[Arcanium BattleSystem]: >> Loading player create learn spell(s) data...");
                QueryResult spellQuery = CharacterDatabase.PQuery("SELECT * FROM `custom_spell_create`");
                if (spellQuery)
                {
                    do
                    {
                        Field* spellData = spellQuery->Fetch();
                        uint32 spellID = spellData[0].GetUInt32();
                        uint32 classID = spellData[1].GetUInt32();
                        CREATE_SPELL_LEARN[spellID] = classID;
                    } while (spellQuery->NextRow());
                }
                TC_LOG_INFO("server.worldserver", "[Arcanium BattleSystem]: Loaded {} player create learn spell(s) data", CREATE_SPELL_LEARN.size());

                TC_LOG_INFO("server.worldserver", "[Arcanium BattleSystem]: Loading non-cast spell(s)...");

                QueryResult nonCastQuery = CharacterDatabase.PQuery("SELECT * FROM `custom_player_spell` WHERE `cast`=0");
                if (nonCastQuery)
                {
                    do
                    {
                        Field* spellData = nonCastQuery->Fetch();
                        uint32 spellID = spellData[0].GetUInt32();
                        string spellName = spellData[1].GetString();
                        SPELL_AURA[spellID] = spellName;
                    } while (nonCastQuery->NextRow());
                }
                TC_LOG_INFO("server.worldserver", "[Arcanium BattleSystem]: Loaded {} non-cast spell(s)!", SPELL_AURA.size());

                QueryResult castQuery = CharacterDatabase.PQuery("SELECT * FROM `custom_player_spell` WHERE `cast`=1");
                TC_LOG_INFO("server.worldserver", "[Arcanium BattleSystem]: Loading cast spell(s)...");
                if (castQuery)
                {
                    do
                    {
                        Field* spellData = castQuery->Fetch();
                        uint32 spellID = spellData[0].GetUInt32();
                        string spellName = spellData[1].GetString();
                        SPELL_CAST[spellID] = spellName;
                    } while (castQuery->NextRow());
                }
                TC_LOG_INFO("server.worldserver", "[Arcanium BattleSystem]: Loaded {} cast spell(s)!", SPELL_CAST.size());
            }
    };
    class PlayerScriptBattleSystem : public PlayerScript
    {
        private:
            void calculateDamage(Player * player)
            {
                uint8 currLevel = player->GetLevel();
                uint32 dmg = 10 * (currLevel / 10);
                player->stat_pvp_damage += dmg;
            }
            int utf8str_len(const string& str)
            {
                int c, i, ix, q;
                for (q = 0, i = 0, ix = str.length(); i < ix; i++, q++)
                {
                    c = (unsigned char)str[i];
                    if (c >= 0 && c <= 127) i += 0;
                    else if ((c & 0xE0) == 0xC0) i += 1;
                    else if ((c & 0xF0) == 0xE0) i += 2;
                    else if ((c & 0xF8) == 0xF0) i += 3;
                    //else if (($c & 0xFC) == 0xF8) i+=4; // 111110bb //byte 5, unnecessary in 4 byte UTF-8
                    //else if (($c & 0xFE) == 0xFC) i+=5; // 1111110b //byte 6, unnecessary in 4 byte UTF-8
                    else return 0;//invalid utf8
                }
                return q;
            }
            bool utf8str_valid(const char* const str) {
                if (str == NULL)
                    return false;
                const char* c = str;
                bool valid = true;
                for (size_t i = 0; c[0] != 0 && valid;) {
                    valid = (c[0] & 0x80) == 0
                        || ((c[0] & 0xE0) == 0xC0 && (c[1] & 0xC0) == 0x80)
                        || ((c[0] & 0xF0) == 0xE0 && (c[1] & 0xC0) == 0x80 && (c[2] & 0xC0) == 0x80)
                        || ((c[0] & 0xF8) == 0xF0 && (c[1] & 0xC0) == 0x80 && (c[2] & 0xC0) == 0x80 && (c[3] & 0xC0) == 0x80);
                    int v0 = (c[0] & 0x80) >> 7;
                    int v1 = (c[0] & 0x40) >> 6;
                    int v2 = (c[0] & 0x20) >> 5;
                    int v3 = (c[0] & 0x10) >> 4;
                    i += 1 + v0 * v1 + v0 * v1 * v2 + v0 * v1 * v2 * v3;
                    c = str + i;
                }
                return valid;
            }
        public:
            PlayerScriptBattleSystem() : PlayerScript("PlayerScriptBattleSystem") { };

            void OnLogin(Player * player, bool isFirst)
            {
                
                uint32 guid = player->GetGUID().GetCounter();
                QueryResult dataExists = CharacterDatabase.PQuery("SELECT * FROM `characters_custom_info` WHERE `guid`={}", guid);
                if(dataExists)
                {
                    Field* data = dataExists->Fetch();

                    player->chatbox_modifier                 = data[3].GetFloat();
                    player->stat_pve_free                    = data[4].GetUInt32();
                    player->stat_pvp_free                    = data[5].GetUInt32();
                    player->stat_pvp_damage                  = data[6].GetUInt32();
                    player->stat_pvp_armor                   = data[7].GetUInt32();
                    player->stat_pvp_critical                = data[8].GetUInt32();
                    player->stat_pvp_heal                    = data[9].GetUInt32();
                    player->stat_pve_attack_melee            = data[10].GetUInt32();
                    player->stat_pve_attack_ranged           = data[11].GetUInt32();
                    player->stat_pve_attack_magic            = data[12].GetUInt32();
                    player->stat_pve_defense_melee           = data[13].GetUInt32();
                    player->stat_pve_defense_ranged          = data[14].GetUInt32();
                    player->stat_pve_defense_magic           = data[15].GetUInt32();
                    player->stat_pve_heal                    = data[16].GetUInt32();

                    player->SetObjectScale(data[1].GetFloat());
                }
                else
                {
                    CharacterDatabase.PExecute("INSERT INTO `characters_custom_info` (`guid`) VALUES({})", guid);
                }
                
                

                if (isFirst)
                {
                    for (auto pspell = CREATE_SPELL_LEARN.begin(); pspell != CREATE_SPELL_LEARN.end(); ++pspell)
                    {
                        if (pspell->second == 0)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_WARRIOR && pspell->second == 1)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_PALADIN && pspell->second == 2)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_HUNTER && pspell->second == 3)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_ROGUE && pspell->second == 4)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_PRIEST && pspell->second == 5)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_DEATH_KNIGHT && pspell->second == 6)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_SHAMAN && pspell->second == 7)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_MAGE && pspell->second == 8)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_WARLOCK && pspell->second == 9)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_MONK && pspell->second == 10)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_DRUID && pspell->second == 11)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_DEMON_HUNTER && pspell->second == 12)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_EVOKER && pspell->second == 13)
                            player->LearnSpell(pspell->first, false);
                        if (player->GetClass() == CLASS_ADVENTURER && pspell->second == 14)
                            player->LearnSpell(pspell->first, false);
                        
                    }
                }
            }
            void OnCreate(Player * player)
            {
                uint32 guid = player->GetGUID().GetCounter();
                CharacterDatabase.PExecute("INSERT INTO `characters_custom_info` (`guid`) VALUES({})", guid);
            }
            void OnDelete(ObjectGuid guid, uint32 accountId)
            {
                CharacterDatabase.PExecute("DELETE FROM `characters_custom_info` WHERE `guid`={}", guid.GetCounter());
            }
            void OnChat(Player* player, uint32 type, uint32 lang, std::string& msg)
            {
                if (player->isAFK() || player->isDND())
                {
                    return;
                }

                std::list<Player*> PlayersInRange;
                Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(player, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
                Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(player, PlayersInRange, PlayerListHandler);
                Cell::VisitWorldObjects(player, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY));
                //Cell::VisitWorldObjects(player->GetPositionX(), player->GetPositionY(), player->GetMap(), PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY));
                int pCount = 0;
                for (const auto& pl : PlayersInRange) {
                    pCount++;

                }
                float mLvl = pow(1.01, (player->GetLevel() - 10));

                float zoneScaling = 1.0;
                if(ZONE_XP_SCALING.count(player->GetZoneId()) == 1)
                {
                    zoneScaling = ZONE_XP_SCALING.at(player->GetZoneId());
                }
                int msgLen = utf8str_len(msg);
                uint32 msgStart = 40;
                float msgFinal = 0.1;
                if (msgLen > 50)
                    msgFinal = 0.3;
                if (msgLen > 120)
                    msgFinal = 0.6;
                if (msgLen > 200)
                    msgFinal = 0.8;
                if (msgLen > 254)
                    msgFinal = 1;
                uint32 xp = ceil(msgStart * msgFinal * zoneScaling * pCount * player->chatbox_modifier * mLvl);
                player->GiveXP(xp, nullptr);
            }
            void OnLevelChanged(Player* player, uint8 oldLevel)
            {
                uint8 newLevel = player->GetLevel();
                uint8 diffLevel = player->GetLevel() - oldLevel;
            }
            void OnGiveXP(Player* player, uint32& amount, Unit* victim)
            {

            }

            void OnApplyItemMods(Player* player, Item* item, uint8 slot, bool update) {
                TC_LOG_INFO("server.worldserver", "trigger? :D");
            }
    };
};
class PvP_Spell_Attack : public SpellScript
{
    PrepareSpellScript(PvP_Spell_Attack);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVP_ATTACK, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast()
    {
        Unit* me = GetCaster();
        if(me->IsPlayer())
        {
            Player* pMe = me->ToPlayer();
            Unit* target = pMe->GetSelectedUnit();
            if (target)
            {
                if (target->IsPlayer())
                {
                    
                    Player* pTar = target->ToPlayer();
                    if (pMe->GetGUID().GetCounter() == pTar->GetGUID().GetCounter()) { return SPELL_FAILED_BAD_TARGETS; }
                    // float destionation = pMe->GetD
                    float distance = me->GetDistance(pTar);
                    if (distance > 10.0f)
                    {
                        return SPELL_FAILED_OUT_OF_RANGE;
                    }
                    if(pTar->GetHealth() > 1)
                    {
                        return SPELL_CAST_OK;
                    }
                    if (pTar->HasAura(SPELL_OUT_OF_UNCONSCIOUS) == true)
                    {
                        return SPELL_FAILED_TARGETS_DEAD;
                    }
                    else
                    {
                        return SPELL_FAILED_TARGETS_DEAD;
                    }
                }
                else
                    return SPELL_FAILED_TARGET_NOT_PLAYER;
            }
            else
                return SPELL_FAILED_BAD_TARGETS;
        }
        else
        {
            return SPELL_CAST_OK;
        }
        
    }
    uint32 convu8tou32(uint8 number)
    {
        uint32 result = number;
        return result;
    }
    void OnAfterCast()
    {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* pMe = me->ToPlayer();
            Unit* target = pMe->GetSelectedUnit();
            if(target->IsPlayer())
            {
                Player* plOpponent = target->ToPlayer();
                uint32 himArmor = plOpponent->stat_pvp_armor;
                uint32 myDmg = pMe->stat_pvp_damage;
                uint32 myCrit = pMe->stat_pvp_critical;

                uint32 myDmgCalc = urand(myDmg, 100);
                uint32 himArmorCalc = urand(himArmor, 100);
                uint32 myCritCalc = urand(myCrit, 100);
                uint32 dmg = 0;
                bool isSuccess = false;
                bool isCritical = false;
                bool isParry = false;
                if (myDmgCalc > himArmorCalc)
                {
                    dmg += convu8tou32(pMe->GetLevel());
                    isSuccess = true;
                }
                else if(myDmgCalc < himArmorCalc)
                {
                }
                else if (myDmgCalc == himArmorCalc)
                {
                    isSuccess = false;
                    isParry = true;
                }
                else
                { }
                //TC_LOG_INFO("server.worldserver", "{} attack: {}, crit: {}, dmg: {}, {} himArmor: {}, himArmorCalc: {}", pMe->GetName(), myDmgCalc, myCritCalc, dmg, plOpponent->GetName(), himArmor, himArmorCalc);
                if(isSuccess)
                {
                    uint32 himCritArmorCalc = urand(himArmor, 100);
                    if(myCritCalc > himCritArmorCalc)
                    {
                        dmg += dmg;
                        isCritical = true;
                    }
                    else if(myCritCalc < himCritArmorCalc)
                    {

                    }

                    if (plOpponent->GetHealth() <= dmg)
                    {
                        uint64 health = plOpponent->GetHealth();
                        dmg = health - 1;
                        Aura * aura = pMe->AddAura(SPELL_OUT_OF_UNCONSCIOUS, plOpponent);
                        int32 randTime = irand(300000, 600000);

                        aura->SetDuration(randTime, false);
                    }
                    //const CleanDamage* damagePacket = new CleanDamage(dmg, dmg, BASE_ATTACK, MELEE_HIT_NORMAL);
                    pMe->DealDamage(pMe, plOpponent, dmg, nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, true);
                    pMe->SendAttackStateUpdate(HITINFO_AFFECTS_VICTIM, plOpponent, 0, SPELL_SCHOOL_MASK_NORMAL, dmg, 0, 0, VICTIMSTATE_HIT, 0);
                }
                else
                {
                    if (isParry)
                        pMe->SendAttackStateUpdate(HITINFO_AFFECTS_VICTIM, plOpponent, 0, SPELL_SCHOOL_MASK_NORMAL, dmg, dmg, 0, VICTIMSTATE_PARRY, 0);
                    else
                        pMe->SendAttackStateUpdate(HITINFO_AFFECTS_VICTIM, plOpponent, 0, SPELL_SCHOOL_MASK_NORMAL, dmg, dmg, 0, VICTIMSTATE_DODGE, 0);
                }
                std::list<Player*> PlayersInRange;
                Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(pMe, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
                Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(pMe, PlayersInRange, PlayerListHandler);
                Cell::VisitWorldObjects(pMe, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY));
                for (const auto& pl : PlayersInRange)
                {
                    if (isSuccess)
                    {
                        if(isCritical)
                        {
                            ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_PVP_ATTACK_CRITICAL, pMe->GetName(), plOpponent->GetName(), myDmgCalc, himArmorCalc);
                        }
                        else
                        {
                            ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_PVP_ATTACK, pMe->GetName(), plOpponent->GetName(), myDmgCalc, himArmorCalc);
                        }
                    }
                    else if(isParry)
                    {
                        ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_PVP_PARRY, pMe->GetName(), plOpponent->GetName(), myDmgCalc, himArmorCalc, himArmor);
                    }
                    else
                    {
                        ChatHandler(pl->GetSession()).PSendSysMessage(LANG_RPS_PVP_MISS, pMe->GetName(), plOpponent->GetName(), myDmgCalc, himArmorCalc, himArmor);
                    }
                }
            }
            else
            { }
        }
    }
    void OnBeforeCast()
    {

    }
    void Register() override
    {
        //BeforeCast += SpellCastFn(PvP_Spell_Attack::OnBeforeCast);
        OnCheckCast += SpellCheckCastFn(PvP_Spell_Attack::CheckCast);
        AfterCast += SpellCastFn(PvP_Spell_Attack::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvP_Spell_Attack;
    }
};
class PvP_Spell_Heal : public SpellScript
{
    PrepareSpellScript(PvP_Spell_Heal);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVP_HEAL, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast()
    {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* pMe = me->ToPlayer();
            Unit* target = pMe->GetSelectedUnit();
            if (target)
            {
                if (target->IsPlayer())
                {
                    Player* pTar = target->ToPlayer();
                    // float destionation = pMe->GetD
                    float distance = me->GetDistance(pTar);
                    if (distance > 10.0f)
                    {
                        return SPELL_FAILED_OUT_OF_RANGE;
                    }
                    if (pTar->HasAura(SPELL_OUT_OF_UNCONSCIOUS) == true)
                    {
                        return SPELL_FAILED_TARGETS_DEAD;
                    }
                    else
                    {
                        return SPELL_CAST_OK;
                    }
                }
                else
                    return SPELL_FAILED_TARGET_NOT_PLAYER;
            }
            else
            {
                if (pMe->HasAura(SPELL_OUT_OF_UNCONSCIOUS) == true)
                {
                    return SPELL_FAILED_TARGETS_DEAD;
                }
                else
                {
                    return SPELL_CAST_OK;
                }
            }
                //return SPELL_FAILED_BAD_TARGETS;
        }
        else
        {
            return SPELL_CAST_OK;
        }

    }
    uint32 convu8tou32(uint8 number)
    {
        uint32 result = number;
        return result;
    }
    void OnAfterCast()
    {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* pMe = me->ToPlayer();
            Unit* target = pMe->GetSelectedUnit();
            bool mySelf = false;
            if (target)
            {
                if (target->IsPlayer())
                {
                    Player* myClone = target->ToPlayer();
                    if (myClone->GetGUID().GetCounter() == pMe->GetGUID().GetCounter())
                    {
                        mySelf = true;
                    }
                }
            }
            std::list<Player*> PlayersInRange;
            Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(pMe, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
            Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(pMe, PlayersInRange, PlayerListHandler);
            Cell::VisitWorldObjects(pMe, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY));

            if(target && mySelf == false)
            {
                if (target->IsPlayer())
                {
                    Player* pTarget = target->ToPlayer();
                    uint8 targetLevel = pTarget->GetLevel();
                    uint32 myStat = pMe->stat_pvp_heal;
                    uint32 myHealCalc = urand(myStat, 100);
                    uint32 himCalc = targetLevel + 10;
                    uint32 heal = 0;
                    bool isSuccess = false;
                    bool x2 = false;
                    bool x3 = false;
                    if (myHealCalc > himCalc)
                    {
                        isSuccess = true;
                        heal += convu8tou32(pMe->GetLevel());
                        if (myHealCalc > 95 && myHealCalc <= 99)
                        {
                            x2 = true;
                            heal += heal;
                        }
                        if (myHealCalc == 100)
                        {
                            x3 = true;
                            heal += heal * 3;
                        }
                        HealInfo healPacket = HealInfo(pMe, pTarget, heal, nullptr, SPELL_SCHOOL_MASK_NATURE);
                        pMe->DealHeal(healPacket);
                    }
                    for (const auto& pl : PlayersInRange)
                    {
                        if(isSuccess == true)
                        {
                            if (x2 == false && x3 == false)
                            {
                                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_RPS_HEAL, pMe->GetName(), pTarget->GetName(), myStat, myHealCalc, himCalc);
                            }
                            else
                            {
                                if (x2 == true)
                                {
                                    ChatHandler(pl->GetSession()).PSendSysMessage(LANG_RPS_HEAL_DOUBLE, pMe->GetName(), pTarget->GetName(), myStat, myHealCalc, himCalc);
                                }
                                if (x3 == true)
                                {
                                    ChatHandler(pl->GetSession()).PSendSysMessage(LANG_RPS_HEAL_THREE, pMe->GetName(), pTarget->GetName(), myStat, myHealCalc, himCalc);
                                }
                            }
                        }
                        else
                        {
                            ChatHandler(pl->GetSession()).PSendSysMessage(LANG_RPS_HEAL_FAIL, pMe->GetName(), pTarget->GetName(), myStat, myHealCalc, himCalc);
                        }
                    }

                }
                
            }
            else
            {
                uint8 myLevel = pMe->GetLevel();
                uint32 vsCalc = myLevel + 20;
                uint32 myStat = pMe->stat_pvp_heal;
                uint32 myHealCalc = urand(myStat, 100);
                uint32 heal = 0;
                bool isSuccess = false;
                bool x2 = false;
                bool x3 = false;
                if (myHealCalc > vsCalc)
                {
                    isSuccess = true;
                    heal += convu8tou32(pMe->GetLevel());
                    if (myHealCalc > 95 && myHealCalc <= 99)
                    {
                        x2 = true;
                        heal += heal;
                    }
                    if (myHealCalc == 100)
                    {
                        x3 = true;
                        heal += heal * 3;
                    }
                    HealInfo healPacket = HealInfo(pMe, pMe, heal, nullptr, SPELL_SCHOOL_MASK_NATURE);
                    pMe->DealHeal(healPacket);
                }
                for (const auto& pl : PlayersInRange)
                {
                    if (isSuccess == true)
                    {
                        if (x2 == false && x3 == false)
                        {
                            ChatHandler(pl->GetSession()).PSendSysMessage(LANG_RPS_HEAL, pMe->GetName(), pMe->GetName(), myStat, myHealCalc, vsCalc);
                        }
                        else
                        {
                            if (x2 == true)
                            {
                                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_RPS_HEAL_DOUBLE, pMe->GetName(), pMe->GetName(), myStat, myHealCalc, vsCalc);
                            }
                            if (x3 == true)
                            {
                                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_RPS_HEAL_THREE, pMe->GetName(), pMe->GetName(), myStat, myHealCalc, vsCalc);
                            }
                        }
                    }
                    else
                    {
                        ChatHandler(pl->GetSession()).PSendSysMessage(LANG_RPS_HEAL_FAIL, pMe->GetName(), pMe->GetName(), myStat, myHealCalc, vsCalc);
                    }
                }
            }
        }
    }
    void Register() override
    {
        //BeforeCast += SpellCastFn(PvP_Spell_Attack::OnBeforeCast);
        OnCheckCast += SpellCheckCastFn(PvP_Spell_Heal::CheckCast);
        AfterCast += SpellCastFn(PvP_Spell_Heal::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvP_Spell_Heal;
    }
};
class PvP_Spell_Help : public SpellScript {
    PrepareSpellScript(PvP_Spell_Help);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVP_HELP, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast()
    {
        Unit* me = GetCaster();
        if(me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            Unit* target = player->GetSelectedUnit();
            if(target)
            {
                if(target->IsPlayer())
                {
                    if (target->HasAura(SPELL_OUT_OF_UNCONSCIOUS))
                    {
                        return SPELL_CAST_OK;
                    }
                    return SPELL_FAILED_INTERRUPTED;
                }
                return SPELL_FAILED_BAD_TARGETS;
            }
            else
            {
                return SPELL_FAILED_BAD_TARGETS;
            }
        }
        return SPELL_CAST_OK;
    }
    void OnAfterCast()
    {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            Unit* target = player->GetSelectedUnit();
            if (target->IsPlayer())
            {
                if (target->HasAura(SPELL_OUT_OF_UNCONSCIOUS))
                {
                    //Aura* critical = target->AddAura(AURA_CRITICAL_DMG, target);
                    //int32 randTime = irand(300000, 600000);
                    //critical->SetDuration(randTime);
                    target->RemoveAura(SPELL_OUT_OF_UNCONSCIOUS);
                    target->SetHealth(20);
                }
            }
        }
    }
    void Register() override
    {
        //BeforeCast += SpellCastFn(PvP_Spell_Attack::OnBeforeCast);
        OnCheckCast += SpellCheckCastFn(PvP_Spell_Help::CheckCast);
        AfterCast += SpellCastFn(PvP_Spell_Help::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvP_Spell_Help;
    }
};
class PvP_Spell_Robish : public SpellScript {
    PrepareSpellScript(PvP_Spell_Robish);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVP_ROBISH, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast()
    {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            Unit* target = player->GetSelectedUnit();
            if (target)
            {
                if (target->IsPlayer())
                {
                    if (target->HasAura(SPELL_OUT_OF_UNCONSCIOUS))
                    {
                        return SPELL_CAST_OK;
                    }
                    return SPELL_FAILED_INTERRUPTED;
                }
                return SPELL_FAILED_BAD_TARGETS;
            }
            else
            {
                return SPELL_FAILED_BAD_TARGETS;
            }
        }
        return SPELL_CAST_OK;
    }
    void OnAfterCast()
    {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
        }
    }
    void Register() override
    {
        //BeforeCast += SpellCastFn(PvP_Spell_Attack::OnBeforeCast);
        OnCheckCast += SpellCheckCastFn(PvP_Spell_Robish::CheckCast);
        AfterCast += SpellCastFn(PvP_Spell_Robish::OnAfterCast);
    }
    SpellScript* GetSpellScript() const {
        return new PvP_Spell_Robish;
    }
};
class PvP_Spell_Kill : public SpellScript {
    PrepareSpellScript(PvP_Spell_Kill);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVP_KILL, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast()
    {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            Unit* target = player->GetSelectedUnit();
            if (target)
            {
                if (target->IsPlayer())
                {
                    if (target->HasAura(SPELL_OUT_OF_UNCONSCIOUS))
                    {
                        return SPELL_CAST_OK;
                    }
                    return SPELL_FAILED_INTERRUPTED;
                }
                return SPELL_FAILED_BAD_TARGETS;
            }
            else
            {
                return SPELL_FAILED_BAD_TARGETS;
            }
        }
        return SPELL_CAST_OK;
    }
    void OnAfterCast()
    {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            Unit* target = player->GetSelectedUnit();
            if (target->IsPlayer())
            {
                if (target->HasAura(SPELL_OUT_OF_UNCONSCIOUS))
                {
                    player->Kill(player, target);
                }
            }
        }
    }
    void Register() override
    {
        //BeforeCast += SpellCastFn(PvP_Spell_Attack::OnBeforeCast);
        OnCheckCast += SpellCheckCastFn(PvP_Spell_Kill::CheckCast);
        AfterCast += SpellCastFn(PvP_Spell_Kill::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvP_Spell_Kill;
    }
};

class PvE_Spell_Atack_Melee : public SpellScript {
    PrepareSpellScript(PvE_Spell_Atack_Melee);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVE_ATTACK_MELEE, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast() {}
    void OnBeforeCast() {}
    void OnAfterCast() {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            uint32 myStat = player->stat_pve_attack_melee;
            uint32 myStatCalc = urand(myStat, 100);
            std::list<Player*> PlayersInRange;
            Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(player, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
            Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(player, PlayersInRange, PlayerListHandler);
            Cell::VisitWorldObjects(player, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_YELL));

            for (const auto& pl : PlayersInRange)
            {
                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_ATTACK_MELEE_ROLL, player->GetName(), myStat, myStatCalc);
            }
        }
    }
    void Register()
    {
        AfterCast += SpellCastFn(PvE_Spell_Atack_Melee::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvE_Spell_Atack_Melee;
    }
};
class PvE_Spell_Atack_Ranged : public SpellScript {
    PrepareSpellScript(PvE_Spell_Atack_Ranged);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVE_ATTACK_RANGED, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast() {
        return SPELL_CAST_OK;
    }
    void OnBeforeCast() {}
    void OnAfterCast() {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            uint32 myStat = player->stat_pve_attack_ranged;
            uint32 myStatCalc = urand(myStat, 100);
            std::list<Player*> PlayersInRange;
            Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(player, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
            Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(player, PlayersInRange, PlayerListHandler);
            Cell::VisitWorldObjects(player, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_YELL));

            for (const auto& pl : PlayersInRange)
            {
                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_ATTACK_RANGED_ROLL, player->GetName(), myStat, myStatCalc);
            }
        }
    }
    void Register()
    {
        AfterCast += SpellCastFn(PvE_Spell_Atack_Ranged::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvE_Spell_Atack_Ranged;
    }
};
class PvE_Spell_Atack_Magic : public SpellScript {
    PrepareSpellScript(PvE_Spell_Atack_Magic);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVE_ATTACK_MAGIC, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast() {
        return SPELL_CAST_OK;
    }
    void OnBeforeCast() {}
    void OnAfterCast() {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            uint32 myStat = player->stat_pve_attack_magic;
            uint32 myStatCalc = urand(myStat, 100);
            std::list<Player*> PlayersInRange;
            Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(player, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
            Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(player, PlayersInRange, PlayerListHandler);
            Cell::VisitWorldObjects(player, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_YELL));

            for (const auto& pl : PlayersInRange)
            {
                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_ATTACK_MAGIC_ROLL, player->GetName(), myStat, myStatCalc);
            }
        }
    }
    void Register()
    {
        AfterCast += SpellCastFn(PvE_Spell_Atack_Magic::OnAfterCast);
    }
    SpellScript* GetSpellScript() const {
        return new PvE_Spell_Atack_Magic;
    }
};
class PvE_Spell_Defense_Melee : public SpellScript {
    PrepareSpellScript(PvE_Spell_Defense_Melee);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVE_DEFENSE_MELEE, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast() {
        return SPELL_CAST_OK;
    }
    void OnBeforeCast() {}
    void OnAfterCast() {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            uint32 myStat = player->stat_pve_defense_melee;
            uint32 myStatCalc = urand(myStat, 100);
            std::list<Player*> PlayersInRange;
            Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(player, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
            Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(player, PlayersInRange, PlayerListHandler);
            Cell::VisitWorldObjects(player, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_YELL));

            for (const auto& pl : PlayersInRange)
            {
                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_ATTACK_DEFENSE_MELEE_ROLL, player->GetName(), myStat, myStatCalc);
            }
        }
    }
    void Register()
    {
        AfterCast += SpellCastFn(PvE_Spell_Defense_Melee::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvE_Spell_Defense_Melee;
    }
};
class PvE_Spell_Defense_Ranged : public SpellScript {
    PrepareSpellScript(PvE_Spell_Defense_Ranged);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVE_DEFENSE_RANGED, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast() {
        return SPELL_CAST_OK;
    }
    void OnBeforeCast() {}
    void OnAfterCast() {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            uint32 myStat = player->stat_pve_defense_ranged;
            uint32 myStatCalc = urand(myStat, 100);
            std::list<Player*> PlayersInRange;
            Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(player, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
            Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(player, PlayersInRange, PlayerListHandler);
            Cell::VisitWorldObjects(player, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_YELL));

            for (const auto& pl : PlayersInRange)
            {
                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_ATTACK_DEFENSE_RANGED_ROLL, player->GetName(), myStat, myStatCalc);
            }
        }
    }
    void Register()
    {
        AfterCast += SpellCastFn(PvE_Spell_Defense_Ranged::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvE_Spell_Defense_Ranged;
    }
};
class PvE_Spell_Defense_Magic : public SpellScript {
    PrepareSpellScript(PvE_Spell_Defense_Magic);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVE_DEFENSE_MAGIC, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast() {
        return SPELL_CAST_OK;
    }
    void OnBeforeCast() {}
    void OnAfterCast() {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            uint32 myStat = player->stat_pve_defense_magic;
            uint32 myStatCalc = urand(myStat, 100);
            std::list<Player*> PlayersInRange;
            Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(player, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
            Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(player, PlayersInRange, PlayerListHandler);
            Cell::VisitWorldObjects(player, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_YELL));

            for (const auto& pl : PlayersInRange)
            {
                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_ATTACK_DEFENSE_MAGIC_ROLL, player->GetName(), myStat, myStatCalc);
            }
        }
    }
    void Register()
    {
        AfterCast += SpellCastFn(PvE_Spell_Defense_Magic::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvE_Spell_Defense_Magic;
    }
};
class PvE_Spell_Heal : public SpellScript {
    PrepareSpellScript(PvE_Spell_Heal);
    bool Validate(SpellInfo const* /* spellinfo */) override
    {
        return sSpellMgr->GetSpellInfo(SPELL_PVE_HEAL, DIFFICULTY_NONE);
    }
    SpellCastResult CheckCast() {
        return SPELL_CAST_OK;
    }
    void OnBeforeCast() {}
    void OnAfterCast() {
        Unit* me = GetCaster();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            uint32 myStat = player->stat_pve_heal;
            uint32 myStatCalc = urand(myStat, 100);
            std::list<Player*> PlayersInRange;
            Trinity::AnyPlayerInObjectRangeCheck                                PlayerListHandler(player, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), true);
            Trinity::PlayerListSearcher<Trinity::AnyPlayerInObjectRangeCheck>   PlayerRangeSearcher(player, PlayersInRange, PlayerListHandler);
            Cell::VisitWorldObjects(player, PlayerRangeSearcher, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_YELL));

            for (const auto& pl : PlayersInRange)
            {
                ChatHandler(pl->GetSession()).PSendSysMessage(LANG_MSG_HEAL_ROLL, player->GetName(), myStat, myStatCalc);
            }
        }
    }
    void Register()
    {
        AfterCast += SpellCastFn(PvE_Spell_Heal::OnAfterCast);
    }
    SpellScript* GetSpellScript() const
    {
        return new PvE_Spell_Heal;
    }
};
class BS_Aura_Critical : public AuraScript
{
    PrepareAuraScript(BS_Aura_Critical);

    bool Validate(SpellInfo const* /**/) override
    {
        return ValidateSpellInfo({ AURA_CRITICAL_DMG });
    }

    void AuraRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        Unit* me = GetTarget();
        if (me->IsPlayer())
        {
            Player* player = me->ToPlayer();
            WorldSession* session = player->GetSession();
            ChatHandler(session).PSendSysMessage("Critical ended!");
        }
    }

    void Register() override
    {
        AfterEffectRemove += AuraEffectRemoveFn(BS_Aura_Critical::AuraRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
    }
};
void GlobalSystemBattleSystemLoad() {
    RegisterSpellScript(PvP_Spell_Attack);
    RegisterSpellScript(PvP_Spell_Heal);
    RegisterSpellScript(PvP_Spell_Help);
    RegisterSpellScript(PvP_Spell_Robish);
    RegisterSpellScript(PvP_Spell_Kill);
    RegisterSpellScript(PvE_Spell_Atack_Melee);
    RegisterSpellScript(PvE_Spell_Atack_Ranged);
    RegisterSpellScript(PvE_Spell_Atack_Magic);
    RegisterSpellScript(PvE_Spell_Defense_Melee);
    RegisterSpellScript(PvE_Spell_Defense_Ranged);
    RegisterSpellScript(PvE_Spell_Defense_Magic);
    RegisterSpellScript(PvE_Spell_Heal);

    PrepareSpellScript(BS_Aura_Critical);

    new GlobalSystemBattleSystem::WorldScriptBattleSystem();
    new GlobalSystemBattleSystem::CommandScriptBattleSystem();
    new GlobalSystemBattleSystem::PlayerScriptBattleSystem();
 }
