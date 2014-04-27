/* Need to move most code to a new file and then call it from player spawn on players. */

private ["_type","_inVehicle","_dateNow","_maxWildZombies","_age","_radius","_position","_markerstr","_markerstr1","_markerstr2","_markerstr3","_nearByObj","_handle","_looted","_cleared","_zombied","_config","_canLoot","_dis","_players","_nearby","_nearbyCount","_onTheMove","_soundLimit"];
//_t1 = diag_tickTime;

_type = _this select 0;
_inVehicle = (vehicle player != player);
_onTheMove = (speed (vehicle player) > 10);
_dateNow = (DateToNumber date);
_maxWildZombies = 3;
_age = -1;
_radius = 200; 
_position = getPosATL player;

/* Add code to spawn on the HC 
	Credit to: Goober
	Link to: http://epochmod.com/forum/index.php?/topic/6329-working-dayz-epoch-headless-client-for-zed-spawn-and-fsm/
*/

	missionNamespace setvariable ["DZHC_HC_ZedHandoff_Client",
		[ _type, _inVehicle, _onTheMove, _dateNow, _maxWildZombies, _age, _radius, _position, player]];
	DZHC_Server_Request = [1,["Zeds","DZHC_HC_ZedHandoff_Client",DZHC_HC_ZedHandoff_Client]];
	publicVariableServer "DZHC_Server_Request";
	diag_log "DZHC Client: Sending spawncheck to server!";

// experiment with adding fly sounds locally for both zombies and players.
_soundLimit = 2;
{
	if (!alive _x) then {
		if (!(_x isKindOf "zZombie_Base")) then {
			[player,"flysound",1,true] call dayz_zombieSpeak;
			_soundLimit = _soundLimit - 1;
		};
	};
	if (_soundLimit == 0) exitWith {};
} foreach (nearestObjects [player, ["CAManBase"], 8]);

if ("ItemMap_Debug" in items player) then {
	deleteMarkerLocal "MaxZeds";
	deleteMarkerLocal "Counter";
	deleteMarkerLocal "Loot30";
	deleteMarkerLocal "Loot120";
	deleteMarkerLocal "Agro80";
	
	_markerstr = createMarkerLocal ["MaxZeds", _position];
	_markerstr setMarkerColorLocal "ColorYellow";
	_markerstr setMarkerShapeLocal "ELLIPSE";
	_markerstr setMarkerBrushLocal "Border";
	_markerstr setMarkerSizeLocal [_radius, _radius];

	_markerstr1 = createMarkerLocal ["Counter", _position];
	_markerstr1 setMarkerColorLocal "ColorRed";
	_markerstr1 setMarkerShapeLocal "ELLIPSE";
	_markerstr1 setMarkerBrushLocal "Border";
	_markerstr1 setMarkerSizeLocal [_radius+100, _radius+100];
	
	_markerstr2 = createMarkerLocal ["Agro80", _position];
	_markerstr2 setMarkerColorLocal "ColorRed";
	_markerstr2 setMarkerShapeLocal "ELLIPSE";
	_markerstr2 setMarkerBrushLocal "Border";
	_markerstr2 setMarkerSizeLocal [80, 80];

	_markerstr2 = createMarkerLocal ["Loot30", _position];
	_markerstr2 setMarkerColorLocal "ColorRed";
	_markerstr2 setMarkerShapeLocal "ELLIPSE";
	_markerstr2 setMarkerBrushLocal "Border";
	_markerstr2 setMarkerSizeLocal [30, 30];

	_markerstr3 = createMarkerLocal ["Loot120", _position];
	_markerstr3 setMarkerColorLocal "ColorBlue";
	_markerstr3 setMarkerShapeLocal "ELLIPSE";
	_markerstr3 setMarkerBrushLocal "Border";
	_markerstr3 setMarkerSizeLocal [120, 120];
};

