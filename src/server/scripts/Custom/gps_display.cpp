#include "Arcanium.h"

namespace PlayerScriptDisplay
{
    class Display_Command : public CommandScript
    {
    private:
        static Item* tryToGetItem(Player* _player, uint32 itemid)
        {
            ItemContext IContext[2] =
            {
                ItemContext::NONE,
                ItemContext::PVP_Ranked_1_Unrated
            };

            for (ItemContext context : IContext)
            {
                Item* item = Item::CreateItem(itemid, 1, context, _player, true);
                if (item->GetVisibleModifiedAppearanceId(_player) != 0)
                {
                    return item;
                }
            };
            return NULL;
        }
        static bool checkCrash(Item * target, Item * display)
        {
            const ItemTemplate * targetT = target->GetTemplate();
            const ItemTemplate* displayT = display->GetTemplate();

            InventoryType targetType = targetT->GetInventoryType();
            InventoryType displayType = displayT->GetInventoryType();

            if (targetType == INVTYPE_HEAD)
            {
                if (displayType == INVTYPE_CHEST)
                    return true;
                if (displayType == INVTYPE_HANDS)
                    return true;
                if (displayType == INVTYPE_LEGS)
                    return true;
                if (displayType == INVTYPE_FEET)
                    return true;
            }

            if (targetType == INVTYPE_SHOULDERS)
            {
                if (displayType == INVTYPE_CHEST)
                    return true;
                if (displayType == INVTYPE_HANDS)
                    return true;
                if (displayType == INVTYPE_LEGS)
                    return true;
                if (displayType == INVTYPE_FEET)
                    return true;
                if (displayType == INVTYPE_WEAPONMAINHAND)
                    return true;
                if (displayType == INVTYPE_WEAPONOFFHAND)
                    return true;
                if (displayType == INVTYPE_2HWEAPON)
                    return true;
                if (displayType == INVTYPE_WEAPON)
                    return true;
            }


            if (targetType == INVTYPE_HANDS)
            {
                if (displayType == INVTYPE_HEAD)
                    return true;
                if (displayType == INVTYPE_SHOULDERS)
                    return true;
                if (displayType == INVTYPE_WAIST)
                    return true;
                if (displayType == INVTYPE_WEAPONMAINHAND)
                    return true;
                if (displayType == INVTYPE_WEAPONOFFHAND)
                    return true;
                if (displayType == INVTYPE_2HWEAPON)
                    return true;
                if (displayType == INVTYPE_WEAPON)
                    return true;
            }
            if (targetType == INVTYPE_LEGS)
            {
                if (displayType == INVTYPE_HEAD)
                    return true;
                if (displayType == INVTYPE_SHOULDERS)
                    return true;
                if (displayType == INVTYPE_WAIST)
                    return true;
                if (displayType == INVTYPE_WEAPONMAINHAND)
                    return true;
                if (displayType == INVTYPE_WEAPONOFFHAND)
                    return true;
                if (displayType == INVTYPE_2HWEAPON)
                    return true;
                if (displayType == INVTYPE_WEAPON)
                    return true;
            }

            if (targetType == INVTYPE_FEET)
            {
                if (displayType == INVTYPE_HEAD)
                    return true;
                if (displayType == INVTYPE_SHOULDERS)
                    return true;
                if (displayType == INVTYPE_WAIST)
                    return true;
                if (displayType == INVTYPE_WEAPONMAINHAND)
                    return true;
                if (displayType == INVTYPE_WEAPONOFFHAND)
                    return true;
                if (displayType == INVTYPE_2HWEAPON)
                    return true;
                if (displayType == INVTYPE_WEAPON)
                    return true;
            }

            return false;
        }
        static bool ApplyVisual(ChatHandler* ch, uint8 slot, char const* args)
        {
            uint32 itemId = 0;

            if (args[0] == '[')                                        // [name] manual form
            {
                char const* itemNameStr = strtok((char*)args, "]");

                if (itemNameStr && itemNameStr[0])
                {
                    std::string itemName = itemNameStr + 1;
                    auto itr = std::find_if(sItemSparseStore.begin(), sItemSparseStore.end(), [&itemName](ItemSparseEntry const* sparse)
                        {
                            for (LocaleConstant i = LOCALE_enUS; i < TOTAL_LOCALES; i = LocaleConstant(i + 1))
                                if (itemName == sparse->Display[i])
                                    return true;
                            return false;
                        });

                    if (itr == sItemSparseStore.end())
                    {
                        ch->PSendSysMessage(LANG_COMMAND_COULDNOTFIND, itemNameStr + 1);
                        ch->SetSentErrorMessage(true);
                        return false;
                    }

                    itemId = itr->ID;
                }
                else
                    return false;
            }
            else                                                    // item_id or [name] Shift-click form |color|Hitem:item_id:0:0:0|h[name]|h|r
            {
                char const* id = ch->extractKeyFromLink((char*)args, "Hitem");
                if (!id)
                    return false;

                itemId = Trinity::StringTo<uint32>(id).value_or(0);
            }

            char const* bonuses = strtok(nullptr, " ");
            uint32 bonus = 0;
            if(bonuses)
                bonus = Trinity::StringTo<uint32>(bonuses).value_or(0);

            Player* _player = ch->GetPlayer();
            Item* _tItem = _player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);

            if (_tItem)
            {
                //if(item == "0" || to_integer(item) == )
                
                if (sObjectMgr->GetItemTemplate(itemId))
                {
                    
                    Item* _rItem = tryToGetItem(_player, itemId);
                    if (checkCrash(_tItem, _rItem))
                    {
                        ch->PSendSysMessage("|cffFF0000[Expandable Display System]: Such a combination is prohibited in order to prevent client crash.|r");
                        return true;
                    }
                    if(bonus > 0 || bonus)
                        _rItem->AddBonuses(bonus);
                    //_tItem->SetModifier(ITEM_MODIFIER_TRANSMOG_APPEARANCE_ALL_SPECS, _rItem->GetVisibleModifiedAppearanceId(_player));
                    //ch->PSendSysMessage("%u", _rItem->GetVisibleModifiedAppearanceId(_player));
                    _player->SetVisibleItemSlot(slot, _rItem);
                }
                else if (itemId == 1)
                {
                    //_tItem->SetModifier(ITEM_MODIFIER_TRANSMOG_APPEARANCE_ALL_SPECS, _tItem->GetVisibleModifiedAppearanceId(_player));
                    //ch->PSendSysMessage("%u", _tItem->GetVisibleModifiedAppearanceId(_player));
                    _player->SetVisibleItemSlot(slot, _tItem);
                }
                else
                {
                    _player->SetVisibleItemSlot(slot, 0);
                }
                _tItem->SetState(ITEM_CHANGED, _player);
                _tItem->SendUpdateToPlayer(_player);
                return true;
            }
            else
            {
                ch->PSendSysMessage("[Expandable Display System]: Equipment slot is empty!");
                return true;
            }
            return true;
        }
    public:
        Display_Command() : CommandScript("Display_Command") {}

        ChatCommandTable GetCommands() const override {
            static ChatCommandTable displayCommandtable = {
                { "head",      HandleDisplayHead,       rbac::COMMAND_DISPLAY_HEAD,        Console::No },
                { "shoulders", HandleDisplaySoulder,    rbac::COMMAND_DISPLAY_SHOULDERS,   Console::No },
                { "shirt",     HandleDisplayShirt,      rbac::COMMAND_DISPLAY_SHIRT,       Console::No },
                { "chest",     HandleDisplayChest,      rbac::COMMAND_DISPLAY_CHEST,       Console::No },
                { "waist",     HandleDisplayWaist,      rbac::COMMAND_DISPLAY_WAIST,       Console::No },
                { "legs",      HandleDisplayLegs,       rbac::COMMAND_DISPLAY_LEGS,        Console::No },
                { "feet",      HandleDisplayFeet,       rbac::COMMAND_DISPLAY_FEET,        Console::No },
                { "wrists",    HandleDisplayWrists,     rbac::COMMAND_DISPLAY_WRISTS,      Console::No },
                { "hands",     HandleDisplayHands,      rbac::COMMAND_DISPLAY_HANDS,       Console::No },
                { "back",      HandleDisplayBack,       rbac::COMMAND_DISPLAY_BACK,        Console::No },
                { "tabard",    HandleDisplayTabard,     rbac::COMMAND_DISPLAY_TABARD,      Console::No },
                { "mainhand",  HandleDisplayMainhand,   rbac::COMMAND_DISPLAY_MAINHAND,    Console::No },
                { "offhand",   HandleDisplayOffhand,    rbac::COMMAND_DISPLAY_OFFHAND,     Console::No },
                { "list",      HandleDisplayList,       rbac::COMMAND_DISPLAY_LIST,        Console::No },
                { "",          HandleDisplay,           rbac::COMMAND_DISPLAY,             Console::No },
            };
            static ChatCommandTable commandTable = {
                { "display", displayCommandtable },
            };
            return commandTable;
        };

        static bool HandleDisplayHead(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_HEAD, args);
        }
        static bool HandleDisplaySoulder(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_SHOULDERS, args);
        }
        static bool HandleDisplayShirt(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_BODY, args);
        }
        static bool HandleDisplayChest(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_CHEST, args);
        }
        static bool HandleDisplayWaist(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_WAIST, args);
        }
        static bool HandleDisplayLegs(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_LEGS, args);
        }
        static bool HandleDisplayFeet(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_FEET, args);
        }
        static bool HandleDisplayWrists(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_WRISTS, args);
        }
        static bool HandleDisplayHands(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_HANDS, args);
        }
        static bool HandleDisplayBack(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_BACK, args);
        }
        static bool HandleDisplayTabard(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_TABARD, args);
        }
        static bool HandleDisplayMainhand(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_MAINHAND, args);
        }
        static bool HandleDisplayOffhand(ChatHandler* ch, char const* args)
        {
            return ApplyVisual(ch, EQUIPMENT_SLOT_OFFHAND, args);
        }
        static bool HandleDisplayList(ChatHandler* ch)
        {
            return true;
        }
        static bool HandleDisplay(ChatHandler* ch)
        {
            return true;
        }
        /*static bool handleDisplayChest(ChatHandler * ch, uint32 itemId, Optional<uint32> bonusListId)
        {
            if (itemId < 0)
            {
                ch->PSendSysMessage("|cffFF0000[Extended Display System]: ItemID cant be 0 or empty!|r");
                return true;
            }

            Player* _player = ch->GetPlayer();
            Item* _tItem = _player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_CHEST);
            if (itemId == 0)
            {
                _player->SetVisibleItemSlot(EQUIPMENT_SLOT_CHEST, 0);
            }
            if (sObjectMgr->GetItemTemplate(itemId))
            {
                Item* _rItem = tryToGetItem(_player, itemId);
                if (bonusListId.has_value())
                {
                    uint32 bonus = bonusListId.value();
                    _rItem->AddBonuses(bonus);
                }

                _tItem->SetModifier(ITEM_MODIFIER_TRANSMOG_APPEARANCE_ALL_SPECS, _rItem->GetVisibleModifiedAppearanceId(_player));
                //_tItem->SetModifier(ITEM_MODIFIER_TRANSMOG_APPEARANCE_ALL_SPECS, 0);
                _tItem->SetState(ITEM_CHANGED, _player);
                _player->SetVisibleItemSlot(EQUIPMENT_SLOT_CHEST, _rItem);
                _tItem->SendUpdateToPlayer(_player);
            }
            return true;
        }*/

    };
    class Display_World : public WorldScript
    {
    public:
        Display_World() : WorldScript("Display_World") {}

        void OnStartup() override {
            CharacterDatabase.DirectExecute("DELETE FROM custom_character_display WHERE NOT EXISTS (SELECT 1 FROM item_instance WHERE item_instance.guid = custom_character_display.guid)");
        }
    };
    class Display_Player : public PlayerScript
    {
    public:
        Display_Player() : PlayerScript("Display_Player") {}

        void OnLogin(Player* player, bool isFistLogin)
        {
            if (!isFistLogin)
            {
                QueryResult result = CharacterDatabase.PQuery("SELECT `guid`, `display`, `appearance` FROM `custom_character_display` WHERE `owner`={}", player->GetGUID().GetCounter());
                if (result)
                {
                    do
                    {
                        Field* field = result->Fetch();
                        ObjectGuid itemGUID = ObjectGuid::Create<HighGuid::Item>(field[0].GetUInt64());
                        uint64 fakeEntry = field[1].GetUInt64();
                        uint16 fakeAppearance = field[2].GetUInt16();
                        if ((fakeEntry == 1 || sObjectMgr->GetItemTemplate(fakeEntry)) && player->GetItemByGuid(itemGUID))
                        {
                            player->displayMap[itemGUID].entry = fakeEntry;
                            player->displayMap[itemGUID].appearance = fakeAppearance;
                        }
                    } while (result->NextRow());

                    if (!player->displayMap.empty())
                    {
                        for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_END; ++slot)
                        {
                            if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
                            {
                                player->SetVisibleItemSlot(slot, item);
                                if (player->IsInWorld())
                                    item->SendUpdateToPlayer(player);
                            }
                        }
                    }
                }
            }
            ChatHandler(player->GetSession()).PSendSysMessage("[Display System]: Type `.display` for setting up your appereance.");


        }
    };
};

void PlayerScriptDisplayLoad() {
    new PlayerScriptDisplay::Display_Command();
    //new PlayerScriptDisplay::Display_Player();
    new PlayerScriptDisplay::Display_World();
}
