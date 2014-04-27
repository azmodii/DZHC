
if (!isDedicated) then {
	player_build			= 	compile preprocessFileLineNumbers "Overrides\snap_build\player_build.sqf";
	player_buildControls	= 	compile preprocessFileLineNumbers "Overrides\snap_build\player_buildControls.sqf";
	snap_object				= 	compile preprocessFileLineNumbers "Overrides\snap_build\snap_object.sqf";
};       