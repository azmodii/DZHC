/* Headless Client Framework for Arma 2 OA 
	By: 			[GSG] Az
	Licence: 		This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link:	https://github.com/azmodii/DZHC
*/

/* This script should be executed in your init.sqf as follows;

	if (!isDedicated && !hasInterface) then {
		execVM "DZHC\DZHC_Init.sqf";
	};
	
*/

if (!isDedicated && !hasInterface) then {
	_nil = [] execVM "DZHC\Buildings\a1.sqf";
	_nil1 = [] execVM "DZHC\Buildings\kamenka.sqf";
	_nil2 = [] execVM "DZHC\Buildings\capg.sqf";
	_nil3 = [] execVM "DZHC\Buildings\novylug.sqf";
	_nil4 = [] execVM "DZHC\Buildings\az\bar_prig.sqf";
	_nil5 = [] execVM "DZHC\Buildings\az\bar_kamenka.sqf";
	_nil6 = [] execVM "DZHC\Buildings\az\dolina_castle.sqf";
	_nil7 = [] execVM "DZHC\Buildings\az\balota_industrial.sqf";
	_nil8 = [] execVM "DZHC\Buildings\az\devils.sqf";
	_nil9 = [] execVM "DZHC\Buildings\pom\pombalota.sqf";
	_nil0 = [] execVM "DZHC\Buildings\pom\neaf.sqf";
	_nil11 = [] execVM "DZHC\Buildings\pom\nwaf.sqf";
	_nil12 = [] execVM "DZHC\Buildings\pom\elecktro.sqf";

	waitUntil {!isNull player};
	[] spawn {
		while {true} do
		{
			DZHC_Server_Heartbeat = player;
			publicVariableServer "DZHC_Server_Heartbeat";
			sleep 3;
		};
	};
	[] spawn {
		private ["_count"];
		_count = 0;
		if (DZHC_Diag_FPS) then {
			diag_log "DZHC: DiagFPS is ON! Starting FPS diagnostic messages";
			while {true} do {
				_count = _count + 1;
				if (_count > 300) then {
					diag_log format["DEBUG FPS : %1", diag_fps];
					_count = 0;
				};
				sleep 1;
			};
		};
	};
};
