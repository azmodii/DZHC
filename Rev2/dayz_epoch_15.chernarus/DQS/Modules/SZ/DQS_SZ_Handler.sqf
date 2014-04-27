/* DQS Safezone module 
	Credits: Macca (Better Safezones), AlienX (AGN Safezones), 
*/

private ["_status","_szpos","_szarea"];
_status = _this select 0;
_szpos 	= _this select 1;
_szarea = _this select 2;

DQS_SZ_Enable = {
	private ["_szpos","_szarea"];
	if (DQS_SZ_Zone < 1) exitWith {call DQS_SZ_Disable};
	_szpos = _this select 0;
	_szarea = _this select 1;
	inSafeZone = true;
	_inVehicle = objNull;
	_inVehicleLast = objNull;
	if (DQS_SZ_Messages) then {systemChat (format["You have entered %1 safezone, you have godmode and your weapons have been deactivated!",inTraderCity]);};
	fnc_usec_damageHandler = {};
	player_zombieCheck = {};
	player allowDamage false;
	player removeAllEventhandlers "handleDamage";
	player addEventhandler ["handleDamage", {false}];
	SafezoneFiredEvent = player addEventHandler ["Fired", {
		if (DQS_SZ_Messages) then {systemChat ("You can not fire your weapon in a safe zone.");};
		NearestObject [_this select 0,_this select 4] setPos[0,0,0];
	}];
	
	SafezoneSkinChange = [] spawn {
		_skin = typeOf player;
		waitUntil {typeOf player != _skin};
		terminate SafezoneVehicleSpeedLimit;
		SafezoneVehicle removeEventHandler ["Fired", SafezoneVehicleFiredEvent];
		SafezoneVehicleFiredEvent = nil;
		sleep 2;
		if (DQS_SZ_Zone < 1) then {call DQS_SZ_Disable};
		call DQS_SZ_Enable;
	};

	SafezoneVehicleSpeedLimit = [] spawn {
		_maxspeed = DQS_SZ_Vehicles_MaxSpeed;
		while {true} do {
			waitUntil {vehicle player != player and !((vehicle player) isKindOf 'Air')};
			_vehicle = vehicle player;
			_curspeed = speed _vehicle;
			if (_curspeed > _maxspeed) then {
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = _curspeed - _maxspeed;
				_vehicle setVelocity [(_vel select 0)-((sin _dir)*_speed),(_vel select 1)- ((cos _dir)*_speed),(_vel select 2)];
			};
			sleep 0.1;
			if (DQS_SZ_Zone < 1) exitWith {call DQS_SZ_Disable};
		};
	};
	
	SafezoneZombieShield = [_szarea] spawn {
		private ["_szarea"];
		_szarea = _this select 0;
		while {true} do {
			_entity_array = (getPos player) nearEntities ["CAManBase",_szarea];
			{
				if (_x isKindof "zZombie_Base") then {deletevehicle _x;};
			} forEach _entity_array;
			sleep 15;
			if (DQS_SZ_Zone < 1) exitWith {call DQS_SZ_Disable};
		};
	};
	
	SafeZoneVehicleGod = [_szpos,_szarea] spawn {
		private ["_szarea"];
		_szpos = _this select 0;
		_szarea = _this select 1;
		if (DQS_SZ_Messages) then {systemChat ("Your vehicle now has godmode.");};
		while {true} do {
			{_x allowdamage false } foreach (nearestObjects [player,['building','LandVehicle','Air'], _szarea]);
			sleep 4;
			if (DQS_SZ_Zone < 1) exitWith {call DQS_SZ_Disable};
		};
	};
};

DQS_SZ_Disable = {
	inSafeZone = false;
	if (DQS_SZ_Messages) then {hintSilent (format["You have left %1!",inTraderCity]);};
	fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
	player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	terminate SafezoneVehicleSpeedLimit;
	terminate SafezoneSkinChange;
	terminate SafezoneZombieShield;
	terminate SafeZoneVehicleGod;
	(vehicle player) allowDamage true;
	player allowDamage true;
	player removeAllEventHandlers 'HandleDamage';
	player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
	player removeEventHandler ["Fired", SafezoneFiredEvent];
	DQS_SZ_Zone = 0;
};

switch (_status) do
{
	case "enable": { [_szpos,_szarea] call DQS_SZ_Enable; };
	case "disable": { call DQS_SZ_Disable; };
};