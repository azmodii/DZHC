//Sector FNG Made by Phoenix @ http://fridaynightgaming.co.uk/
//Feel Free to test @ 91.121.11.49:2362 Bring a group you'll need one.
//Thanks to OpenDayZ for there hard work in helping others.
//Thanks to Sarge for his great AI work.

if (isServer) then {

//Schatz
_vehicle_103769 = objNull;
if (true) then
{
  _this = createVehicle ["GuerillaCacheBox", [4102.6724, 7542.8574], [], 0, "CAN_COLLIDE"];
  _vehicle_103769 = _this;
    //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  _this addWeaponCargoGlobal ["NVGoggles",1];
  _this addWeaponCargoGlobal ["ItemCrowbar",5];
  _this addWeaponCargoGlobal ["ItemEtool",5];

  _this addmagazineCargoGlobal ["ItemBriefcase100oz",3];
  _this addmagazineCargoGlobal ["ItemGoldBar10oz",10];
  _this addmagazineCargoGlobal ["ItemSilverBar10oz",20];
  _this addmagazineCargoGlobal ["ItemGold",18];
  _this addmagazineCargoGlobal ["ItemSilver",15];
  
  
  _this addmagazineCargoGlobal ["ItemHeatPack",15];
  _this addmagazineCargoGlobal ["ItemPainkiller",5];
  _this addmagazineCargoGlobal ["ItemMorphine",5];
  _this addmagazineCargoGlobal ["ItemBloodBag",5];
  _this addmagazineCargoGlobal ["ItemAntibiotic",5];

  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this setVariable ["permaLoot",true];
  _this setPos [4102.6724, 7542.8574];
};

//Schatz
_vehicle_103770 = objNull;
if (true) then
{
  _this = createVehicle ["GuerillaCacheBox", [4033.8923, 7549.2368, 9.9490442], [], 0, "CAN_COLLIDE"];
  _vehicle_103770 = _this;
    //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  _this addWeaponCargoGlobal ["NVGoggles",1];
  _this addWeaponCargoGlobal ["ItemCrowbar",5];
  _this addWeaponCargoGlobal ["ItemEtool",5];

  _this addmagazineCargoGlobal ["ItemRuby",2];
  _this addmagazineCargoGlobal ["ItemAmethyst",4];
  _this addmagazineCargoGlobal ["ItemObsidian",2];
  _this addmagazineCargoGlobal ["ItemTopaz",8];
  _this addmagazineCargoGlobal ["ItemEmerald",2];

  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this setVariable ["permaLoot",true];
  _this setPos [4033.8923, 7549.2368, 9.9490442];
};

//Schatz
_vehicle_103771 = objNull;
if (true) then
{
  _this = createVehicle ["GuerillaCacheBox", [4082.0891, 7658.854, 8.754858], [], 0, "CAN_COLLIDE"];
  _vehicle_103771 = _this;
  //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  _this addWeaponCargoGlobal ["NVGoggles",1];
  _this addWeaponCargoGlobal ["ItemCrowbar",5];
  _this addWeaponCargoGlobal ["ItemEtool",5];

  _this addmagazineCargoGlobal ["ItemBriefcase100oz",3];
  _this addmagazineCargoGlobal ["ItemGoldBar10oz",5];
  _this addmagazineCargoGlobal ["ItemSilverBar10oz",9];
  _this addmagazineCargoGlobal ["ItemTopaz",5];
  _this addmagazineCargoGlobal ["ItemEmerald",2];

  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this setVariable ["permaLoot",true];
  _this setPos [4082.0891, 7658.854, 8.754858];
};

//Bauen
_vehicle_103772 = objNull;
if (true) then
{
  _this = createVehicle ["USOrdnanceBox", [3925.4163, 7747.1592, 1.6719083], [], 0, "CAN_COLLIDE"];
  _vehicle_103772 = _this;
  _this setDir 90.560677;
  //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo

  _this addmagazineCargoGlobal ["ItemHeatPack",5];
  _this addmagazineCargoGlobal ["ItemBandage",10];
  _this addmagazineCargoGlobal ["ItemPainkiller",10];
  _this addmagazineCargoGlobal ["ItemMorphine",10];
  _this addmagazineCargoGlobal ["ItemBloodBag",10];
  _this addmagazineCargoGlobal ["ItemEpinephrine",5];
  _this addmagazineCargoGlobal ["ItemAntibiotic",10];
  
  _this addmagazineCargoGlobal ["HandGrenade_West",5];
  
// CONSTRUCTION MATERIALS
  _this addmagazineCargoGlobal ["bulk_ItemWire", 10];
  _this addmagazineCargoGlobal ["ItemWoodWallLg", 25];
  _this addmagazineCargoGlobal ["ItemCanvas", 10];
  _this addmagazineCargoGlobal ["bulk_PartGeneric", 5];
  _this addmagazineCargoGlobal ["bulk_ItemSandbag", 10];
  _this addmagazineCargoGlobal ["bulk_ItemTankTrap", 10];
  _this addmagazineCargoGlobal ["ItemWoodFloor", 30];
  _this addmagazineCargoGlobal ["ItemWoodStairs", 10];
  _this addmagazineCargoGlobal ["ItemWoodWallWindowLg", 20];
  _this addmagazineCargoGlobal ["ItemComboLock", 2];
  _this addmagazineCargoGlobal ["Itemvault", 1];
  _this addmagazineCargoGlobal ["ItemDocument",10];
  _this addmagazineCargoGlobal ["PartWoodPlywood",25];
  _this addmagazineCargoGlobal ["light_pole_kit",5];
  _this addmagazineCargoGlobal ["ItemWoodLadder",5];
  _this addmagazineCargoGlobal ["PartPlankPack",25];

  
  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this setVariable ["permaLoot",true];
  _this setPos [3925.4163, 7747.1592, 1.6719083];
};

//Bauen
_vehicle_103772 = objNull;
if (true) then
{
  _this = createVehicle ["USOrdnanceBox", [3854.551, 7909.1133, 9.0653191], [], 0, "CAN_COLLIDE"];
  _vehicle_103772 = _this;
  _this setDir 90.560677;
  //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo

  _this addmagazineCargoGlobal ["ItemHeatPack",15];
  _this addmagazineCargoGlobal ["ItemBandage",30];
  _this addmagazineCargoGlobal ["ItemPainkiller",30];
  _this addmagazineCargoGlobal ["ItemMorphine",10];
  _this addmagazineCargoGlobal ["ItemBloodBag",10];
  _this addmagazineCargoGlobal ["ItemEpinephrine",15];
  _this addmagazineCargoGlobal ["ItemAntibiotic",10];
  
  _this addmagazineCargoGlobal ["HandGrenade_West",5];
  
// CONSTRUCTION MATERIALS
  _this addmagazineCargoGlobal ["CinderBlocks", 40];
  _this addmagazineCargoGlobal ["MortarBucket", 25];
  _this addmagazineCargoGlobal ["ItemCanvas", 20];
  _this addmagazineCargoGlobal ["bulk_PartGeneric", 5];
  _this addmagazineCargoGlobal ["bulk_ItemSandbag", 5];
  _this addmagazineCargoGlobal ["bulk_ItemTankTrap", 5];
  _this addmagazineCargoGlobal ["metal_floor_kit", 20];
  _this addmagazineCargoGlobal ["cinder_wall_kit", 20];
  _this addmagazineCargoGlobal ["ItemComboLock", 2];
  _this addmagazineCargoGlobal ["Itemvault", 1];
  _this addmagazineCargoGlobal ["ItemDocument",10];

  
  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this setVariable ["permaLoot",true];
  _this setPos [3854.551, 7909.1133, 9.0653191];
};

//Essen
_vehicle_103771 = objNull;
if (true) then
{
  _this = createVehicle ["USVehicleBox", [3775.2681, 7788.2725, 0.19940034], [], 0, "CAN_COLLIDE"];
  _vehicle_103771 = _this;
  _this setDir -178.83;
  //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  _this addWeaponCargoGlobal ["NVGoggles",1];
  _this addWeaponCargoGlobal ["Binocular_Vector",1];
  _this addWeaponCargoGlobal ["ItemGPS",1];
  _this addWeaponCargoGlobal ["ItemRadio",2];

  _this addmagazineCargoGlobal ["ItemHeatPack",15];
  _this addmagazineCargoGlobal ["ItemBandage",30];
  _this addmagazineCargoGlobal ["ItemPainkiller",30];
  _this addmagazineCargoGlobal ["ItemMorphine",10];
  _this addmagazineCargoGlobal ["ItemBloodBag",10];
  _this addmagazineCargoGlobal ["ItemEpinephrine",15];
  _this addmagazineCargoGlobal ["ItemAntibiotic",10];

   _this addWeaponCargoGlobal ["M9SD",2];
  _this addWeaponCargoGlobal ["DMR_DZ",2];
  _this addWeaponCargoGlobal ["M4A1_AIM_SD_camo",2];
  _this addWeaponCargoGlobal ["M110_NVG_EP1",2];
  _this addWeaponCargoGlobal ["M60A4_EP1_DZE",2];
  _this addWeaponCargoGlobal ["M14_EP1",2];
  _this addWeaponCargoGlobal ["Mk_48_DZ",2];
  _this addWeaponCargoGlobal ["BAF_L85A2_RIS_SUSAT",2];
  _this addWeaponCargoGlobal ["BAF_L85A2_RIS_Holo",2];
  _this addWeaponCargoGlobal ["G36K_camo",2];
  
   _this addmagazineCargoGlobal ["20Rnd_762x51_DMR",20];
  _this addmagazineCargoGlobal ["30Rnd_556x45_StanagSD",20];
  _this addmagazineCargoGlobal ["20Rnd_762x51_B_SCAR",10];
  _this addmagazineCargoGlobal ["100Rnd_762x51_M240",20];
  _this addmagazineCargoGlobal ["30Rnd_556x45_G36",10];
  _this addmagazineCargoGlobal ["30Rnd_556x45_Stanag",30];
  _this addmagazineCargoGlobal ["15Rnd_9x19_M9SD",10];
  
  _this addmagazineCargoGlobal ["FoodCanBadguy",10];
  _this addmagazineCargoGlobal ["FoodCanBoneboy",10];
  _this addmagazineCargoGlobal ["FoodCanCorn",10];
  _this addmagazineCargoGlobal ["FoodCanCurgon",10];
  _this addmagazineCargoGlobal ["FoodCanDemon",10];
  _this addmagazineCargoGlobal ["FoodCanFraggleos",10];
  _this addmagazineCargoGlobal ["FoodCanHerpy",10];
  _this addmagazineCargoGlobal ["FoodCanDerpy",10];
  _this addmagazineCargoGlobal ["FoodCanTylers",10];
  _this addmagazineCargoGlobal ["ItemSodaR4z0r",10];
  _this addmagazineCargoGlobal ["ItemSodaClays",10];
  _this addmagazineCargoGlobal ["ItemSodaSmasht",10];
  _this addmagazineCargoGlobal ["ItemSodaDrwaste",10];
  _this addmagazineCargoGlobal ["ItemSodaLemonade",10];
  _this addmagazineCargoGlobal ["ItemSodaLvg",10];
  _this addmagazineCargoGlobal ["ItemSodaMzly",10];
  _this addmagazineCargoGlobal ["ItemSodaRabbit",5];
  

  _this addbackpackCargoGlobal ["DZ_LargeGunBag_EP1",2];
  _this setVariable ["permaLoot",true];
  _this setPos [3775.2681, 7788.2725, 0.19940034];
};

//Essen
_vehicle_103771 = objNull;
if (true) then
{
  _this = createVehicle ["USVehicleBox", [3913.0315, 7820.27, 4.8999534], [], 0, "CAN_COLLIDE"];
  _vehicle_103771 = _this;
  _this setDir -178.83;
  //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  _this addWeaponCargoGlobal ["NVGoggles",1];
  _this addWeaponCargoGlobal ["Binocular_Vector",1];
  _this addWeaponCargoGlobal ["ItemGPS",1];
  _this addWeaponCargoGlobal ["ItemRadio",2];

  _this addmagazineCargoGlobal ["ItemHeatPack",15];
  _this addmagazineCargoGlobal ["ItemBandage",30];
  _this addmagazineCargoGlobal ["ItemPainkiller",30];
  _this addmagazineCargoGlobal ["ItemMorphine",10];
  _this addmagazineCargoGlobal ["ItemBloodBag",10];
  _this addmagazineCargoGlobal ["ItemEpinephrine",15];
  _this addmagazineCargoGlobal ["ItemAntibiotic",10];

   _this addWeaponCargoGlobal ["RPG7V",2];
  _this addWeaponCargoGlobal ["DMR_DZ",2];
  _this addWeaponCargoGlobal ["M4A1_AIM_SD_camo",2];
  _this addWeaponCargoGlobal ["m240_scoped_EP1_DZE",2];
  _this addWeaponCargoGlobal ["M249_DZ",2];
  _this addWeaponCargoGlobal ["M14_EP1",2];
  _this addWeaponCargoGlobal ["Mk_48_DZ",2];
  _this addWeaponCargoGlobal ["BAF_L85A2_RIS_SUSAT",2];
  _this addWeaponCargoGlobal ["BAF_L85A2_RIS_Holo",2];
  _this addWeaponCargoGlobal ["G36K_camo",2];
  
   _this addmagazineCargoGlobal ["20Rnd_762x51_DMR",20];
  _this addmagazineCargoGlobal ["30Rnd_556x45_StanagSD",20];
  _this addmagazineCargoGlobal ["100Rnd_762x51_M240",20];
  _this addmagazineCargoGlobal ["200Rnd_556x45_M249",10];
  _this addmagazineCargoGlobal ["30Rnd_556x45_G36",10];
  _this addmagazineCargoGlobal ["30Rnd_556x45_Stanag",30];
  _this addmagazineCargoGlobal ["PG7V",2];
  
  _this addmagazineCargoGlobal ["FoodCanBadguy",10];
  _this addmagazineCargoGlobal ["FoodCanBoneboy",10];
  _this addmagazineCargoGlobal ["FoodCanCorn",10];
  _this addmagazineCargoGlobal ["FoodCanCurgon",10];
  _this addmagazineCargoGlobal ["FoodCanDemon",10];
  _this addmagazineCargoGlobal ["FoodCanFraggleos",10];
  _this addmagazineCargoGlobal ["FoodCanHerpy",10];
  _this addmagazineCargoGlobal ["FoodCanDerpy",10];
  _this addmagazineCargoGlobal ["FoodCanTylers",10];
  _this addmagazineCargoGlobal ["ItemSodaR4z0r",10];
  _this addmagazineCargoGlobal ["ItemSodaClays",10];
  _this addmagazineCargoGlobal ["ItemSodaSmasht",10];
  _this addmagazineCargoGlobal ["ItemSodaDrwaste",10];
  _this addmagazineCargoGlobal ["ItemSodaLemonade",10];
  _this addmagazineCargoGlobal ["ItemSodaLvg",10];
  _this addmagazineCargoGlobal ["ItemSodaMzly",10];
  _this addmagazineCargoGlobal ["ItemSodaRabbit",5];
  

  _this addbackpackCargoGlobal ["DZ_LargeGunBag_EP1",2];
  _this setVariable ["permaLoot",true];
  _this setPos [3913.0315, 7820.27, 4.8999534];
};
};