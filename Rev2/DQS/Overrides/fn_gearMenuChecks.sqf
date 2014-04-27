private ["_cTarget","_isOk","_display","_inVehicle"];
disableSerialization;
_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;
if(_inVehicle) then {_cTarget = (vehicle player);};

_isOk = false;
{
	if(!_isOk) then {
	_isOk = _cTarget isKindOf _x;
	};
} forEach ["LandVehicle","Air", "Ship"];

if((locked _cTarget) and _isOk and (((vehicle player) distance _cTarget) < 12)) then { 
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};

if (!canbuild and !_inVehicle and _isOk and (((vehicle player) distance _cTarget) < 12) and DQS_SZ_AntiTheft_Vehicle) then {
	if (DQS_SZ_Messages) then {titleText["\n\nYou may only access friendly players gear in this area.", "PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;};
	_display closeDisplay 1;
};
if (!canbuild and _cTarget isKindOf "Man" and alive _cTarget and (((vehicle player) distance _cTarget) < 12) and DQS_SZ_AntiTheft_Player) then {
	if (DQS_SZ_AntiTheft_FriendlyAccess) then {
		_ctOwnerID = _cTarget getVariable["CharacterID","0"];
		_friendlies	= player getVariable ["friendlyTo",[]];
		if(_ctOwnerID in _friendlies) then {} else {
			if (DQS_SZ_Messages) then {titleText["\n\nYou may only access friendly players gear in this area.", "PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;};
			_display closeDisplay 1;
		};
	} else {
		if (DQS_SZ_Messages) then {titleText["\n\nYou may only access friendly players gear in this area.", "PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;};
		_display closeDisplay 1;
	};
};


