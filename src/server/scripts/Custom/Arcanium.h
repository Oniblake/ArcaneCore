// Includes

#include "Define.h"
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <boost/algorithm/string.hpp>

#include "SpellAuras.h"
#include "AccountMgr.h"
#include "CollectionMgr.h"
#include "GameEventMgr.h"
#include "LanguageMgr.h"
#include "ScriptMgr.h"
#include "SpellMgr.h"
#include "ObjectMgr.h"
#include "GuildMgr.h"

#include "Player.h"
#include "Unit.h"
#include "Creature.h"
#include "GameObject.h"
#include "Item.h"
#include "ItemBonusMgr.h"
#include "Guild.h"

#include "ItemTemplate.h"

#include "ItemDefines.h"
#include "World.h"
#include "WorldSession.h"

#include "DatabaseEnv.h"
#include "Field.h"
#include "Transaction.h"
#include "QueryResult.h"

#include "Chat.h"
#include "ChatCommand.h"

#include "RBAC.h"
#include "Language.h"

#include "ChatPackets.h"
#include "WorldPacket.h"
#include "MiscPackets.h"

#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "GossipDef.h"

#include "Map.h"
#include "Transport.h"

#include "SpellInfo.h"
#include "SpellMgr.h"

#include "FollowMovementGenerator.h"
#include "CellImpl.h"

// Usings

using namespace Trinity;
using namespace Trinity::ChatCommands;
using namespace std;

// Constants

static const uint8 PLAYER_CAN_REACH_LEVEL = 60;
static const uint32 STAT_PVE_FREE_MAX     = 540;
static const uint32 STAT_PVP_FREE_MAX     = 480;
static const uint32 STAT_MAX              = 80;
static const uint32 STAT_PVP_PER_LEVEL    = 2;
static const uint32 STAT_PVE_PER_LEVEL    = 2;
// Spell

static const uint32 SPELL_PVP_ATTACK         = 1000003;
static const uint32 SPELL_OUT_OF_UNCONSCIOUS = 1000013;
static const uint32 SPELL_PVP_HEAL           = 1000014;
static const uint32 SPELL_PVP_HELP           = 1000015;
static const uint32 SPELL_PVP_ROBISH         = 1000016;
static const uint32 SPELL_PVP_KILL           = 1000017;

static const uint32 SPELL_PVE_ATTACK_MELEE   = 1000009;
static const uint32 SPELL_PVE_ATTACK_RANGED  = 1000007;
static const uint32 SPELL_PVE_ATTACK_MAGIC   = 1000005;
static const uint32 SPELL_PVE_DEFENSE_MELEE  = 1000010;
static const uint32 SPELL_PVE_DEFENSE_RANGED = 1000008;
static const uint32 SPELL_PVE_DEFENSE_MAGIC  = 1000006;
static const uint32 SPELL_PVE_HEAL           = 1000011;

static const uint32 AURA_CRITICAL_DMG        = 1000020;

static const uint32 AURA_SAY         = 149488;
static const uint32 AURA_EMOTE       = 142677;
static const uint32 AURA_FREE_BARBER = 243549;
static const char* ADDON_PREFIX_SERVER = "ARCANIUM.SERVER";

// Implementation
static void addonAnnouncePlayer(Player* player, string const& msg) {
    string message(msg);

    WorldPackets::Chat::Chat MessagePacket;
    MessagePacket.Initialize(CHAT_MSG_WHISPER, LANG_ADDON, player, player, message, 0, "", DEFAULT_LOCALE, ADDON_PREFIX_SERVER);
    player->SendDirectMessage(MessagePacket.Write());
}
static void addonAnnouncePlayer(Player* player, string const& msg, const char* prefix) {
    string message(msg);

    WorldPackets::Chat::Chat MessagePacket;
    MessagePacket.Initialize(CHAT_MSG_WHISPER, LANG_ADDON, player, player, message, 0, "", DEFAULT_LOCALE, prefix);
    player->SendDirectMessage(MessagePacket.Write());
}
