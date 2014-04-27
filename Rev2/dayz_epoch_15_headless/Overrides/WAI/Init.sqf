spawn_group = 	compile preprocessFileLineNumbers "DZHC\Overrides\WAI\compile\SpawnGroup.sqf";
group_waypoints = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\compile\patrol.sqf";
spawn_static  = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\compile\SpawnStatic.sqf";
heli_para  = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\compile\heli_para.sqf";
heli_patrol = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\compile\heli_patrol.sqf";
vehicle_patrol = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\compile\vehicle_patrol.sqf";

on_kill = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\compile\ai_killed.sqf";

ai_monitor = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\compile\AImonitor.sqf";
veh_monitor = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\compile\vehicle_monitor.sqf";

createCenter east;
WEST setFriend [EAST,0];
EAST setFriend [WEST,0];
WAIconfigloaded = False;
WAImissionconfig = False;

ai_ground_units = 0;
ai_emplacement_units = 0;
ai_air_units = 0;
ai_vehicle_units = 0;

//Load config
[] ExecVM "DZHC\Overrides\WAI\AIconfig.sqf";
//Wait for config
waitUntil {WAIconfigloaded};
diag_log "WAI: AI Config File Loaded";
[] spawn ai_monitor;
//Load custom spawns
[] ExecVM "DZHC\Overrides\WAI\customSpawns.sqf";
if (ai_mission_sysyem) then {
	//Load AI mission system
	[] ExecVM "DZHC\Overrides\WAI\missions\missionIni.sqf";
};