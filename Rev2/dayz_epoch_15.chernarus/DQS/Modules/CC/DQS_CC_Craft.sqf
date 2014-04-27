private ["_args","_item","_itemRem","_cost","_magType","_magNeeded"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater = 	dayz_isSwimming;
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

if (_isWater) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_26", "PLAIN DOWN"];};
if (_inVehicle) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"];};
if (_onLadder) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_21", "PLAIN DOWN"];};
if (player getVariable["combattimeout", 0] >= time) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_43"), "PLAIN DOWN"];};

_args = _this;
_req = _args select 0;
_cost = _args select 1;
_item = _args select 2;
_itemRem = _args select 3;
_objNeeded = _args select 4;
_type = [_item] call DQS_fnc_getType;

// Now checking objects are near
_hasObj = [_objNeeded,DQS_CC_MinDistance] call DQS_fnc_objNear;
if (_hasObj > 0) exitWith {
	_string = ["CC_ObjCheck",_objNeeded] call DQS_CC_getString;
	_stringFailed = format["You cannot do this. You need %1 within %2m.",_string,DQS_CC_MinDistance];
	titleText [_stringFailed,"PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;
	systemChat ("Crafting System: "+str _stringFailed+"");
	DZE_ActionInProgress = false;
};

// Now checking we have the items
_hasItem = ["ITEM",_req] call DQS_fnc_hasItem;
if (_hasItem > 0) exitWith {
	_string = ["CC_ItemCheck",_req] call DQS_CC_getString;
	_stringFailed = format["You cannot do this. You need %1 in your inventory.",_string];
	titleText [_stringFailed,"PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;
	systemChat ("Crafting System: "+str _stringFailed+"");
	DZE_ActionInProgress = false;
};

// Now checking we have the consumables
_hasMag = ["MAG",_cost] call DQS_fnc_hasItem;
if (_hasMag > 0) exitWith {
	_string = ["CC_MagCheck",_cost] call DQS_CC_getString;
	_stringFailed = format["You cannot do this. You need %1 in your inventory.",_string];
	titleText [_stringFailed,"PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;
	systemChat ("Crafting System: "+str _stringFailed+"");
	DZE_ActionInProgress = false;
};
diag_log format["DQS_CC_Craft: _type = %1 | _checks = %2 and %3",_type,_hasItem,_hasMag];
if ((_hasObj < 1) && (_hasItem < 1) && (_hasMag < 1)) then {
	switch (_type) do 
	{
		case "MAG":
		{
			player playActionNow "Medic";
			if (!(_itemRem == "")) then {player removeWeapon _itemRem;};
			r_interrupt = false;
			[player,_cost] call DQS_fnc_invRemove;
			[player,DQS_CC_CraftingSound,0,false,DQS_CC_AlertDistance] call dayz_zombieSpeak;
			[player,DQS_CC_AlertDistance,true,(getPosATL player)] spawn player_alertZombies;
			sleep 6;
			player addMagazine _item;
			_oName = getText (configFile >> "cfgMagazines" >> _item >> "displayName");
			titleText [format["You have crafted a %1.",_oName], "PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;
			DZE_ActionInProgress = false;
		};
		case "WEAPON":
		{
			r_interrupt = false;
			player playActionNow "Medic";
			if (!(_itemRem == "")) then {player removeWeapon _itemRem;};
			[player,_cost] call DQS_fnc_invRemove;
			[player,DQS_CC_CraftingSound,0,false,DQS_CC_AlertDistance] call dayz_zombieSpeak;
			[player,DQS_CC_AlertDistance,true,(getPosATL player)] spawn player_alertZombies;
			sleep 6;
			player addWeapon _item;
			_oName = getText (configFile >> "cfgWeapons" >> _item >> "displayName");
			titleText [format["You have crafted a %1.",_oName], "PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;
			DZE_ActionInProgress = false;
		};
		case "VEHICLE":
		{
			private ["_pos"];
			r_interrupt = false;
			player playActionNow "Medic";
			if (!(_itemRem == "")) then {player removeWeapon _itemRem;};
			[player,_cost] call DQS_fnc_invRemove;
			[player,DQS_CC_CraftingSound,0,false,DQS_CC_AlertDistance] call dayz_zombieSpeak;
			[player,DQS_CC_AlertDistance,true,(getPosATL player)] spawn player_alertZombies;
			sleep 6;
			_dir = getdir (vehicle player);
			_pos = getPos (vehicle player);
			_pos = [(_pos select 0)+4*sin(_dir),(_pos select 1)+4*cos(_dir),0];
			DQS_OBJ_DEPLOY = [_item,player,_pos];
			publicVariableServer "DQS_OBJ_DEPLOY";
			_oName = getText (configFile >> "cfgVehicles" >> _item >> "displayName");
			titleText [format["You have crafted a %1.",_oName], "PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;
			DZE_ActionInProgress = false;
		};
	};
} else {
	_stringFailed = format["ERROR - Please let an admin know this error code: CC_Craft FAILED Item/Mag check."];
	titleText [_stringFailed,"PLAIN DOWN"]; titleFadeOut DQS_UI_TitleTextFade;
	systemChat ("Crafting System: "+str _stringFailed+"");
	DZE_ActionInProgress = false;
};

DZE_ActionInProgress = false;