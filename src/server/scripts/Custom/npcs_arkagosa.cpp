#include "Arcanium.h"

namespace NPCScriptArkagosa
{
    class CreatureScriptArkagosa : public CreatureScript
    {
        public:
            CreatureScriptArkagosa() : CreatureScript("CreatureScriptArkagosa") {}

            class CreatureScriptArkagosaAI : public ScriptedAI
            {
            public:
                CreatureScriptArkagosaAI(Creature* creature) : ScriptedAI(creature) {}

                bool OnGossipHello(Player * player)
                {
                    generatePage(player, 0);
                    return true;
                }

                bool OnGossipSelect(Player* player, uint32, uint32 listID)
                {
                    uint32 const sender = player->PlayerTalkClass->GetGossipOptionSender(listID);
                    uint32 const action = player->PlayerTalkClass->GetGossipOptionAction(listID);

                    switch (sender)
                    {
                    case 0:
                        CloseGossipMenuFor(player);
                        break;
                    case 1:
                        generatePage(player, action);
                        break;
                    case 2:
                        generatePage(player, action);
                        break;
                    case 3:
                        generatePage(player, action);
                        break;
                    case 4:
                        QueryResult itemData = WorldDatabase.PQuery("SELECT `x`, `y`, `z`, `o`, `m` FROM `creature_arkagosa` WHERE `id`={}", action);
                        if(itemData)
                        {
                            Field* coord = itemData->Fetch();
                            float mX = coord[0].GetFloat();
                            float mY = coord[1].GetFloat();
                            float mZ = coord[2].GetFloat();
                            float mO = coord[3].GetFloat();
                            uint32 mId = coord[4].GetFloat();

                            player->TeleportTo(mId, mX, mY, mZ, mO);

                            CloseGossipMenuFor(player);
                        }
                        break;
                    }

                    return true;
                }
            private:
                void generatePage(Player* player, int start) {
                    //CloseGossipMenuFor(player);
                    ClearGossipMenuFor(player);

                    int preventCrash = 0;

                    if (start == 0)
                    {
                        QueryResult teleportList = WorldDatabase.PQuery("SELECT `id`, `name` FROM `creature_arkagosa` LIMIT 0, 15");
                       
                        if (teleportList)
                        {
                            do
                            {
                                
                                Field* itemData = teleportList->Fetch();
                                uint32 id = itemData[0].GetUInt32();
                                string name = itemData[1].GetString();

                                AddGossipItemFor(player, GossipOptionNpc::None, name, 4, id);

                                preventCrash++;
                            } while (teleportList->NextRow());
                            if (preventCrash == 15)
                                AddGossipItemFor(player, GossipOptionNpc::None, "==>", 1, preventCrash);
                        }
                        else
                        {
                            ChatHandler(player->GetSession()).PSendSysMessage("[Arkagosa System]: Not have data!");
                        }
                    }
                    else
                    {
                        int end = start + 15;
                        int prev = start - 15;

                        QueryResult teleportList = WorldDatabase.PQuery("SELECT `id`, `name` FROM `creature_arkagosa` LIMIT {}, 15", start);
                        if (teleportList)
                        {
                            do
                            {
                                Field* itemData = teleportList->Fetch();
                                uint32 id = itemData[0].GetUInt32();
                                string name = itemData[1].GetString();

                                AddGossipItemFor(player, GossipOptionNpc::None, name, 4, id);

                                preventCrash++;
                            } while (teleportList->NextRow());
                        }
                        if (preventCrash == 15)
                            AddGossipItemFor(player, GossipOptionNpc::None, "==>", 1, end);

                        AddGossipItemFor(player, GossipOptionNpc::None, "<==", 2, prev);
                        AddGossipItemFor(player, GossipOptionNpc::None, "Home", 3, 0);
                    }
                    SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, me->GetGUID());
                }
            };

            CreatureAI* GetAI(Creature* creature) const override
            {
                return new CreatureScriptArkagosaAI(creature);
            };
    };
    class CommandScriptArkagosa : public CommandScript
    {
        public:
            CommandScriptArkagosa() : CommandScript("CommandScriptArkagosa") { };

            ChatCommandTable GetCommands() const override
            {
                static ChatCommandTable subList =
                {
                    { "info",     HandleArkagosaInfoCommand,       LANG_COMMAND_ARKAGOSA_INFO_HELP,         rbac::COMMAND_ARKAGOSA_INFO,         Console::No },
                    { "rename",   HandleArkagosaRenameCommand,     LANG_COMMAND_ARKAGOSA_RENAME_HELP,       rbac::COMMAND_ARKAGOSA_RENAME,       Console::No },
                    { "replace",  HandleArkagosaReplaceCommand,    LANG_COMMAND_ARKAGOSA_REPLACE_HELP,      rbac::COMMAND_ARKAGOSA_REPLACE,      Console::No },
                    { "remove",   HandleArkagosaRemoveCommand,     LANG_COMMAND_ARKAGOSA_REMOVE_HELP,       rbac::COMMAND_ARKAGOSA_REMOVE,       Console::No },
                    { "edit",     HandleArkagosaEditCommand,       LANG_COMMAND_ARKAGOSA_EDIT_HELP,         rbac::COMMAND_ARKAGOSA_EDIT,         Console::No },
                    { "add",      HandleArkagosaAddCommand,        LANG_COMMAND_ARKAGOSA_ADD_HELP,          rbac::COMMAND_ARKAGOSA_ADD,          Console::No },
                    { "",         HandleArkagosaCommand,           LANG_COMMAND_ARKAGOSA_HELP,              rbac::COMMAND_ARKAGOSA,              Console::No },
                };
                static ChatCommandTable mainList =
                {
                    { "arkagosa", subList }
                };
                return mainList;
            };

            static bool HandleArkagosaCommand(ChatHandler* ch, Optional<uint32> pageNum)
            {
                if (pageNum >= 0) {
                    uint32 StartNum = 0;
                    uint32 EndNum = 15;
                    uint32 Count = 15;
                    if (pageNum > 1) {
                        EndNum = Count * pageNum.value();
                        StartNum = EndNum - Count;
                    }
                    QueryResult List = WorldDatabase.PQuery("SELECT `id`, `name` FROM `creature_arkagosa` LIMIT {}, {}", StartNum, EndNum);
                    if (List) {
                        ch->PSendSysMessage("[Arkagosa System]: =============================");
                        do {
                            Field* Data = List->Fetch();

                            uint32 ID = Data[0].GetUInt32();
                            string Name = Data[1].GetString();

                            ch->PSendSysMessage("[Arkagosa System]: %u - %s", ID, Name);
                        } while (List->NextRow());
                        ch->PSendSysMessage("[Arkagosa System]: =============================");
                        return true;
                    }
                    else {
                        ch->PSendSysMessage("[Arkagosa System]: Page is empty!");

                        return true;
                    }
                }
                return false;
            }
            static bool HandleArkagosaAddCommand(ChatHandler* ch, QuotedString name)
            {
                if(name.empty())
                    return false;

                Player* me = ch->GetPlayer();

                float plx = me->GetPositionX();
                float ply = me->GetPositionY();
                float plz = me->GetPositionZ();
                float plo = me->GetOrientation();
                uint32 plm = me->GetMapId();

                WorldDatabase.PExecute("INSERT INTO `creature_arkagosa` (`name`, `x`, `y`, `z`, `o`, `m`) VALUES(\"{}\", {}, {}, {}, {}, {})", name, plx, ply, plz, plo, plm);
                ch->PSendSysMessage(LANG_ARKAGOSA_MSG_ADD);
                return true;
            }
            static bool HandleArkagosaReplaceCommand(ChatHandler* ch, uint32 oldID, uint32 newID)
            {
                if (!oldID || !newID)
                    return false;

                if(isExists(newID)) {
                    QueryResult newOldItem = WorldDatabase.PQuery("SELECT `name`, `x`, `y`, `x`, `o`, `m` FROM `creature_arkagosa` WHERE `id`={}", newID);

                    Field* Data = newOldItem->Fetch();
                    string Name = Data[0].GetString();
                    float x = Data[1].GetFloat();
                    float y = Data[2].GetFloat();
                    float z = Data[3].GetFloat();
                    float o = Data[4].GetFloat();
                    uint32 m = Data[5].GetUInt32();

                    WorldDatabase.PExecute("DELETE FROM `creature_arkagosa` WHERE `id`={}", newID);
                    WorldDatabase.PExecute("UPDATE `creature_arkagosa` SET `id`={} WHERE `id`={}", newID, oldID);
                    WorldDatabase.PExecute("INSERT INTO `creature_arkagosa` (`id`, `name`, `x`, `y`, `z`, `o`, `m`) VALUES({}, \"{}\", {}, {}, {}, {}, {})", oldID, Name, x, y, z, o, m);

                    ch->PSendSysMessage(LANG_ARKAGOSA_MSG_REPLACED, oldID, newID);
                    return true;
                }
                else
                {
                    if(isExists(oldID))
                    {
                        WorldDatabase.PExecute("UPDATE `creature_arkagosa` SET `id`={} WHERE `id`={}", newID, oldID);
                        ch->PSendSysMessage(LANG_ARKAGOSA_MSG_REPLACED, oldID, newID);
                        return true;
                    }
                    else
                    {
                        ch->PSendSysMessage(LANG_ARKAGOSA_MSG_NOT_EXISTS, oldID);
                        ch->SetSentErrorMessage(true);
                        return true;
                    }
                }

                return true;
            }
            static bool HandleArkagosaRemoveCommand(ChatHandler* ch, uint32 id)
            {
                if (id) {
                    if (isExists(id))
                    {
                        WorldDatabase.PExecute("DELETE FROM `creature_arkagosa` WHERE `id`={}", id);
                        ch->PSendSysMessage(LANG_ARKAGOSA_MSG_REMOVED, id);
                        return true;
                    }
                    else
                    {
                        ch->PSendSysMessage(LANG_ARKAGOSA_MSG_NOT_EXISTS, id);
                        ch->SetSentErrorMessage(true);
                        return true;
                    }
                }
                return false;
            }
            static bool HandleArkagosaEditCommand(ChatHandler* ch, uint32 id)
            {
                if (id) {
                    if (isExists(id)) {
                        Player* player = ch->GetPlayer();
                        float x = player->GetPositionX();
                        float y = player->GetPositionY();
                        float z = player->GetPositionZ();
                        float o = player->GetOrientation();
                        uint32 m = player->GetMapId();

                        WorldDatabase.PExecute("UPDATE `creature_arkagosa` SET `x`={}, `y`={}, `z`={}, `o`={}, `m`={} WHERE `id`={}", x, y, z, o, m, id);
                        ch->PSendSysMessage(LANG_ARKAGOSA_MSG_UPDATED, id);
                        return true;
                    }
                    else {
                        ch->PSendSysMessage(LANG_ARKAGOSA_MSG_NOT_EXISTS, id);
                        ch->SetSentErrorMessage(true);
                        return true;
                    }
                }
                return false;
                return true;
            }
            static bool HandleArkagosaRenameCommand(ChatHandler* ch, uint32 id, QuotedString newName)
            {
                if (id && !newName.empty())
                {
                    if (isExists(id)) {
                        WorldDatabase.PExecute("UPDATE `creature_arkagosa` SET `name`=\"{}\" WHERE `id`={}", newName, id);
                        ch->PSendSysMessage(LANG_ARKAGOSA_MSG_RENAMED, id, newName);
                        return true;
                    }
                    else {
                        ch->PSendSysMessage(LANG_ARKAGOSA_MSG_NOT_EXISTS, id);
                        ch->SetSentErrorMessage(true);
                        return true;
                    }
                }

                return false;
            }
            static bool HandleArkagosaInfoCommand(ChatHandler* ch)
            {
                return true;
            }
            
        private:
            static bool isExists(uint32 id)
            {
                QueryResult IsExists = WorldDatabase.PQuery("SELECT `id` FROM `creature_arkagosa` WHERE `id`={}", id);
                if (IsExists)
                    return true;
                return false;
            }
    };
};

void NPCScriptArkagosaLoad()
{
    new NPCScriptArkagosa::CreatureScriptArkagosa();
    new NPCScriptArkagosa::CommandScriptArkagosa();
}
