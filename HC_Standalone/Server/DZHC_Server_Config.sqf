/* Headless Client Framework for Arma 2 OA 
	By: [GSG] Az
	Licence: This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link: https://github.com/azmodii/DZHC
*/

/*
[
	HC;			| as Code;		Code to run for override
	Override;	| as Code;		Original code to override
	type; 		| as Integer; 	1 = call, 2 = spawn, 3 = execVM, 4 = compile, 5 = call compile, 6 = spawn compile, 7 = call compile preprocessfile, 8 = call compile preprocessfilelinenumbers 
	hasArgs;	| as Boolean; 	If true it will pass arguments
	Args;		| as Array;		Arguments to pass BOTH HC and Override
	isServer	| as Boolean;	If false, it must be a client override
	Priority	| as Integer;	10 = Greatest, 1 = Lowest, 0 = Async
]
*/
DZHC_Server_Overrides = [
	["HC\DQS\AI\AI_Init.sqf","DQS\Modules\AI\AI_Init.sqf",3,false,[],true,10]
];
