/* Headless Client Framework for Arma 2 OA 
	By: [GSG] Az
	Licence: This software is licensed under the Dayz Share Alike Licence
	License Link:	https://www.bistudio.com/english/community/licenses/dayz-mod-license-share-alike
	Source Link: https://github.com/azmodii/DZHC
*/


// HC Functions
if (!isDedicated && !hasInterface) then {
	
	DZHC_HC_Heartbeat = {
		while {true} do
		{
			DZHC_Server_Heartbeat = player;
			publicVariableServer "DZHC_Server_Heartbeat";
			sleep 3;
		};
	};
	
	DZHC_HC_Activate = {
		DZHC_HCActive = true;
	};
	
	DZHC_Local_DeactivateHC = {
		DZHCActive = false;
	};
	// HC EH
	"DZHC_Local_ActivateHC" addPublicVariableEventHandler DZHC_HC_Activate;
	"DZHC_Local_DeactivateHC" addPublicVariableEventHandler DZHC_HC_Deactivate;
};

