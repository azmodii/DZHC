/* Headless Client Framework for Arma 2 OA 
	By: [GSG] Az
	Licence: This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link: https://github.com/azmodii/DZHC
*/

waituntil {!isNil "bis_fnc_init"};
if (isNil "DZHC_Server_Monitor_HB") then {DZHC_Server_Monitor_HB = false;};
if (isNil "DZHC_Server_Connected") then {DZHC_Server_Connected = [];};
if (isNil "DZHC_Server_Queue") then {DZHC_Server_Queue = [];};
if (isNil "DZHC_Client_Responded") then {DZHC_Client_Responded = false;};
if (isNil "DZHC_Client_hasTask") then {DZHC_Client_hasTask = true;};
if (isNil "DZHC_Client_Failed") then {DZHC_Client_Failed = false;};
if (isNil "DZHC_Monitor_Task_Active") then {DZHC_Monitor_Task_Active = false;};
if (isNil "DZHC_Monitored_Tasks") then {DZHC_Monitored_Tasks = [];};
if (isNil "DZHC_Monitored_Threads") then {DZHC_Monitored_Threads = [];};

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
	_count = 0;
	while {!DZHC_Client_Responded} do
	{
		if (!(_count < DZHC_Variable_NetworkTimeout)) exitWith {[_count,"DZHC_Network_Timeout"] call DZHC_Server_Diagnostics; DZHC_Client_Failed = true; DZHC_Client_Responded = true;};
		sleep 1;
		_count = _count + 1;
	};
};

DZHC_Publish_Task = {
	_client = _this select 0;
	_vars = _this select 1;
	_task = _vars select 0;
	_monitor = _vars select 1;
	DZHC_Local_AssignTask = _task;
	_client publicVariableClient "DZHC_Local_AssignTask";
	_diag = [] spawn DZHC_Network_Timeout;
	waitUntil {DZHC_Client_Responded};
	terminate _diag;
	if (DZHC_Client_Failed) exitWith {[_hcid,"Client Failed to Respond"] call DZHC_Server_Diagnostics; DZHC_Client_Failed;};
	if (!DZHC_Monitor_Task_Active) then {[] spawn DZHC_Monitor_Task;};
	DZHC_Monitored_Tasks = + DZHC_Monitored_Tasks + [_monitor];
};

DZHC_Process_Queue = {
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
	if ((count DZHC_Server_Overrides) > 0) then {
		{	
			private ["_send","_monitor","_async"];
			// [type,Compile,Args,priority];
			_send = [_x select 0, _x select 1, _x select 2, _x select 7];
			// [hcid,Args,Override,Terminate,Suspend,isServer,priority];
			_monitor = [0,_x select 2,_x select 3,_x select 4,_x select 5,_x select 6,_x select 7];
			_async = _x select 8;
			DZHC_Server_Queue = DZHC_Server_Queue + [_send,_monitor,_async];
		} forEach DZHC_Server_Overrides;
	};
	call DZHC_Process_Queue;
};

DZHC_Server_Diagnostics = {

};

DZHC_Server_PreInit = {
	DZHC_Monitored_Threads = [["server",[]],["override",[]],["critical",[]]];
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
	while {true} do
	{
		//Monitor Task Loop
	
	};
	DZHC_Monitor_Task_Active = true;
};

call DZHC_Server_PreInit;

// Finally, initialise the HC framework
if (DZHC_Server_Automation) then {
	_handle = [] spawn DZHC_Monitor_waitForHC;
};

