#include "Arcanium.h"

namespace AddonSystemArcanium {
    class AddonSystemCommand : public CommandScript
    {
        public:
            AddonSystemCommand() : CommandScript("AddonSystemCommand") {}

            ChatCommandTable GetCommands() const override
            {
                static ChatCommandTable getSubcommand =
                {
                    // { "",         handleArcaniumGet}
                    { "display",  handleArcaniumGetDisplayCommand,                           rbac::COMMAND_ARCANIUM_GET_DISPLAY, Console::No  },
                    { "stats",    handleArcaniumGetStatsCommand,                             rbac::COMMAND_ARCANIUM_GET_STATS,   Console::No  },
                    { "",         handleArcaniumGetCommand,                                  rbac::COMMAND_ARCANIUM_GET,         Console::Yes },
                };
                static ChatCommandTable subCommand =
                {
                    
                    { "emote",    handleArcaniumEmoteCommand,                                rbac::COMMAND_ARCANIUM_EMOTE,       Console::No  },
                    { "say",      handleArcaniumSayCommand,                                  rbac::COMMAND_ARCANIUM_SAY,         Console::No  },
                    { "get",      getSubcommand                                                                                               },
                    { "",         handleArcaniumCommand,         LANG_COMMAND_ARCANIUM_HELP, rbac::COMMAND_ARCANIUM,             Console::Yes },
                };
                static ChatCommandTable command =
                {
                    { "arcanium", subCommand                                                                                                  },
                };
                return command;
            };
            static bool handleArcaniumCommand(ChatHandler* ch, Optional<string> status)
            {
                if (status->empty())
                {
                    return true;
                }

                Player* player = ch->GetPlayer();

                if (status == "on")
                {
                    WorldSession* session = ch->GetSession();
                    player->isAddonEnabled = true;
                    addonAnnouncePlayer(player, "SMSG:SERVER:SYNCH:ON");
                    if (session->GetSecurity() > SEC_PLAYER)
                    {
                        addonAnnouncePlayer(player, "SMSG:ACCOUNT:GM:ON");
                    }
                }
                else if(status == "off")
                {
                    player->isAddonEnabled = false;
                    addonAnnouncePlayer(player, "SMSG:SERVER:SYNCH:OFF");
                }
                else
                {
                    return true;
                }

                return true;
            }
            static bool handleArcaniumGetCommand(ChatHandler* ch)
            {
                return true;
            }
            static bool handleArcaniumGetStatsCommand(ChatHandler* ch)
            {
                Player* player = ch->GetPlayer();
                if (player->isAddonEnabled == false)
                    return true;

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
            static bool handleArcaniumGetDisplayCommand(ChatHandler* ch)
            {
                
                Player* player = ch->GetPlayer();
                if (player->isAddonEnabled == false)
                    return true;
                for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_END; ++slot) {
                    if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
                    {
                        int64 entry = player->GetFakeEntry(item);
                        uint16 appearance = 0;
                        if(entry == 0) {
                            entry = -1;
                        }
                        else if (entry == 1)
                        {
                        }
                        else
                        {
                            appearance = player->GetFakeAppearance(item);
                        }
                        switch (slot)
                        {
                        case EQUIPMENT_SLOT_HEAD:
                        case EQUIPMENT_SLOT_SHOULDERS:
                        case EQUIPMENT_SLOT_BODY:
                        case EQUIPMENT_SLOT_CHEST:
                        case EQUIPMENT_SLOT_WAIST:
                        case EQUIPMENT_SLOT_LEGS:
                        case EQUIPMENT_SLOT_FEET:
                        case EQUIPMENT_SLOT_WRISTS:
                        case EQUIPMENT_SLOT_HANDS:
                        case EQUIPMENT_SLOT_BACK:
                        case EQUIPMENT_SLOT_MAINHAND:
                        case EQUIPMENT_SLOT_OFFHAND:
                        case EQUIPMENT_SLOT_RANGED:
                        case EQUIPMENT_SLOT_TABARD:
                            addonAnnouncePlayer(player, "SMSG:SERVER:DISPLAY:" + to_string(slot) + ":" + to_string(entry) + ":" + to_string(appearance));
                            break;

                        default:
                            break;
                        }
                        
                    }
                }
                return true;
            }
            static bool handleArcaniumSayCommand(ChatHandler* ch, Optional<string> param) {
                Player* player = ch->GetPlayer();
                // 149488
                if (param == "on")
                {
                    if (!player->HasAura(AURA_SAY))
                        player->AddAura(AURA_SAY, player);
                }
                else if(param == "off")
                {
                    if (player->HasAura(AURA_SAY))
                        player->RemoveAura(AURA_SAY);
                }
                return true;
            }
            static bool handleArcaniumEmoteCommand(ChatHandler* ch, Optional<string> param) {
                Player* player = ch->GetPlayer();
                // 142677
                if (param == "on")
                {
                    if (!player->HasAura(AURA_EMOTE))
                        player->AddAura(AURA_EMOTE, player);
                }
                else if (param == "off")
                {
                    if (player->HasAura(AURA_EMOTE))
                        player->RemoveAura(AURA_EMOTE);
                }
                return true;
            }
    };
    class AddonSystemPlayer : public PlayerScript
    {
        public:
            AddonSystemPlayer() : PlayerScript("AddonSystemPlayer") {};
            
            void OnLogin(Player * player, bool isFirst) {
                addonAnnouncePlayer(player, "SMSG:SERVER:ADDON:CHECK");
            }

            void OnChat(Player* player, uint32 type, uint32 lang, std::string& msg)
            {
                TC_LOG_INFO("server.worldserver", "First function triggered! {}", msg);
            }

            void OnChat(Player* player, uint32 type, uint32 lang, std::string& msg, Player* receiver)
            {
                TC_LOG_INFO("server.worldserver", "Second function triggered!");
            }

            void OnChat(Player* player, uint32 type, uint32 lang, std::string& msg, Group* group)
            {
                TC_LOG_INFO("server.worldserver", "Third function triggered!");
            }

            void OnChat(Player* player, uint32 type, uint32 lang, std::string& msg, Guild* guild)
            {
                TC_LOG_INFO("server.worldserver", "4 function triggered!");
            }

            void OnChat(Player* player, uint32 type, uint32 lang, std::string& msg, Channel* channel)
            {
                TC_LOG_INFO("server.worldserver", "5 function triggered!");
            }
    };
};

void AddonSystemArcaniumLoad()
{
    new AddonSystemArcanium::AddonSystemCommand();
    new AddonSystemArcanium::AddonSystemPlayer();
}
