/* Headless Client Framework for Arma 2 OA 
	By: [GSG] Az
	Licence: This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link: https://github.com/azmodii/DZHC
*/
waitUntil {!isNull player};
if (!isDedicated && !hasInterface) then {
	call DZHC_SlotCheck;
	spawn DZHC_Heartbeat;
	call DZHC_HC_StartHC;
};













