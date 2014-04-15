/* Headless Client Framework for Arma 2 OA 
	By: 			[GSG] Az
	Licence: 		This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link:	https://github.com/azmodii/DZHC
*/

DZHC_inProgress_Override = false;

if (isServer) then {
	DZHC_Server_Automation = true;
};

if (!isDedicated && hasInterface) then {
	DZHC_Client_Overrides = [];
	DZHC_Client_Overrides_Active = [];
};

if (!isDedicated && !hasInterface) then {
	DZHC_HC_Active = false;
	DZHC_Local_Tasks = [];
};