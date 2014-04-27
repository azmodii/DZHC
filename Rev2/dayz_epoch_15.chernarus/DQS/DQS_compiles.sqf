/* 	
	Please feel free to reuse the functions here (Even if thats all you came for).
	Just make sure you credit me for my work :) 
	[GSG] Az from www.gsgaming.com.au
*/

if (!isDedicated) then { 
	/* DQS Modules */
	DQS_BuildObj = 			compile preprocessFileLineNumbers (format["%1\Modules\CC\DQS_CC_Build.sqf",DQS_FilePath]);
	DQS_CraftObj = 			compile preprocessFileLineNumbers (format["%1\Modules\CC\DQS_CC_Craft.sqf",DQS_FilePath]);
	DQS_SZ_Handler = 		compile preprocessFileLineNumbers (format["%1\Modules\SZ\DQS_SZ_Handler.sqf",DQS_FilePath]);
	/* Overrides */
	fnc_usec_selfActions =	compile preprocessFileLineNumbers (format["%1\Overrides\fn_selfActions.sqf",DQS_FilePath]);	
	player_selectSlot = 	compile preprocessFileLineNumbers (format["%1\Overrides\ui_selectSlot.sqf",DQS_FilePath]);
	fn_gearMenuChecks =    	compile preprocessFileLineNumbers (format["%1\Overrides\fn_gearMenuChecks.sqf",DQS_FilePath]); 
};

/* 	Execute like so: _var = ["TYPE",["ITEM","ITEM"]] call DQS_fnc_hasItem; returns 0 if player has item, 1 if not. */
DQS_fnc_hasItem = {
	private ["_type","_items","_fnc_result"];
	_type = _this select 0;
	_items = _this select 1;
	_fnc_result = 0;
	diag_log format["DQS_fnc_hasItem: _items = %1",_items];
	switch (_type) do
	{
		case "ITEM":
		{
			{
				_itemType = _x;
				if (!(_itemType in items player)) exitWith {
					_fnc_result = 1;
				};
			} forEach _items;
		};
		case "MAG":
		{
			{
				_magType = _x select 0;
				_magNeeded = _x select 1;
				_magCount = {_x == _magType} count magazines player;
				if (_magCount < _magNeeded) exitWith {
					_fnc_result = 1;
				};
			} forEach _items;
		};
	};
	_fnc_result;
};

/* Execute like so: _var = [["ObjectClass","ObjectClass"],Distance] call DQS_fnc_objNear; returns 0 if near, 1 if not. */
DQS_fnc_objNear = {
	private ["_reqObj","_distance","_fnc_result"];
	_reqObj = _this select 0;
	_distance = _this select 1;
	diag_log format["DQS_fnc_objNear: _reqObj = %1 | _distance = %2",_reqObj,_distance];
	_fnc_result = 0;
	_isNear = count (nearestObjects [player, _reqObj, _distance]);
	if(_isNear == 0) then {
		_fnc_result = 1;
	};
	_fnc_result;
};

/* 	Execute like so: _var = [player,distance] call DQS_fnc_fireNear; returns 0 if near, 1 if not.
	Changed getPosATL to getPos to avoid "Object xxx not found" RPT spam. */
DQS_fnc_fireNear = {
	private ["_player","_distance","_fnc_result"];
	_player = _this select 0;
	_distance = _this select 1;
	_fnc_result = 0;
	diag_log format["DQS_fnc_fireNear: _distance = %2",_distance];
	_isNear = {inflamed _x} count (getPos _player nearObjects _distance);
	if(_isNear == 0) then {
		_fnc_result = 1;
	};
	_fnc_result;
};

/* Dont use this. It's built for a specific job :) */
DQS_CC_getString = {
	private ["_type","_reqItems","_fnc_result","_oName","_separator"];
	_type = _this select 0;
	_reqItems = _this select 1;
	_fnc_result = "";
	diag_log format["DQS_CC_getString: _type = %1 | _reqItems = %2",_type,_reqItems];
	_loop = 0;
	switch (_type) do
	{
		case "CC_ItemCheck":
		{
			{
				_oName = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
				_separator = "";
				if (_loop > 0) then {_separator = ", ";};
				_loop = _loop + 1;
				_fnc_result = _fnc_result + format["%2a %1",_oName,_separator];
			} forEach _reqItems;
		};
		case "CC_MagCheck":
		{
			{
				_oName = getText (configFile >> "cfgMagazines" >> _x select 0 >> "displayName");
				_separator = "";
				if (_loop > 0) then {_separator = ", ";};
				_loop = _loop + 1;
				_magNeeded = _x select 1;
				_fnc_result = _fnc_result + format["%2%3 x %1",_oName,_separator,_magNeeded];
			} forEach _reqItems;
		};
		case "CC_ObjCheck":
		{
			{
				_oName = getText (configFile >> "cfgVehicles" >> _x >> "displayName");
				_separator = "";
				if (_loop > 0) then {_separator = ", ";};
				_loop = _loop + 1;
				_fnc_result = _fnc_result + format["%2a %1",_oName,_separator];
			} forEach _reqItems;
		};
	};
	_fnc_result;
};

/* Execute like so: _var = [item] call DQS_fnc_getType; Returns "MAG" for magazines, "WEAPON" for weapons, "VEHICLE" for vehicles. */
DQS_fnc_getType = {
	private ["_item","_fnc_result"];
	_item = _this select 0;
	diag_log format["DQS_fnc_getType: _item = %1",_item];
	_fnc_result = "NIL";
	if (isClass (configFile >> "cfgMagazines" >> _item)) exitWith {_fnc_result = "MAG";_fnc_result;};
	if (isClass (configFile >> "cfgWeapons" >> _item)) exitWith {_fnc_result = "WEAPON";_fnc_result;};
	if (isClass (configFile >> "cfgVehicles" >> _item)) exitWith {_fnc_result = "VEHICLE";_fnc_result;};
	_fnc_result;
};

/* BIS function did not remove IED's. Use like so: [player,[Item,Quantity]] call DQS_fnc_invRemove; */
DQS_fnc_invRemove = {
	private ["_player","_cost"];
	_player = _this select 0;
	_cost = _this select 1;
	{
		_magType = _x select 0;
		_magNeeded = _x select 1;
		for "_k" from 0 to (_magNeeded - 1) do
		{
			_player removeMagazine _magType;
		};
	} forEach _cost;
};

/* Again, dont use this. Was built for a specific porpoise (And he loved it more than fish!) */
DQS_CC_getActions = {
	private ["_item","_DQS_CC_Config","_DQS_CC_Item","_DQS_Handler","_DQS_CC_Actions","_DQS_CC_TempActions","_ccConfig","_ccHandler","_ccActionText","_ccText","_ccDesc","_ccReq","_ccCost","_ccOffset","_ccArgs","_ccObj"];
	_item = _this select 0;
	_DQS_CC_Config = missionConfigFile >> "DQS_CC_Config";
	_DQS_CC_Item = _DQS_CC_Config >> _item;
	_DQS_Handler = getText (_DQS_CC_Item >> "Handler");
	_DQS_CC_Actions = [];
	diag_log format["DQS_CC_Getactions: _item = %1 | _DQS_Handler = %2 | _DQS_CC_Actions = %3",_item,_DQS_Handler,_DQS_CC_Actions];
	switch (_DQS_Handler) do
	{
		case "BUILD": 
		{
			_DQS_CC_TempActions = [] + getArray (_DQS_CC_Item >> "Options");
			{
				diag_log "CASE is BUILD";
				_ccConfig = _DQS_CC_Config >> _DQS_Handler >> _x;
				_ccHandler = getText (_DQS_CC_Config >> _DQS_Handler >> "Handler");
				_ccActionText = getText (_DQS_CC_Config >> _DQS_Handler >> "ActionText");
				_ccText = getText (_ccConfig >> "Description");
				_ccDesc = format ["%1 %2",_ccActionText,_ccText];
				_ccReq = [] + getArray (_ccConfig >> "Requirement");
				_ccCost = [] + getArray (_ccConfig >> "Cost");
				_ccOffset = [] + getArray (_ccConfig >> "Offset");
				_ccArgs = [_x,_ccReq,_ccCost,_ccOffset];
				diag_log format ["_ccConfig: %1 | _ccHandler: %2 | _ccActionText: %3 | _ccText: %4 | _ccDesc: %5 | _ccReq: %6 | _ccCost: %7 | _ccOffset: %8 | _ccArgs: %9",_ccConfig,_ccHandler,_ccActionText,_ccText,_ccDesc,_ccReq,_ccCost,_ccOffset,_ccArgs];
				_DQS_CC_Actions set [(count _DQS_CC_Actions), [_ccArgs,_ccHandler,_ccDesc]];
			} forEach _DQS_CC_TempActions;
			_DQS_CC_TempActions = [];
		};
		case "WEAPON":
		{
			_DQS_CC_TempActions = [] + getArray (_DQS_CC_Item >> "Attach");
			{
				diag_log "CASE is WEAPON";
				_ccConfig = _DQS_CC_Config >> _DQS_Handler >> (_x select 0);
				_ccObj = [] + getArray (_ccConfig >> "ObjectNeeded");
				_ccReq = [] + getArray (_ccConfig >> "Requirement");
				_ccCost = [] + getArray (_ccConfig >> "Cost");
				_ccArgs = [_ccReq,_ccCost,(_x select 1),_item,_ccObj];
				_ccHandler = getText (_DQS_CC_Config >> _DQS_Handler >> "Handler");
				_ccActionText = "Attach";
				_ccText = getText (_ccConfig >> "Description");
				_ccDesc = format ["%1 %2",_ccActionText,_ccText];
				diag_log format ["_ccConfig: %1 | _ccHandler: %2 | _ccActionText: %3 | _ccText: %4 | _ccDesc: %5 | _ccReq: %6 | _ccCost: %7 | _ccOffset: %8 | _ccArgs: %9 | _ccObj: %10",_ccConfig,_ccHandler,_ccActionText,_ccText,_ccDesc,_ccReq,_ccCost,_ccOffset,_ccArgs,_ccObj];
				_DQS_CC_Actions set [(count _DQS_CC_Actions), [_ccArgs,_ccHandler,_ccDesc]];
			} forEach _DQS_CC_TempActions;
			_DQS_CC_TempActions = [] + getArray (_DQS_CC_Item >> "Detach");
			{
				_ccConfig = _DQS_CC_Config >> _DQS_Handler >> (_x select 0);
				_ccObj = [] + getArray (_ccConfig >> "ObjectNeeded");
				_ccReq = [] + getArray (_ccConfig >> "Requirement");
				_ccCost = [] + getArray (_ccConfig >> "Cost");
				_ccArgs = [_ccReq,_ccCost,(_x select 1),_item,_ccObj];
				_ccHandler = getText (_DQS_CC_Config >> _DQS_Handler >> "Handler");
				_ccActionText = "Detach";
				_ccText = getText (_DQS_CC_Config >> _DQS_Handler >> (_x select 0) >> "Description");
				_ccDesc = format ["%1 %2",_ccActionText,_ccText];
				diag_log format ["_ccConfig: %1 | _ccHandler: %2 | _ccActionText: %3 | _ccText: %4 | _ccDesc: %5 | _ccReq: %6 | _ccCost: %7 | _ccOffset: %8 | _ccArgs: %9 | _ccObj: %10",_ccConfig,_ccHandler,_ccActionText,_ccText,_ccDesc,_ccReq,_ccCost,_ccOffset,_ccArgs,_ccObj];
				_DQS_CC_Actions set [(count _DQS_CC_Actions), [_ccArgs,_ccHandler,_ccDesc]];
			} forEach _DQS_CC_TempActions;
			_DQS_CC_TempActions = [];
		};
		case "CRAFT":
		{
			_DQS_CC_TempActions = [] + getArray (_DQS_CC_Item >> "Options");
			diag_log _DQS_CC_TempActions;
			{
				diag_log "CASE is CRAFT";
				_ccConfig = _DQS_CC_Config >> _DQS_Handler >> _x;
				_ccHandler = getText (_DQS_CC_Config >> _DQS_Handler >> "Handler");
				_ccActionText = getText (_DQS_CC_Config >> _DQS_Handler >> "ActionText");
				_ccText = getText (_ccConfig >> "Description");
				_ccDesc = format ["%1 %2",_ccActionText,_ccText];
				_ccReq = [] + getArray (_ccConfig >> "Requirement");
				_ccCost = [] + getArray (_ccConfig >> "Cost");
				_ccObj = [] + getArray (_ccConfig >> "ObjectNeeded");
				_ccArgs = [_ccReq,_ccCost,_x,"",_ccObj];
				diag_log format ["_ccConfig: %1 | _ccHandler: %2 | _ccActionText: %3 | _ccText: %4 | _ccDesc: %5 | _ccReq: %6 | _ccCost: %7 | _ccOffset: %8 | _ccArgs: %9 | _ccObj: %10",_ccConfig,_ccHandler,_ccActionText,_ccText,_ccDesc,_ccReq,_ccCost,_ccOffset,_ccArgs,_ccObj];
				_DQS_CC_Actions set [(count _DQS_CC_Actions), [_ccArgs,_ccHandler,_ccDesc]];
			} forEach _DQS_CC_TempActions;
			_DQS_CC_TempActions = [];
		};
		case "VEHICLE":
		{
			_DQS_CC_TempActions = [] + getArray (_DQS_CC_Item >> "Options");
			diag_log _DQS_CC_TempActions;
			{
				diag_log "CASE is CRAFT";
				_ccConfig = _DQS_CC_Config >> _DQS_Handler >> _x;
				_ccHandler = getText (_DQS_CC_Config >> _DQS_Handler >> "Handler");
				_ccActionText = getText (_DQS_CC_Config >> _DQS_Handler >> "ActionText");
				_ccText = getText (_ccConfig >> "Description");
				_ccDesc = format ["%1 %2",_ccActionText,_ccText];
				_ccReq = [] + getArray (_ccConfig >> "Requirement");
				_ccCost = [] + getArray (_ccConfig >> "Cost");
				_ccObj = [] + getArray (_ccConfig >> "ObjectNeeded");
				_ccArgs = [_ccReq,_ccCost,_x,"",_ccObj];
				diag_log format ["_ccConfig: %1 | _ccHandler: %2 | _ccActionText: %3 | _ccText: %4 | _ccDesc: %5 | _ccReq: %6 | _ccCost: %7 | _ccOffset: %8 | _ccArgs: %9 | _ccObj: %10",_ccConfig,_ccHandler,_ccActionText,_ccText,_ccDesc,_ccReq,_ccCost,_ccOffset,_ccArgs,_ccObj];
				_DQS_CC_Actions set [(count _DQS_CC_Actions), [_ccArgs,_ccHandler,_ccDesc]];
			} forEach _DQS_CC_TempActions;
			_DQS_CC_TempActions = [];
		};
	};
	_DQS_CC_Actions;
};

/* Server side execution */
if (isServer) then {
		call compile preprocessFileLineNumbers "\z\addons\dayz_server\DQS\DQS_server_functions.sqf";
};