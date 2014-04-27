/* DZHC init.sqf */

waitUntil {!isNull player};
DZHC_Server_Request = [2,owner player];
publicVariableServer "DZHC_Server_Request";