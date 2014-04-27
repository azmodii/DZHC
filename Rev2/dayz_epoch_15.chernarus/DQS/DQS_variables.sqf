/* DQS_Variables */
// Not sure if needed, or just spammed religiously
disableSerialization;

if (isNil "DQS_Debug") then {
	DQS_Debug = false;
};
if (isNil "DQS_FilePath") then {
	DQS_FilePath = "DQS";
};
if (isNil "DQS_EpochFix") then {
	DQS_EpochFix = false;
};

if (DQS_Debug) then {
	diag_log format["DQS DEBUG: Init DQS Variables"];
};

/* DQS Modules Manager 
	You can activate and disable mods at will here. 
	Each mod has a top level mod. Disabling this will disable all children reliant on that mod.
	A full list is provided below:

	GUI = DQS Custom GUI
	CC = Custom Context
		CR = Crafting
		BD = Building
		WM = Weapon Mods
*/
/* DQS_ActiveModules = [["GUI",[]],["CC",["CR","BD","WM"]]];
{
	format["DQS_%1",_x select 0] = true;
	_cm = _x select 0;
	{
		format["DQS_%1_%2",_cm,_x] = true;
	} forEach _x select 1;
} forEach DQS_ActiveModules; */

//NPC Stuff
DQS_NPC_AlignmentEnabled = false;
DQS_NPC_AlignmentModifier = 1;
DQS_NPC_AlignmentClasses = ["Class1","Class2"];

DQS_NPC_HumanityEnabled = true; // Set this to false to disable humanity NPC system.
DQS_NPC_HumanityDialog = true; // Set this to true to enable different dialog based off humanity.
DQS_NPC_HumanityModifier = 1;

NPC_Factions = ["gsc_stalker_faction","gsc_military_faction"];	// For reference only. Please dont edit this. 

/* DQS Error Handler Options */
DQS_EH_VerboseMode = true;		// Default: false			Enables verbose error reporting
DQS_EH_DebugMode = true;		// Default: false			Uses titleText and systemChat for error reports

/* Global DQS UI Options */
DQS_UI_TitleTextFade = 10; 	// The time it takes titleText to fade globally

/* DQS Antihack System */
DQS_AdminList = ["0"];

/* (CC) DQS Custom Context Variables (No Prerequisites) */

	/* (CR) DQS Crafting Variables (Requires CC) */
	DQS_CC_AdminFastBuild = false;
	DQS_CC_MinDistance = 4;
	DQS_CC_AlertDistance = 10;
	DQS_CC_CraftingSound = "repair";
	
	/* (BD) DQS Custom Building Variables (Requires CC) */	
	DQS_CC_AllowedItems = [] + getArray (missionConfigFile >> "DQS_CC_Config" >> "AllowedObj");  
	DQS_CC_MaintainItems = [] + getArray (missionConfigFile >> "DQS_CC_Config" >> "MaintainObj");
	{dayz_allowedObjects set [(count dayz_allowedObjects), _x];} forEach DQS_CC_AllowedItems; 
	{DZE_maintainClasses set [(count DZE_maintainClasses), _x];} forEach DQS_CC_MaintainItems;
	
	/* (WM) DQS Weapon Modification Variables (Requires CC) */

/* (SZ) DQS Safezone Variables (No prerequisites) */
DQS_SZ_Debug = false;
DQS_SZ_Messages = true;	
DQS_SZ_Players_Godmode = true; 	
DQS_SZ_Players_WeaponDisabled = true;							
DQS_SZ_AntiTheft_Player = true;	
DQS_SZ_AntiTheft_Vehicle = true;		
DQS_SZ_AntiTheft_FriendlyAccess = true;
DQS_SZ_Vehicles_Godmode = true;	
DQS_SZ_Vehicles_WeaponDisabled = true;
DQS_SZ_Vehicles_MaxSpeed = 50;			

// These values should not be touched.
serverNPCS = [];
s_player_npc = [];
s_player_npc_crtl =	-1;	
DQS_Fired = true;		






// custom traders shit
DQS_Trigger_A1 = false;
DQS_Trader_A1_Spawn = false;