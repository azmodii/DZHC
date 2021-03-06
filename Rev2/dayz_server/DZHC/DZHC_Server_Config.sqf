/* Headless Client Framework for Arma 2 OA 
	By: 			[GSG] Az
	Licence: 		This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link:	https://github.com/azmodii/DZHC
*/


/* Guide to overriding scripts */
/*	In each script, whenever you execute a script,
	make sure to add the following;
	
	to the script/variable executed: 	_handle = execVM etc..
				then
	[_handle,"Variable/Override Name"] call DZHC_AddOverride;			
*/

DZHC_Server_Automation = true;
DZHC_Server_Diagnostics_Enabled = true;
DZHC_Variable_Diagnostics_Network = true;
DZHC_Variable_NetworkTimeout = 10;			/* as Integer;	Default 10;		Timeout period for network congestion */

/*
[
	-HC-
	0 - Type; 		| as Integer; 	1 = call, 2 = spawn, 3 = execVM, 4 = compile, 5 = call compile, 6 = spawn compile, 7 = call compile preprocessfile, 8 = call compile preprocessfilelinenumbers
	1 - Compile;	| as Code;		Code to run for override
	2 - Args;		| as Array;		Arguments to pass BOTH HC and Override
	
	-Locality-
	3 - Override;	| as Code;		Original code to override.
	4 - Terminate;	| as Array;		List of threads to terminate if running locally
	
	-Options-
	5 - Suspend;	| as Boolean;	Can this process be suspended
	6 - isServer;	| as Boolean;	If false, it must be a client override
	7 - Priority;	| as Integer;	10 = Greatest, 1 = Lowest
	8 - isPath;		| as Boolean;	Is this a path to a script, or a variable
	
	-ID-
	9 - Task ID;	| as String;	A unique ID to represent this task
]

*/
DZHC_Server_HCHandoffs = [
	[3,"DZHC\Overrides\WAI\Init.sqf",[],"\z\addons\dayz_server\WAI\init.sqf",[],false,true,10,true,"WAI"],
	[3,"DZHC\Overrides\Zeds\Zombie_Headless_Init.sqf",[],"player_spawnCheck",[],false,false,10,true,"Zeds"]
];
