custom_publish  = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\custom_publishVehicle.sqf";
spawn_ammo_box  = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\ammobox.sqf";

//Custom Boxes
Construction_Supply_Box  = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\ConstructionSupplyBox.sqf";
Medical_Supply_Box  = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\MedicalSupplyBox.sqf";
Sniper_Gun_Box  = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\SniperGunBox.sqf";
Chain_Bullet_Box  = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\ChainBulletBox.sqf";

Extra_Large_Gun_Box  = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\ExtraLargeGunBox.sqf";
Large_Gun_Box = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\LargeGunBox.sqf";
Medium_Gun_Box = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\MediumGunBox.sqf";
Small_Gun_Box = compile preprocessFileLineNumbers "DZHC\Overrides\WAI\missions\compile\SmallGunBox.sqf";

clean_running_mission = False;

//load mission config
[] ExecVM "DZHC\Overrides\WAI\missions\missionCfg.sqf";
waitUntil {WAImissionconfig};
diag_log "WAI: Mission Config File Loaded";
[] ExecVM "DZHC\Overrides\WAI\missions\missions.sqf";
//Custom ammo boxes
[] ExecVM "DZHC\Overrides\WAI\missions\StaticAmmoBoxes.sqf";