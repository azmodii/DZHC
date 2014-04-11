/* Headless Client Framework for Arma 2 OA 
	By: [GSG] Az
	Licence: This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link: https://github.com/azmodii/DZHC
*/
waituntil {!isnil "bis_fnc_init"};
if (isNil "DZHC_ConnectedHCs") then {DZHC_ConnectedHCs = [];};
if (isNil "DZHC_Override_Clients") then {DZHC_Override_Clients = [];};
if (isNil "DZHC_Command_Active") then {DZHC_Command_Active = false;};
if (isNil "DZHC_Command") then {DZHC_Command = [];};

// Server Functions
DZHC_Handler_FindHC = {

};

DZHC_Handler_Execute = {
	waitUntil {!DZHC_Command_Active};
	DZHC_Command_Active = true;
	DZHC_Command = _this select 0;
	_freeHC = call DZHC_Handler_FindHC;
	_freeHC publicVariableClient "DZHC_Command";
	DZHC_Command_Active = false;
};

DZHC_Handler_Heartbeat = {
	private ["_owner","_found","_connected"];
	_owner = owner (_this select 1);
	_found = false;
	_connected = + DZHC_ConnectedHCs;
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
	DZHC_ConnectedHCs = +_connected;
};

DZHC_Handler_Kick = {
	private ["_owner"];
	_owner = owner (_this select 1); // HC Client
	if (_owner in DZHC_ConnectedHCs) then {
		DZHC_ConnectedHCs = DZHC_ConnectedHCs - [_owner]; 
		diag_log format["DZHC: Headless Client connected to the wrong slot and was kicked! HCID = %1",_owner];
	} else {
		diag_log format["DZHC: Player %1 tried to connect to HC slot and was kicked",_owner];
	};
};

DZHC_Handler_ClientInactive = {
	_owner = owner (_this select 1);
	DZHC_Client_Overriden = + _owner;
};

// Add the regular EHs
"DZHC_Server_Heartbeat" addPublicVariableEventHandler DZHC_Handler_Heartbeat;
"DZHC_Server_Command" addPublicVariableEventHandler DZHC_Handler_Execute;
"DZHC_KICK" addPublicVariableEventHandler DZHC_Handler_Kick;
"DZHC_Client_Overriden" addPublicVariableEventHandler DZHC_Handler_ClientInactive;

// Execute the HC connection loop
[] spawn {
	private ["_cursor","_holder","_time","_arrsize"];
	while {true} do {
		_cursor = 0;
		_holder = + DZHC_ConnectedHCs;
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
		DZHC_ConnectedHCs = + _holder;
		sleep 7;
	};
};




DZHC_Handler_RegisterHC = {
	private ["_vars"];
	_vars = _this select 1;
	_owner = owner (_vars select 0);
	_handle = _vars select 1;
	_compile = _vars select 2;
	DZHC_Variables_RegisteredHCs set [(count DZHC_Variables_RegisteredHCs),[_owner,_handle,_compile]];
};
DZHC_Handler_DeregisterHC = {
	_vars = _this select 1;
	_owner = owner (_vars select 0);
	_handle = _vars select 1;
	_compile = _vars select 2;
	_count = 0;
	{
		if (_handle in _x) exitWith {
			DZHC_Variables_RegisteredHCs set [_count,-1];
			DZHC_Variables_RegisteredHCs = DZHC_Variables_RegisteredHCs - [-1];
		};
		_count = _count + 1;
	} forEach DZHC_Variables_RegisteredHCs;
	
};



"DZHC_Server_RegisterHC" addPublicVariableEventHandler DZHC_Handler_RegisterHC;
"DZHC_Server_DeregisterHC" addPublicVariableEventHandler DZHC_Handler_DeregisterHC;