/* Headless Client Framework for Arma 2 OA 
	By: 			[GSG] Az
	Licence: 		This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link:	https://github.com/azmodii/DZHC
*/

waituntil {!isNil "bis_fnc_init"};
call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZHC\DZHC_Server_Config.sqf";

// Server Event Handlers
DZHC_Handler_Heartbeat = {
	private ["_owner","_found","_connected"];
	if (!DZHC_Server_Monitor_HB) then {[] spawn DZHC_Monitor_HB;};
	DZHC_Server_Monitor_HB = true;
	_owner = owner (_this select 1);
	_found = false;
	_connected = + DZHC_Server_Connected;
	{
		if ((_x select 0) == _owner) exitWith { 
			_x set [1,time]; 
			_found = true; 
		};
	} forEach _connected;
	if (!_found) then { 
		_connected set [count _connected, [ _owner, floor time ]]; 
		diag_log "DZHC: Headless Client Connected! ClientID = " + str _owner;
	};
	DZHC_Server_Connected = +_connected;
};

DZHC_Handler_Request = {
	private["_vars","_args","_req","_client","_log"];
	_vars = _this select 1;
	_args = _vars select 0;
	_req = _vars select 1;
	_client = _vars select 2;
	_log = (format["%1 | %2",_client,[_req,_args]]);
	diag_log _log;
	if (_req == 0) then {_args spawn DZHC_Monitor_waitForHC;};
	if (_req == 99) then {DZHC_Server_Automation = true;};
};

"DZHC_Server_Heartbeat" addPublicVariableEventHandler DZHC_Handler_Heartbeat;
"DZHC_Server_Request" addPublicVariableEventHandler DZHC_Handler_Request;

// Server Functions
DZHC_Network_Timeout = {
	private ["_count"];
	_count = 0;
	while {!DZHC_Client_Responded} do
	{
		if (!(_count < DZHC_Variable_NetworkTimeout)) exitWith {[_count,"DZHC_Network_Timeout"] call DZHC_Server_Diagnostics; DZHC_Client_Failed = true; DZHC_Client_Responded = true;};
		sleep 1;
		_count = _count + 1;
	};
};

DZHC_Publish_Override = {
	private ["_vars","_hcid","_override","_terminate","_suspend","_priority","_isServer","_code","_count","_handle","_owner","_name"];
	// ADD CODE FOR OVERRIDE
	// [hcid,Args,Override,Terminate,Suspend,isServer,priority];
	_vars = _this;
	_hcid = _vars select 0;
	_override = _vars select 2;
	_terminate = _vars select 3;
	_suspend = _vars select 4;
	_priority = _vars select 6;
	_isServer = _vars select 5;
	
	if (_isServer) then {
		_code = format["{%1 = {};};",_override];
		call compile _code;
		{
			_count = (DZHC_Server_Overrides select 0) find _x;
			_handle = (DZHC_Server_Overrides select 1) select _count;
			terminate _handle;
		} forEach _terminate;
		DZHC_Server_HCHandoffs_Active = + [_hcid,_override,_suspend];
	} else {
		DZHC_Client_Override = [_override,_terminate,_suspend];
		{
			_owner = owner _x;
			_name = name _x;
			if (_name != "HeadlessClient") then {
				_owner publicVariableClient "DZHC_Client_Override";
			};
		} forEach playableUnits;
	};	
};

DZHC_Publish_Failed = {
	// _send = [type,Compile,Args,priority];
	// _monitor = [hcid,Args,Override,Terminate,Suspend,isServer,priority];
			
};

DZHC_Publish_Task = {
	private ["_client","_vars","_task","_monitor","_succeed","_diag","_override"];
	_client = _this select 0;
	_vars = _this select 1;
	_task = _vars select 0;
	_monitor = _vars select 1;
	_succeed = false;
	DZHC_Local_AssignTask = _task;
	_client publicVariableClient "DZHC_Local_AssignTask";
	_diag = [] spawn DZHC_Network_Timeout;
	waitUntil {DZHC_Client_Responded};
	terminate _diag;
	if (DZHC_Client_Failed) exitWith {[_client,"Client Failed to Respond"] call DZHC_Server_Diagnostics; DZHC_Client_Failed = false;};
	if (!DZHC_Monitor_Task_Active) then {[] spawn DZHC_Monitor_Task;};
	_override = [_monitor] call DZHC_Publish_Override;
	if (_override) then {
		_succeed = true;
		DZHC_Monitored_Tasks = + DZHC_Monitored_Tasks + [_monitor];
	} else {
		_succeed = false;
		[_task,_monitor] call DZHC_Publish_Failed;
	};
	_succeed;
};

DZHC_Process_Queue = {
	private ["_connected","_continue","_count","_hcid","_time","_owner","_diag","_task"];
	// Lets find a free HC
	_connected = + DZHC_Server_Connected;
	_continue = true;
	_count = (count _connected) - 1;
	_hcid = 0;
	{
		{
			_time = floor time;
			_owner = _x select 0;
			DZHC_Local_Query = 0;
			_owner publicVariableClient "DZHC_Local_Query";
			_diag = [] spawn DZHC_Network_Timeout;
			waitUntil {DZHC_Client_Responded};
			terminate _diag;
			if (DZHC_Client_Failed) exitWith {[_hcid,"Client Failed to Respond"] call DZHC_Server_Diagnostics; DZHC_Client_Failed = false;};
			if (DZHC_Variable_Diagnostics_Network) then {_time = (floor time) - _time; [_time,"DZHC_Local_Query"] call DZHC_Server_Diagnostics;};
			if (!DZHC_Client_hasTask) exitWith {_hcid = _x select 0; DZHC_Client_Responded = false;};
			DZHC_Client_Responded = false;
		} forEach _connected;
		if (_hcid == 0) then {[_hcid,"Free client not found"] call DZHC_Server_Diagnostics;} else {
			_task = _x;
			_continue = [_hcid,_task] call DZHC_Publish_Task;
		};
		if (!_continue) exitWith {[_x,"Failed to publish task"] call DZHC_Server_Diagnostics;};
	} forEach DZHC_Server_Queue;
};

DZHC_Server_Start = {
	//Get a list of tasks
	if ((count DZHC_Server_HCHandoffs) > 0) then {
		{	
			private ["_send","_monitor","_async"];
			// [type,Compile,Args,priority];
			_send = [_x select 0, _x select 1, _x select 2, _x select 7];
			// [hcid,Args,Override,Terminate,Suspend,isServer,priority];
			_monitor = [0,_x select 2,_x select 3,_x select 4,_x select 5,_x select 6,_x select 7];
			_async = _x select 8;
			DZHC_Server_Queue = DZHC_Server_Queue + [_send,_monitor,_async];
		} forEach DZHC_Server_HCHandoffs;
	};
	call DZHC_Process_Queue;
};

DZHC_Server_Kill = {
	diag_log "DZHC: ServerKill Called";
};

DZHC_Server_Diagnostics = {
	call DZHC_Server_Kill;
};

DZHC_Server_AddOverride = {
	private ["_temp1","_temp2","_handle","_override"];
	waitUntil {!DZHC_inProgress_Override};
	_temp1 = DZHC_Server_Overrides select 0;
	_temp2 = DZHC_Server_Overrides select 1;
	_handle = _this select 0;
	_override = _this select 1;
	DZHC_Server_Overrides = [(_temp1 + [_override]),[(_temp2 + [_handle])]];
	true;
};

// Server loops
DZHC_Monitor_HB = {
	private ["_cursor","_holder","_time","_arrsize"];
	while {true} do {
		_cursor = 0;
		_holder = + DZHC_Server_Connected;
		_time = floor time;
		_arrsize = count _holder;
		while { _cursor < _arrsize } do
		{
			if ((((_holder select _cursor) select 1) + 20) < _time) then { // eject
				diag_log "DZHC: Headless Client LOST! ClientID = " + str ((_holder select _cursor) select 1);
				_holder set [_cursor, _holder select (_arrsize - 1)];
				_holder resize (_arrsize - 1);
				_arrsize = _arrsize - 1;
			} else {
				_cursor = _cursor + 1;
			};
		};
		DZHC_Server_Connected = + _holder;
		sleep 7;
	};
};

DZHC_Monitor_waitForHC = {
	while {true} do 
	{
		waitUntil {((count DZHC_Server_Connected) > 0)};
		if ((count DZHC_Server_Connected) > 0) exitWith {call DZHC_Server_Start;};
	};
};

DZHC_Monitor_Task = {
	DZHC_Monitor_Task_Active = true;
	while {true} do
	{
		//Monitor Task Loop
	
	};
	
};



// Finally, initialise the HC framework
if (DZHC_Server_Automation) then {
	_handle = [] spawn DZHC_Monitor_waitForHC;
};

