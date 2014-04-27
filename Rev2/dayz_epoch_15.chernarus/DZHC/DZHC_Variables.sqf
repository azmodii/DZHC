/* Headless Client Framework for Arma 2 OA 
	By: 			[GSG] Az
	Licence: 		This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link:	https://github.com/azmodii/DZHC
*/

DZHC_Client_hasTask = false;
DZHC_Client_Override = false;
DZHC_Client_Responded = false;
DZHC_Client_Execute = false;
DZHC_Local_Query = false;
DZHC_Local_AssignTask = false;
DZHC_Server_Heartbeat = false;
DZHC_inProgress_Override = false;

if (isServer) then {
	DZHC_Client_Failed = false;
	DZHC_Server_Connected = [];
	DZHC_Server_HCHandoffs_Active = [];
	DZHC_Server_Queue = [];
	DZHC_Server_Monitor_HB = false;
	DZHC_Monitored_Tasks = [];
	DZHC_Monitor_Task_Active = false;
	DZHC_Monitored_Threads = [];
	DZHC_Server_Overrides = [[],[]];
	DZHC_Server_JIP_Tasks = [];
};

if (!isDedicated && hasInterface) then {
	DZHC_Client_Overrides = [];
	DZHC_Client_Overrides_Active = [];
};

if (!isDedicated && !hasInterface) then {
	if (!isNil "DZHC_Diag_FPS") then {DZHC_Diag_FPS = true;};
	DZHC_HC_Debug = true;
	DZHC_HC_Active = false;
	DZHC_Local_Tasks = [];
	DZHC_HC_Overrides = [];
};