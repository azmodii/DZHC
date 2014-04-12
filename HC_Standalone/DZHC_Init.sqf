/* Headless Client Framework for Arma 2 OA 
	By: [GSG] Az
	Licence: This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link: 	https://github.com/azmodii/DZHC
*/

waitUntil {!isNull player};
spawn DZHC_Local_Heartbeat;
waitUntil {!DZHC_HCActive};
DZHC_Server_HCMessage = format["HC ID %1 | Idle!",(owner player)]; 
waitUntil {DZHC_HCActive};
DZHC_Server_HCMessage = format["HC ID %1 | Online!",(owner player)]; 