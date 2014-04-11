/* Headless Client Framework for Arma 2 OA 
	By: [GSG] Az
	Licence: This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link: https://github.com/azmodii/DZHC
*/

// All but server compiles
if (!isDedicated) then {
	DZHC_All_SlotCheck = {
		// Kick the player if its in the wrong slot. 
		If (hasInterface && ((side player) in DZHC_Side)) then {
			DZHC_KICK = 1;
			publicVariableServer "DZHC_KICK";
		};
		if (!hasInterface && (!(side player) in DZHC_Side)) then {
			DZHC_KICK = 1;
			publicVariableServer "DZHC_KICK";
		};
	};
};

// Headless Client Compiles
if (!isDedicated && !hasInterface) then {
	
	DZHC_HC_Heartbeat = {
		while {true} do
		{
			DZHC_Server_Heartbeat = player;
			publicVariableServer "DZHC_Server_Heartbeat";
			sleep 3;
		};
	};
	
	DZHC_Handler_StartScript = {
		private ["_script"];
		_script = _this select 1;
		_handle = [] execVM _script;
		DZHC_Server_RegisterHC = [player,_handle];
		publicVariableServer "DZHC_Server_RegisterHC";
	};
	
	DZHC_Handler_KillHandle = {
		private ["_handle"];
		_handle = _this select 1;
		terminate _handle;
	};
	
	"DZHC_HC_StartScript" addPublicVariableEventHandler DZHC_Handler_StartScript;
	"DZHC_HC_KillHandle" addPublicVariableEventHandler DZHC_Handler_KillHandle;
};







// Client Functions
if (!isDedicated && hasInterface) then {

	DZHC_Client_ProcessCmd = {
		_vars = _this select 1;
		_cmd = _vars select 0;
		_args = _vars select 1;
		_compile = format["{%1 call %2;};",_args,_cmd];
		call compile _compile;
	};
	
	DZHC_Client_Override = {
		_vars = _this select 1;
		_func = _vars select 0;
		DZHC_Client_Overriden = player;
		publicVariableServer "DZHC_Client_Overriden";
		terminate _func;
	};

	DZHC_Client_Return = {
		_vars = _this select 1;
		_func = _vars select 0;
		_code = _vars select 1;
		_compile = format["{%1 = compile preprocessFileLineNumbers '%2';};",_func,_code];
		call compile _compile;
	};
	
	// Client EH
	"DZHC_Client_Command" addPublicVariableEventHandler DZHC_Client_ProcessCmd;
};




