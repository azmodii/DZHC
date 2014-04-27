waituntil {!isnil "bis_fnc_init"};

// Server variables
DQS_AH_PV_LIST = [];

/* Credits to Dami, just made this more secure */
"DQS_OBJ_DEPLOY" addPublicVariableEventHandler {
	private ["_array","_obj","_player","_pos","_key","_check"];
	_array = _this select 1;
	_obj = _array select 0;
	_player = _array select 1;
	_pos = _array select 2;
	_key = _player getVariable "DQS_AH_PV";
	diag_log format["Key = %1",_key];
	_check = (_key in DQS_AH_PV_LIST);
	/* if (_check) then { */
		_object = _obj createVehicle _pos;
		if (!isNil "dayz_serverObjectMonitor") then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];};
		if (!isNil "PVDZE_serverObjectMonitor") then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];};
		_object setVariable ["ObjectID", "1", true];
		_object setVariable ["ObjectUID", "1", true];
		_object setVariable ["Deployed", true, true];
		_object setVariable ["PlayerUID", (getPlayerUID _player),true];
		diag_log format ["DQS DEPLOY LOG: %1 spawned a %2 at %3.", name _player,_obj,mapGridPosition _pos];
	/* } else {
		_log = format ["Unqualified DQS Client: %1 tried to spawn %2 at %3. UID: %4", name _player,_obj,mapGridPosition _pos,getPlayerUID _player];
		diag_log (_log);
		DQS_AH_KICK = [format["%1",getPlayerUID _player],format["%1",_log]];
		publicVariableServer "DQS_AH_KICK";
	}; */
};

/* Credits to infistar for random PV variable */
"DQS_AH_HANDLER" addPublicVariableEventHandler {
	private ["_player","_gen"];
	_player = _this select 0;
	_request = _this select 1;
	if (_request == 0) then {
		_arr = ["2","E","X","a","4","9","F","8","7","7","o","P","m","T","I","v","K","R","r","a","P","1","2","6","p","b","E","X","1","d"];
		_gen = "DQS_";
		for "_i" from 1 to 7 do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
		_player setVariable ["DQS_AH_PV",_gen,true];
		DQS_AH_PV_LIST set [(count DQS_AH_PV_LIST),_gen];
		DQS_AH_LOG = [format["%1",getPlayerUID _player],format["%2",_gen]];
		publicVariableServer "DQS_AH_LOG";
	};
};

DQS_Trader_A1_EH = {
	/* if (!DQS_Trigger_A1) then {
	// Spawn groups

	[[6575.5259, 14038.556, 3.0517578e-005],2,1,"Random",3,"","Bandit2_DZ","Random"] call spawn_group;
	[[6575.6055, 14191.59, 0.00012207031],2,1,"Random",3,"","Bandit2_DZ","Random"] call spawn_group;
	[[6412.001, 14172.692, 0.00018310547],2,1,"Random",3,"","Bandit2_DZ","Random"] call spawn_group;
	[[6293.4492, 14116.3, 3.0517578e-005],2,1,"Random",3,"","Bandit2_DZ","Random"] call spawn_group;
	[[6293.8145, 13990.979, -6.1035156e-005],2,1,"Random",3,"","Bandit2_DZ","Random"] call spawn_group;

	// Spawn M2

	[[[6543.5576, 14018.963, 0.01],[6622.0391, 14018.893, -9.1552734e-005],[6631.8901, 14092.31, -3.0517578e-005],[6534.5913, 14110.674, 0],[6484.6201, 14107.718, 6.1035156e-005]],"M2StaticMG",0.5,"USMC_LHD_Crew_Blue",1,2,"","Random"] call spawn_static;
	[[[6508.2856, 14081.643, 3.0517578e-005],[6471.647, 14101.308, 0],[6341.5693, 13996.437, 19.287022],[6284.4351, 14061.57, 12.621706],[6324.04, 14051.322, 4.0327954],[6317.5571, 14151.118, 5.8393817]],"M2StaticMG",0.5,"USMC_LHD_Crew_Blue",1,2,"","Random"] call spawn_static;
	[[[6263.728, 14115.519, -3.0517578e-005],[6449.8984, 14185.4, 3.0517578e-005],[6365.2329, 14131.147, 6.1035156e-005],[6456.2471, 14135.813, 3.5407567],[6579.3013, 14222.722, 4.5160584],[6377.8052, 14204.144, 4.8606424]],"M2StaticMG",0.5,"USMC_LHD_Crew_Blue",1,2,"","Random"] call spawn_static;

	// Spawn AA

	[[[6487.9229, 13962.139, 0.00015258789],[6599.2334, 14199.156, -0.00012207031],[6412.5986, 14192.748, 0.00012207031]],"Igla_AA_pod_TK_EP1",0.5,"USMC_LHD_Crew_Blue",1,2,"","Random"] call spawn_static;
	[[[6285.7524, 14180.491, 3.0517578e-005],[6334.021, 14074.436, -3.0517578e-005],[6315.8589, 13941.483, 0.0002746582]],"Igla_AA_pod_TK_EP1",0.5,"USMC_LHD_Crew_Blue",1,2,"","Random"] call spawn_static;
	};
	DQS_Trigger_A1 = true; */
};

"DQS_Trader_A1_Spawn" addPublicVariableEventHandler DQS_Trader_A1_EH;