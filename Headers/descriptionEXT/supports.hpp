#include "..\..\Headers\descriptionEXT\supportDefines.hpp"
#include "..\..\Headers\descriptionEXT\GUI\shopGUICommonDefines.hpp"

#define SUPPORT_CURSOR "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"
#define ARTILLERY_ICON "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa"
#define ATTACK_ICON "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"
#define CALL_ICON "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"
#define CAS_ICON "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\cas_ca.paa"
#define CAS_HELI_ICON"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\casheli_ca.paa"
#define DEFEND_ICON "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"
#define INTSRUCTOR_ICON "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa"
#define MORTAR_ICON "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\mortar_ca.paa"
#define SUPPLY_DROP_ICON "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa"
#define TRANSPORT_ICON "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa"

/*
    This master function for supports is used as go between for error cases such as when 
     a player provides an invalid position (looking at the sky). It will then refund the
     support back to the player.
*/
#define CALL_SUPPORT_MASTER(CLASS) "[_this select 0,_this select 1,"#CLASS"] call BLWK_fnc_callingForSupportMaster"

/*
// expression arguments

[caller, pos, target, is3D, id]
    caller: Object - unit which called the item, usually player
    pos: Array in format Position - cursor position
    target: Object - cursor target
    is3D: Boolean - true when in 3D scene, false when in map
    id: String - item ID as returned by BIS_fnc_addCommMenuItem function
*/

class basicSupport
{
	price = 1000; // price in shop
	category = OTHER_CATEGORY; // shop category

    text = "I'm a support!"; // text in support menu and Shop (DO NOT INCLUDE PRICE HERE, IT IS ADDED IN BLWK_fnc_populateSupportTree)
    subMenu = "";
    expression = ""; // code to compile upon call of menu item
    icon = CALL_ICON; // icon in support menu
    curosr = SUPPORT_CURSOR;
    enable = "1";
    removeAfterExpressionCall = 1;

	// a CfgPatches, that if it exists will signify that this support can be added to the list
	// if empty string, it will be considered vanilla and added at all times
	patch = "";
};



class CRUISE_MISSILE_CLASS : basicSupport
{
	price = 1000;
	category = OTHER_CATEGORY;

	text = CRUISE_MISSILE_TEXT;
    expression = CALL_SUPPORT_MASTER(CRUISE_MISSILE_CLASS);
    icon = CAS_ICON;
};

// heavy arty
class ARTILLERY_STRIKE_155MM_HE_CLASS : basicSupport
{
	price = 1200;
	category = HEAVY_ARTILLERY_CATEGORY;

	text = ARTILLERY_STRIKE_155MM_HE_TEXT;
    expression = CALL_SUPPORT_MASTER(ARTILLERY_STRIKE_155MM_HE_CLASS);
    icon = ARTILLERY_ICON;
};
class ARTILLERY_STRIKE_155MM_CLUSTER_CLASS : basicSupport
{
	price = 2000;
	category = HEAVY_ARTILLERY_CATEGORY;

	text = ARTILLERY_STRIKE_155MM_CLUSTER_TEXT;
    expression = CALL_SUPPORT_MASTER(ARTILLERY_STRIKE_155MM_CLUSTER_CLASS);
    icon = ARTILLERY_ICON;
};
class ARTILLERY_STRIKE_155MM_MINES_CLASS : basicSupport
{
	price = 700;
	category = HEAVY_ARTILLERY_CATEGORY;

	text = ARTILLERY_STRIKE_155MM_MINES_TEXT;
    expression = CALL_SUPPORT_MASTER(ARTILLERY_STRIKE_155MM_MINES_CLASS);
    icon = ARTILLERY_ICON;
};
class ARTILLERY_STRIKE_155MM_AT_MINES_CLASS : basicSupport
{
	price = 500;
	category = HEAVY_ARTILLERY_CATEGORY;

	text = ARTILLERY_STRIKE_155MM_AT_MINES_TEXT;
    expression = CALL_SUPPORT_MASTER(ARTILLERY_STRIKE_155MM_AT_MINES_CLASS);
    icon = ARTILLERY_ICON;
};

// light mortar
class MORTAR_STRIKE_82MM_HE_CLASS : basicSupport
{
	price = 500;
	category = LIGHT_MORTAR_CATEGORY;

	text = MORTAR_STRIKE_82MM_HE_TEXT;
    expression = CALL_SUPPORT_MASTER(MORTAR_STRIKE_82MM_HE_CLASS);
    icon = MORTAR_ICON;
};
class MORTAR_STRIKE_82MM_SMOKE_CLASS : basicSupport
{
	price = 200;
	category = LIGHT_MORTAR_CATEGORY;

	text = MORTAR_STRIKE_82MM_SMOKE_TEXT;
    expression = CALL_SUPPORT_MASTER(MORTAR_STRIKE_82MM_SMOKE_CLASS);
    icon = MORTAR_ICON;
};
class MORTAR_STRIKE_82MM_FLARE_CLASS : basicSupport
{
	price = 100;
	category = LIGHT_MORTAR_CATEGORY;

	text = MORTAR_STRIKE_82MM_FLARE_TEXT;
    expression = CALL_SUPPORT_MASTER(MORTAR_STRIKE_82MM_FLARE_CLASS);
    icon = MORTAR_ICON;
};

// ship cannon
class CANNON_120MM_HE_CLASS : basicSupport
{
	price = 800;
	category = CANNON_CATEGORY;

	text = CANNON_120MM_HE_TEXT;
    expression = CALL_SUPPORT_MASTER(CANNON_120MM_HE_CLASS);
    icon = ARTILLERY_ICON;
};
class CANNON_120MM_CLUSTER_CLASS : basicSupport
{
	price = 1500;
	category = CANNON_CATEGORY;

	text = CANNON_120MM_CLUSTER_TEXT;
    expression = CALL_SUPPORT_MASTER(CANNON_120MM_CLUSTER_CLASS);
    icon = ARTILLERY_ICON;
};
class CANNON_120MM_AT_MINES_CLASS : basicSupport
{
	price = 500;
	category = CANNON_CATEGORY;

	text = CANNON_120MM_AT_MINES_TEXT;
    expression = CALL_SUPPORT_MASTER(CANNON_120MM_AT_MINES_CLASS);
    icon = ARTILLERY_ICON;
};
class CANNON_120MM_MINES_CLASS : basicSupport
{
	price = 500;
	category = CANNON_CATEGORY;

	text = CANNON_120MM_MINES_TEXT;
    expression = CALL_SUPPORT_MASTER(CANNON_120MM_MINES_CLASS);
    icon = ARTILLERY_ICON;
};
class CANNON_120MM_SMOKE_CLASS : basicSupport
{
	price = 400;
	category = CANNON_CATEGORY;

	text = CANNON_120MM_SMOKE_TEXT;
    expression = CALL_SUPPORT_MASTER(CANNON_120MM_SMOKE_CLASS);
    icon = ARTILLERY_ICON;
};

// supply
class SUPPLY_ARSENAL_DROP_CLASS : basicSupport
{
	price = 10000;
	category = SUPPLY_CATEGORY;

	text = SUPPLY_ARSENAL_DROP_TEXT;
    expression = CALL_SUPPORT_MASTER(SUPPLY_ARSENAL_DROP_CLASS);
    icon = SUPPLY_DROP_ICON;
};

// CAS
class CAS_ROCKETS_CLASS : basicSupport
{
	price = 400;
	category = CAS_CATEGORY;

	text = CAS_ROCKETS_TEXT;
    expression = CALL_SUPPORT_MASTER(CAS_ROCKETS_CLASS);
    icon = CAS_ICON;
};
class CAS_GUNS_AND_ROCKETS_CLASS : basicSupport
{
	price = 500;
	category = CAS_CATEGORY;

	text = CAS_GUNS_AND_ROCKETS_TEXT;
    expression = CALL_SUPPORT_MASTER(CAS_GUNS_AND_ROCKETS_CLASS);
    icon = CAS_ICON;
};
class CAS_GUN_RUN_CLASS : basicSupport
{
	price = 400;
	category = CAS_CATEGORY;

	text = CAS_GUN_RUN_TEXT;
    expression = CALL_SUPPORT_MASTER(CAS_GUN_RUN_CLASS);
    icon = CAS_ICON;
};

// aircraft gunner
class TURRET_GUNSHIP_CLASS : basicSupport
{
	price = 15000;
	category = GUNNER_CATEGORY;

	text = TURRET_GUNSHIP_TEXT;
    expression = CALL_SUPPORT_MASTER(TURRET_GUNSHIP_CLASS);
    icon = CAS_ICON;
};
class TURRET_ATTACK_HELI_GUNNER_CLASS : basicSupport
{
	price = 10000;
	category = GUNNER_CATEGORY;

	text = TURRET_ATTACK_HELI_GUNNER_TEXT;
    expression = CALL_SUPPORT_MASTER(TURRET_ATTACK_HELI_GUNNER_CLASS);
    icon = CAS_HELI_ICON;
};
class TURRET_DOOR_GUNNER_CLASS : basicSupport
{
	price = 1000;
	category = GUNNER_CATEGORY;

	text = TURRET_DOOR_GUNNER_TEXT;
    expression = CALL_SUPPORT_MASTER(TURRET_DOOR_GUNNER_CLASS);
    icon = CAS_HELI_ICON;
};

// Reinforcements
class REINFORCE_PARATROOPERS_CLASS : basicSupport
{
	price = 3000;
	category = REINFORCEMENTS_CATEGORY;

	text = REINFORCE_PARATROOPERS_TEXT;
    expression = CALL_SUPPORT_MASTER(REINFORCE_PARATROOPERS_CLASS);
    icon = TRANSPORT_ICON;
};


// Recon
class RECON_UAV_CLASS : basicSupport
{
	price = 800;
	category = RECON_CATEGORY;

	text = RECON_UAV_TEXT;
    expression = CALL_SUPPORT_MASTER(RECON_UAV_CLASS);
    icon = CALL_ICON;
};