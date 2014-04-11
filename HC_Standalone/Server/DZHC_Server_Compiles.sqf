/* Headless Client Framework for Arma 2 OA 
	By: [GSG] Az
	Licence: This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link: https://github.com/azmodii/DZHC
*/

waituntil {!isnil "bis_fnc_init"};
if (isNil "DZHC_ConnectedHCs") then {DZHC_ConnectedHCs = [];};

// Server Functions
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

// Server EH
"DZHC_Server_Heartbeat" addPublicVariableEventHandler DZHC_Handler_Heartbeat;

// Server Loop
[] spawn {
	private ["_cursor","_holder","_time","_arrsize"];
	while {true} do {
		_cursor = 0;
		_holder = + DZHC_ConnectedHCs;
		_time = floor time;
		_arrsize = count _holder;
		while { _cursor < _arrsize } do
		{
			DZHC_HC_Connected = true;
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