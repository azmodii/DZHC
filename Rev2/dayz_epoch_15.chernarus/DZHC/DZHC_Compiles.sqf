/* Headless Client Framework for Arma 2 OA 
	By: 			[GSG] Az
	Licence: 		This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link:	https://github.com/azmodii/DZHC
*/


DZHC_HC_TaskMonitor = {
		//[_priority,_handle,_type]
		
};

// HC Functions
if (!isDedicated && !hasInterface) then {
	
	DZHC_HC_Heartbeat = {
		while {true} do
		{
			DZHC_Server_Heartbeat = player;
			publicVariableServer "DZHC_Server_Heartbeat";
			sleep 3;
		};
	};
	
	DZHC_HC_AddOverride = {
		private ["_temp1","_temp2","_handle","_override"];
		waitUntil {!DZHC_inProgress_Override};
		_temp1 = DZHC_HC_Overrides select 0;
		_temp2 = DZHC_HC_Overrides select 1;
		_handle = _this select 0;
		_override = _this select 1;
		DZHC_HC_Overrides = [(_temp1 + [_override]),[(_temp2 + [_handle])]];
		true;
	};
	
	// HC EH
	DZHC_HC_EH_Process_Query = {
		private ["_query"];
		_query = _this select 1;
		if (_query == 0) then {if((count DZHC_Local_Tasks) < 1) then {DZHC_Client_hasTask = false;} else {DZHC_Client_hasTask = true;}; publicVariableServer "DZHC_Client_hasTask"; DZHC_Client_Responded = true; publicVariableServer "DZHC_Client_Responded";};
	};
	
	DZHC_HC_EH_AssignTask = {
		private ["_task","_type","_compile","_args","_priority"];
		
		_task = _this select 1;
		diag_log format["DZHC Client: task %1",_task];
		_type = _task select 0;
		_compile = _task select 1;
		_args = _task select 2;
		_priority = _task select 3;
		DZHC_Client_Responded = true;
		publicVariableServer "DZHC_Client_Responded";
		switch (_type) do
		{
			case 1: {_handle = _args call _compile; [_priority,_handle,_type] call DZHC_HC_TaskMonitor;};
			case 2: {_handle = _args spawn _compile; [_priority,_handle,_type] call DZHC_HC_TaskMonitor;};
			case 3: {_args execVM _compile;};
			case 4: {_handle = compile _compile; [_priority,_handle,_type] call DZHC_HC_TaskMonitor;};
			case 5: {_handle = _args call (compile _compile); [_priority,_handle,_type] call DZHC_HC_TaskMonitor;};
			case 6: {_handle = _args spawn (compile _compile); [_priority,_handle,_type] call DZHC_HC_TaskMonitor;};
			case 7: {_handle = _args call (compile preprocessFile _compile); [_priority,_handle,_type] call DZHC_HC_TaskMonitor;};
			case 8: {_handle = _args call (compile preprocessFileLineNumbers _compile); [_priority,_handle,_type] call DZHC_HC_TaskMonitor;};
		};
	};
	
	// HC EH
	"DZHC_Local_Query" addPublicVariableEventHandler DZHC_HC_EH_Process_Query;
	"DZHC_Local_AssignTask" addPublicVariableEventHandler DZHC_HC_EH_AssignTask;
};

// Client Functions
if (!isDedicated && hasInterface) then {
	
	DZHC_Client_AddOverride = {
		private ["_temp1","_temp2","_handle","_override"];
		waitUntil {!DZHC_inProgress_Override};
		_temp1 = DZHC_Client_Overrides select 0;
		_temp2 = DZHC_Client_Overrides select 1;
		_handle = _this select 0;
		_override = _this select 1;
		DZHC_Client_Overrides = [(_temp1 + [_override]),[(_temp2 + [_handle])]];
		true;
	};
	
	DZHC_Client_EH_Override = {
	//DZHC_Client_Override = [_override,_terminate,_suspend,_isPath,_uID,_type];
		private ["_vars","_override","_type","_isScript","_isArray","_code","_terminate"];
		diag_log "DZHC Client: DZHC_Client_EH_Override";
		_vars = _this select 1;
		_override = _vars select 0;
		_type = _vars select 5;
		if (_type == 0) then {
			if (_override in DZHC_Client_Overrides_Active) exitWith {diag_log format["DZHC Client: Override %1 already active!",_override];};
			_isScript = ((typeName _override) == "CODE");
			_isArray = ((typeName _override) == "ARRAY");
			if (!_isScript) then {
				if (_isArray) then {
					{
						_code = format["{if(!isNil '%1') then { %1 = {};};};",_x];
						call compile _code;
					} forEach _override;
				} else {
					_code = format["{if(!isNil '%1') then { %1 = {};};};",_override];
					diag_log format["DZHC Client: Override GO! %1",_code];
					call compile _code;
				};
			};
			_terminate = _vars select 1;
			{
				private ["_count","_handle"];
				_count = (DZHC_Client_Overrides select 0) find _x;
				_handle = (DZHC_Client_Overrides select 1) select _count;
				terminate _handle;
			} forEach _terminate;
			DZHC_Client_Overrides_Active = + [_override];
		};
		if (_type == 1) then {
			diag_log "DZHC Client: Compiling override";
			call compile _override;
		};
	};
	
	// Client EH
	"DZHC_Client_Override" addPublicVariableEventHandler DZHC_Client_EH_Override;
};

