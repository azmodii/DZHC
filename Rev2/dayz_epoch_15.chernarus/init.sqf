/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	12;					
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio true;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
MaxVehicleLimit = 300; // Default = 50
MaxDynamicDebris = 0; // Default = 100
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 50; // Default: 100

dayz_MapArea = 14000; // Default = 10000
dayz_minpos = -1; 
dayz_maxpos = 16000;
dayz_paraSpawn = false;
dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;
dayz_tameDogs = false;
dayz_fullMoonNights = true;
dayz_zedsAttackVehicles = false;
dayz_maxZeds = 0;
dayz_maxLocalZombies = 0; // Default = 30
dayz_maxAnimals = 0; // Default: 8

DZE_BuildOnRoads = true; // Default: False
DZE_ForceNameTags = true;
DZE_DeathMsgTitleText = true;
DZE_DeathMsgGlobal = true;
DZE_BackpackGuard = false; //Default = true, true to enable, false to disable
DZE_BuildingLimit = 200;

// Performance
DZE_R3F_WEIGHT = false;
DZE_ConfigTrader = true;
DZE_DamageBeforeMaint = 0.09;

//DQS Settings
DQS_FilePath = "DQS";
DQS_Debug = false;
DQS_EpochFix = false;

//DZHC Settings
DZHC_Diag_FPS = true;

EpochEvents = 	[["any","any","any","any",30,"crash_spawner"],
				["any","any","any","any",0,"crash_spawner"],
				["any","any","any","any",15,"supply_drop"],
				["any","any","any","any",10,"Military"], 
				["any","any","any","any",25,"Treasure"], 
				["any","any","any","any",40,"Supplyitems"], 
				["any","any","any","any",55,"Construction"]];

//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers (format["%1\DQS_variables.sqf",DQS_FilePath]); // DQS
call compile preprocessFileLineNumbers "DZHC\DZHC_Variables.sqf";								//DZHC
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
if (isServer || hasInterface) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
	call compile preprocessFileLineNumbers "Overrides\GSG_compiles.sqf";
	call compile preprocessFileLineNumbers (format["%1\DQS_compiles.sqf",DQS_FilePath]); // DQS
};
call compile preprocessFileLineNumbers "DZHC\DZHC_Compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
if (!isDedicated && !hasInterface) then {
	call compile preprocessFileLineNumbers "DZHC\DZHC_Init.sqf";
};
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_17.Chernarus\dynamic_vehicle.sqf";
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\buildings\traders\default.sqf";
	_nil2 = [] execVM "\z\addons\dayz_server\buildings\traders\kozlovka.sqf";
	_nil3 = [] execVM "z\addons\dayz_server\buildings\traders\etaSkalistyVillage.sqf";
	_nil4 = [] execVM "z\addons\dayz_server\buildings\traders\Shakhovka.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated && hasInterface) then {
	[] execVM "Mods\GSG_exec_mods.sqf";
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	[] execVM "Mods\SrvPoint\service_point.sqf";
	[] execVM "Mods\Credits\Server_WelcomeCredits.sqf";
	[] execVM "DZHC\init.sqf";
};

//Start Dynamic Weather
execVM "Overrides\DynamicWeatherEffects.sqf";

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
