/* Headless Client Framework for Arma 2 OA 
	By: 			[GSG] Az
	Licence: 		This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link:	https://github.com/azmodii/DZHC
*/
DZHC_Side = ["CIV"];		/* The side of the HC slot */
DZHC_Command_Active = false;

/* List of compiles that the HC overrides */
DZHC_OverrideList = [];
/* List of scripts that the HC overrides */
DZHC_Standalone_Overrides = [
	["DQS\Modules\AI\HC\DQS_AI_Init.sqf",["server","WAI\Init.sqf"]]
];

/* No touchy touchy from now on */
if (isNil "DZHC_Command_Active") then {DZHC_Command_Active = false;};
DZHC_Overrides = [];		
DZHC_KICK = [];














