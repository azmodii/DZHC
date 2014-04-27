/* Zombie_Headless_Init.sqf

	Script to handle to pass offs to the local headless client for zombie override.
	This means there is no need to pre initialise the event handlers to get this done.
	It preserves the easy modification of scripts and you should use this as a general
	idea on how to handoff your own custom scripts.
	
*/
diag_log "DZHC Headless: Zombie HC init starting!";

// Vars
DZHC_HC_ZedHandoff_Client = false;
dayz_maxLocalZombies = 80; 
dayz_maxGlobalZombiesInit = 80;
dayz_maxGloabZombiesIncrease = 20;
dayz_maxZeds = 1000;

// Compiles
player_spawnCheck = compile preprocessFileLineNumbers "DZHC\Overrides\Zeds\player_spawnCheck.sqf";

// Event handlers
DZHC_HC_EH_ZedHandoff = {
	private ["_vars"];
	_vars = _this select 1;
	_vars call player_spawnCheck;
};

"DZHC_HC_ZedHandoff_Client" addPublicVariableEventHandler DZHC_HC_EH_ZedHandoff;

// Any additional code to execute
private ["_code"];
DZHC_Server_Request = [2,["{player_spawnCheck = compile preprocessFileLineNumbers 'DZHC\Overrides\player_spawnCheck.sqf';};",true]];
publicVariableServer "DZHC_Server_Request";

