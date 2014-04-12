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
	
	DZHC_HC_Deactivate = {
		DZHCActive = false;
	};
	DZHC_HC_Process_Query = {
		_query = _this select 1;
		if (_query == 0) then {if((count DZHC_Local_Tasks) < 1) then {DZHC_Client_hasTask = false;} else {DZHC_Client_hasTask = true;}; publicVariableServer "DZHC_Client_hasTask"; DZHC_Client_Responded = true; publicVariableServer "DZHC_Client_Responded";};
	};
	
	DZHC_HC_AssignTask = {
	
	};
	
	// HC EH
	"DZHC_Local_ActivateHC" addPublicVariableEventHandler DZHC_HC_Activate;
	"DZHC_Local_DeactivateHC" addPublicVariableEventHandler DZHC_HC_Deactivate;
	"DZHC_Local_Query" addPublicVariableEventHandler DZHC_HC_Process_Query;
	"DZHC_Local_AssignTask" addPublicVariableEventHandler DZHC_HC_AssignTask;
};

// Client Functions
if (!isDedicated && hasInterface) then {

};

