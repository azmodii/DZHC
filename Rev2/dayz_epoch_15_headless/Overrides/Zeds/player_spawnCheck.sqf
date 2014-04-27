private ["_type","_inVehicle","_dateNow","_maxWildZombies","_age","_radius","_position","_markerstr","_markerstr1","_markerstr2","_markerstr3","_nearByObj","_handle","_looted","_cleared","_zombied","_config","_canLoot","_dis","_players","_nearby","_nearbyCount","_onTheMove","_soundLimit"];

_type = _this select 0;
_inVehicle = _this select 1;
_onTheMove = _this select 2;
_dateNow = _this select 3;
_maxWildZombies = _this select 4;
_age = _this select 5;
_radius = _this select 6; 
_position = _this select 7;
_nearbyplayers = 0;
hint ("DZHC: Zed spawn request: " + str _this);
diag_log ("DZHC: Zed spawn request: " + str _this);

_dayz_CurrentZombies = 0;
_dayz_maxGlobalZombies = 0;

_players = _position nearEntities ["CAManBase",_radius+200];
dayz_maxGlobalZombies = dayz_maxGlobalZombiesInit;
{
	if(isPlayer _x) then {
		dayz_maxGlobalZombies = dayz_maxGlobalZombies + dayz_maxGlobalZombiesIncrease;
	} else {
		if (_x isKindOf "zZombie_Base") then {
			if (local _x) then {
				dayz_spawnZombies = dayz_spawnZombies + 1;
			};
			dayz_CurrentZombies = dayz_CurrentZombies + 1;
		};
	};
} foreach _players;

if (DZHC_HC_Debug) then {
	diag_log ("SpawnWait: " +str(time - dayz_spawnWait));
	diag_log ("LocalZombies: " +str(dayz_spawnZombies) + "/" +str(dayz_maxLocalZombies));
	diag_log ("GlobalZombies: " +str(dayz_CurrentZombies) + "/" +str(dayz_maxGlobalZombies));
	diag_log ("dayz_maxCurrentZeds: " +str(dayz_maxCurrentZeds) + "/" +str(dayz_maxZeds));
};

_nearby = _position nearObjects ["building",_radius];
_nearbyCount = count _nearby;
if (_nearbyCount < 1) exitwith 
{
	if ((dayz_spawnZombies < _maxWildZombies) and !_inVehicle)  then {
		[_position] call wild_spawnZombies;
	};
};

{
	_type = typeOf _x;
	_config = 		configFile >> "CfgBuildingLoot" >> _type;
	if (DZE_MissionLootTable) then {
		_config = missionConfigFile >> "CfgBuildingLoot" >> _type;
	};
	_canLoot = 		isClass (_config);
	
	if(_canLoot) then {

		_dis = _x distance player;

		//Loot
		if ((_dis < 120) and (_dis > 30) and !_inVehicle) then {
			_looted = (_x getVariable ["looted",-0.1]);
			_cleared = (_x getVariable ["cleared",true]);
			_dateNow = (DateToNumber date);
			_age = (_dateNow - _looted) * 525948;
			//diag_log ("SPAWN LOOT: " + _type + " Building is " + str(_age) + " old" );
			if ((_age > DZE_LootSpawnTimer) and (!_cleared)) then {
				_nearByObj = nearestObjects [(getPosATL _x), ["WeaponHolder","WeaponHolderBase"],((sizeOf _type)+5)];
				{deleteVehicle _x} forEach _nearByObj;
				_x setVariable ["cleared",true,true];
				_x setVariable ["looted",_dateNow,true];
			};
			if ((_age > DZE_LootSpawnTimer) and (_cleared)) then {
				//Register
				_x setVariable ["looted",_dateNow,true];
				//cleanup
				_handle = [_x] spawn building_spawnLoot;
				waitUntil{scriptDone _handle};
			};
		};

		// do not spawn zeds if player is moving faster then 10kmh
		if (!_onTheMove) then {
			//Zeds
			if ((time - dayz_spawnWait) > dayz_spawnDelay) then {
				if (dayz_maxCurrentZeds < dayz_maxZeds) then {
					if (dayz_CurrentZombies < dayz_maxGlobalZombies) then {
						if (dayz_spawnZombies < dayz_maxLocalZombies) then {
								//[_radius, _position, _inVehicle, _dateNow, _age, _locationstypes, _nearestCity, _maxZombies] call player_spawnzedCheck;
								_zombied = (_x getVariable ["zombieSpawn",-0.1]);
								_dateNow = (DateToNumber date);
								_age = (_dateNow - _zombied) * 525948;
								if (_age > 3) then {
									_x setVariable ["zombieSpawn",_dateNow,true];
									[_x] call building_spawnZombies;
								};
						} else {
							dayz_spawnWait = time;
						};
					};
				};
			};
		};
	};
} forEach _nearby;