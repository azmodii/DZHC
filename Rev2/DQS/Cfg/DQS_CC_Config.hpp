/* Custom Recipes */

class DQS_CC_Config {
	// Init variables
	ContextItems[] = {"HandGrenade_West","BAF_ied_v1","ItemToolbox","bulk_ItemSandbag","ItemPole","PartPlankPack","PartPlywoodPack","ItemFuelBarrel","ItemLightBulb","CinderBlocks","m16a4","m16a4_acg","M16A4_GL","M16A4_ACG_GL","FN_FAL_ANPVS4","SVD_CAMO","M4A1","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo","G36C","G36C_camo","G36_C_SD_camo","G36_C_SD_eotech","G36a","G36K","AKS_74","AKS_74_pso","AKS_74_kobra","AK_107_pso","AK_107_kobra","AK_107_GL_pso","AK_107_GL_kobra","SCAR_L_CQC","SCAR_L_CQC_Holo","SCAR_L_CQC_GL_Holo","SCAR_L_CQC_CCO_SD","SCAR_L_STD_HOLO","SCAR_L_STD_GL_RCO","SCAR_H_CQC_CCO","SCAR_H_CQC_CCO_SD","SCAR_H_STD_GL_Spect","SCAR_H_LNG_Sniper","SCAR_H_LNG_Sniper_SD","M110_NVG_EP1","m8_Carbine","M9","M9SD","Makarov","MakarovSD","revolver_EP1","bizon","bizon_silenced","MP5A5","MP5SD","FN_FAL","SVD_NSPU_EP1"};
	AllowedObj[] = {"Land_Fort_Watchtower_EP1","Land_fortified_nest_big_EP1","WarfareBCamp","Land_vez","Land_radar_EP1","Land_Ind_IlluminantTower","ZavoraAnim","MAP_leseni2x","MAP_leseni4x","Land_A_Castle_Stairs_A","Sign_Checkpoint_US_EP1","Land_Ind_TankSmall2_EP1","ASC_runway_BluelightB","ASC_runway_YellowlightB","MAP_Misc_WellPump","Land_pumpa","Land_CncBlock_Stripes","RampConcrete","Land_aif_ryb_domek","MAP_Misc_Cargo1A","MAP_Misc_Cargo1E","MAP_sara_hasic_zbroj","MAP_Heli_H_army","FlagCarrierArmex_EP1","FlagCarrierBLUFOR_EP1","FlagCarrierBAF","FlagCarrierNATO_EP1","FlagCarrierUSArmy_EP1","MAP_A_Castle_Wall1_20"};
	MaintainObj[] = {"Land_Fort_Watchtower_EP1","Land_fortified_nest_big_EP1","WarfareBCamp","Land_vez","Land_radar_EP1","Land_Ind_IlluminantTower","ZavoraAnim","MAP_leseni2x","MAP_leseni4x","Land_A_Castle_Stairs_A","Sign_Checkpoint_US_EP1","Land_Ind_TankSmall2_EP1","ASC_runway_BluelightB","ASC_runway_YellowlightB","MAP_Misc_WellPump","Land_pumpa","Land_CncBlock_Stripes","RampConcrete","Land_aif_ryb_domek","MAP_Misc_Cargo1A","MAP_Misc_Cargo1E","MAP_sara_hasic_zbroj","MAP_Heli_H_army","FlagCarrierArmex_EP1","FlagCarrierBLUFOR_EP1","FlagCarrierBAF","FlagCarrierNATO_EP1","FlagCarrierUSArmy_EP1","MAP_A_Castle_Wall1_20"};
	
	class Mods {
		Attach[] = {};
		Detach[] = {};
	};
	// End Init Variables
	

	class BUILD {
		ActionText = "Build";
		Handler = "DQS_BuildObj";
		class Land_Fort_Watchtower_EP1 {
			Description = "Sandbag Watch Tower";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemHatchet_DZE","ItemEtool"}; 
			Cost[] = {{"PartPlywoodPack",3},{"bulk_ItemSandbag",1}};
			Offset[] = {0,6.5,2.5};
		};
		class Land_fortified_nest_big_EP1 {
			Description = "Large Sandbag Nest";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemHatchet_DZE","ItemEtool"};
			Cost[] = {{"PartPlywoodPack",2},{"bulk_ItemSandbag",1}};
			Offset[] = {0,8,1.1};			
		};
		class WarfareBCamp {
			Description = "Sandbag Camp";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"}; 
			Cost[] = {{"PartPlankPack",2},{"bulk_ItemSandbag",1}};
			Offset[] = {0,10,1.1};
		};
		class Land_vez {
			Description = "Small Metal Tower";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"};  
			Cost[] = {{"PartGeneric",2},{"ItemPole",4}};
			Offset[] = {0,4,4.6};
		};
		class Land_radar_EP1 {
			Description = "Medium Metal Tower";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"};  
			Cost[] = {{"PartGeneric",2},{"ItemPole",4},{"CinderBlocks",2}};
			Offset[] = {0,4.5,6.7};
		};
		class Land_Ind_IlluminantTower {
			Description = "Large Metal Tower";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"};  
			Cost[] = {{"PartGeneric",3},{"ItemPole",4},{"CinderBlocks",2}};
			Offset[] = {0,3,10};
		};
		class ZavoraAnim {
			Description = "Boom Gate";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"};  
			Cost[] = {{"PartGeneric",2},{"ItemPole",1},{"CinderBlocks",1}};
			Offset[] = {0,3,4.4};
		};
		class MAP_leseni2x {
			Description = "Scaffolding";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"};  
			Cost[] = {{"PartGeneric",1},{"ItemPole",4},{"PartPlankPack",1}};
			Offset[] = {0,3,1.55};
		};
		class MAP_leseni4x {
			Description = "Large Scaffold";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"};  
			Cost[] = {{"PartGeneric",2},{"ItemPole",4},{"PartPlankPack",2}};
			Offset[] = {0,3,3.87};
		};
		class Land_A_Castle_Stairs_A {
			Description = "Castle Stairs";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemHatchet_DZE","ItemSledge"};  
			Cost[] = {{"PartPlankPack",4},{"PartPlywoodPack",2}};
			Offset[] = {-4,6,3.8};
		};
		class Sign_Checkpoint_US_EP1 {
			Description = "Stop Sign";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox"}; 
			Cost[] = {{"PartGeneric",1}};
			Offset[] = {0,2,0.45};
		};
		class Land_Ind_TankSmall2_EP1 {
			Description = "Fuel Tank";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemSledge","ItemEtool"}; 
			Cost[] = {{"PartGeneric",2},{"ItemPole",2},{"ItemFuelBarrel",2},{"CinderBlocks",2}};
			Offset[] = {0,3,1.5};
		};
		class ASC_runway_BluelightB {
			Description = "Runway Light Blue";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"PartGeneric",1},{"ItemLightBulb",1}};
			Offset[] = {0,2,0.2};
		};
		class ASC_runway_YellowlightB {
			Description = "Runway Light Yellow";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"PartGeneric",1},{"ItemLightBulb",1}};
			Offset[] = {0,2,0.2};
		};
		class MAP_Misc_WellPump {
			Description = "Water Well";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemShovel"}; 
			Cost[] = {{"PartGeneric",1},{"CinderBlocks",2}};
			Offset[] = {0,3,0.9};
		};
		class Land_pumpa {
			Description = "Water Pump";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemShovel","ItemEtool"}; 
			Cost[] = {{"PartGeneric",2},{"CinderBlocks",2}};
			Offset[] = {0,4.5,1.2};
		};
		class Land_CncBlock_Stripes {
			Description = "Concrete Barrier";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"PartGeneric",2},{"CinderBlocks",2}};
			Offset[] = {0,2,0.4};
		};
		class RampConcrete {
			Description = "Concrete Ramp";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"}; 
			Cost[] = {{"PartGeneric",2},{"CinderBlocks",4}};
			Offset[] = {0,8,0.5};
		};
		class Land_aif_ryb_domek {
			Description = "Small House";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"}; 
			Cost[] = {{"PartGeneric",2},{"CinderBlocks",4},{"MortarBucket",2}};
			Offset[] = {0,3,3.87};
		};
		class MAP_Misc_Cargo1A {
			Description = "Red Cargo Container";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"PartGeneric",6},{"ItemPole",4}};
			Offset[] = {0,3,3.87};
		};
		class MAP_Misc_Cargo1E {
			Description = "Blue Cargo Container";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"PartGeneric",6},{"ItemPole",4}};
			Offset[] = {0,3,3.87};
		};
		class MAP_sara_hasic_zbroj {
			Description = "Large House";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"}; 
			Cost[] = {{"ItemPole",2},{"CinderBlocks",4},{"MortarBucket",2}};
			Offset[] = {0,15,3.87};
		};
		class MAP_Heli_H_army {
			Description = "Helipad";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"PartGeneric",1},{"ItemLightBulb",1}};
			Offset[] = {0,2,0.2};
		};
		class FlagCarrierArmex_EP1 {
			Description = "Armex Flagpole";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"ItemCanvas",1},{"ItemPole",1}};
			Offset[] = {0,3,3.87};
		};
		class FlagCarrierBLUFOR_EP1 {
			Description = "BLUFOR Flagpole";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"ItemCanvas",1},{"ItemPole",1}};
			Offset[] = {0,3,3.87};
		};
		class FlagCarrierBAF {
			Description = "BAF Flagpole";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"ItemCanvas",1},{"ItemPole",1}};
			Offset[] = {0,3,3.87};
		};
		class FlagCarrierNATO_EP1 {
			Description = "NATO Flagpole";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"ItemCanvas",1},{"ItemPole",1}};
			Offset[] = {0,3,3.87};
		};
		class FlagCarrierUSArmy_EP1 {
			Description = "US Flagpole";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool"}; 
			Cost[] = {{"ItemCanvas",1},{"ItemPole",1}};
			Offset[] = {0,3,3.87};
		};
		class MAP_A_Castle_Wall1_20 {
			Description = "10m Castle Wall";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox","ItemEtool","ItemSledge"}; 
			Cost[] = {{"ItemRuby",2},{"CinderBlocks",6},{"MortarBucket",2}};
			Offset[] = {0,3,3.87};
		};
	};
	class CRAFT {
		ActionText = "Craft";
		Handler = "DQS_CraftObj";
		class BAF_ied_v1 {
			Handler = "MAG";
			Description = "IED";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"TrashTinCan",1},{"HandGrenade_West",2},{"ItemWaterbottleUnfilled",1}};
		};
		class BAF_ied_v2 {
			Handler = "MAG";
			Description = "Large IED";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"BAF_ied_v1",3}};
		};
	};
	class SMELT {
		ActionText = "Smelt";
		Handler = "DQS_SmeltObj";
	
	};
	class WEAPON {
		ActionText = "Add/Remove";
		Handler = "DQS_CraftObj";
		class ACOG {
			Description = "ACOG Scope";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox","ItemHatchet_DZE"}; 
			Cost[] = {{"PartGeneric",1}};
		};
		class GL {
			Description = "Grenade Launcher";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class AIM {
			Description = "Aimpoint Sight";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox","ItemHatchet_DZE"};
			Cost[] = {{"PartGeneric",1},{"TrashJackDaniels",1}};
		};
		class CAMO {
			Description = "Camo";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"ItemBurlap",1},{"ItemCanvas",1}};
		};
		class SD {
			Description = "Silencer";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox","ItemKnife"};
			Cost[] = {{"TrashTinCan",2},{"ItemPole",1},{"PartGeneric",1}};
		};
		class EOTECH {
			Description = "EOTECH Sight";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1},{"TrashJackDaniels",1}};
		};
		class GOLD {
			Description = "Gold Plating";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemSledge","ItemMatchbox_DZE"};
			Cost[] = {{"ItemGoldBar",1}};
		};
		class PSO {
			Description = "PSO Scope";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class KOBRA {
			Description = "KOBRA Scope";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class HOLO {
			Description = "HOLO Scope";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class SDCCO {
			Description = "Silenced CC Optics";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class CQT {
			Description = "Mk 4 CQ System";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class LSTOCK {
			Description = "Sniper Stock";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class SSTOCK {
			Description = "Standard Stock";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class CQCSTOCK {
			Description = "Close Quarters Stock";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class NVG {
			Description = "Nightvision Scope";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class MG {
			Description = "MG Conversion";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class RIS {
			Description = "Rail Integration";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class RCO {
			Description = "Combat Optics";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class CCO {
			Description = "Close Combat Optics";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class HBOLT {
			Description = "Heavy Bolt";
			ObjectNeeded[] = {"WorkBench_DZ"};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",3}};
		};
	};
	class VEHICLE {
		ActionText = "Deploy";
		Handler = "DQS_CraftObj";
		class Old_bike_TK_CIV_EP1 {
			Description = "Old Bike";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",1}};
		};
		class TT650_Gue {
			Description = "Motorbike";
			ObjectNeeded[] = {};
			Requirement[] = {"ItemToolbox"};
			Cost[] = {{"PartGeneric",2},{"PartEngine",1}};
		};
	};

	// BUILD ITEMS START *************************************************************************************************
	class bulk_ItemSandbag {
		Handler = "BUILD";
		Options[] = {"Land_Fort_Watchtower_EP1","Land_fortified_nest_big_EP1","WarfareBCamp"};
	};
	class ItemPole {
		Handler = "BUILD";
		Options[] = {"Land_vez","Land_radar_EP1","Land_Ind_IlluminantTower","ZavoraAnim","MAP_leseni2x","MAP_leseni4x"};
	};
	class PartPlankPack {
		Handler = "BUILD";
		Options[] = {"Land_A_Castle_Stairs_A"};
	};
	class PartPlywoodPack {
		Handler = "BUILD";
		Options[] = {"Sign_Checkpoint_US_EP1"};
	};
	class ItemFuelBarrel {
		Handler = "BUILD";
		Options[] = {"Land_Ind_TankSmall2_EP1"};
	};
	class ItemLightBulb {
		Handler = "BUILD";
		Options[] = {"ASC_runway_BluelightB","ASC_runway_YellowlightB"};
	};
	class CinderBlocks {
		Handler = "BUILD";
		Options[] = {"MAP_Misc_WellPump","Land_pumpa","Land_CncBlock_Stripes","RampConcrete"};
	};
	class MortarBucket {
		Handler = "BUILD";
		Options[] = {"Land_aif_ryb_domek","MAP_sara_hasic_zbroj","MAP_A_Castle_Wall1_20"};
	};
	class PartGeneric {
		Handler = "BUILD";
		Options[] = {"MAP_Misc_Cargo1A","MAP_Misc_Cargo1E","MAP_Heli_H_army"};
	};
	class ItemCanvas {
		Handler = "BUILD";
		Options[] = {"FlagCarrierArmex_EP1","FlagCarrierBLUFOR_EP1","FlagCarrierBAF","FlagCarrierNATO_EP1","FlagCarrierUSArmy_EP1"};
	};
	// CRAFT ITEMS START **************************************************
	
	class HandGrenade_West {
		Handler = "CRAFT";
		Options[] = {"BAF_ied_v1"};
	};
	class BAF_ied_v1 {
		Handler = "CRAFT";
		Options[] = {"BAF_ied_v2"};
	};
	class ItemToolbox {
		Handler = "VEHICLE";
		Options[] = {"Old_bike_TK_CIV_EP1","TT650_Gue"};
	};
	// PISTOL AND SUB MACHINE GUNS ********************************
	
	//M9
	class M9 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","M9SD"}};
	};
	class M9SD : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","M9"}};
	};
	
	//Makarov
	class Makarov : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","MakarovSD"}};
	};
	class MakarovSD : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","Makarov"}};
	};
	
	//Revolver
	class revolver_EP1 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GOLD","revolver_gold_EP1"}};
	};
	
	//PDW
	class UZI_EP1 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","UZI_SD_EP1"}};
	};
	class UZI_SD_EP1 : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","UZI_EP1"}};
	};
	
	//Bizon
	class bizon : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","bizon_silenced"}};
	}
	class bizon_silenced : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","bizon"}};
	};
	
	//MP5
	class MP5A5 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","MP5SD"}};
	};
	class MP5SD : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","MP5A5"}};
	};
	
	// END PISTOL AND SUB MACHINE GUNS *************************
	
	// RIFLES ***************************************************

	// M16A2
	/*class M16A2 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","M16A2GL"}};
	};
	class M16A2GL : Mods {
		Handler = "WEAPON";
		Detach[] = {{"GL","M16A2"}};
	};
	
	
	// M16A4
	class m16a4 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"ACOG","m16a4_acg"},{"GL","M16A4_GL"}};
	};
	class m16a4_acg : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","M16A4_ACG_GL"}};
		Detach[] = {{"ACOG","m16a4"}};
	};
	class M16A4_GL : Mods {
		Handler = "WEAPON";
		Attach[] = {{"ACOG","M16A4_ACG_GL"}};
		Detach[] = {{"GL","m16a4"}};
	};
	class M16A4_ACG_GL : Mods {
		Handler = "WEAPON";
		Detach[] = {{"ACOG","M16A4_GL"},{"GL","m16a4_acg"}};
	};
	
	// M4A1
	/*class M4A1 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"AIM","M4A1_Aim"}};
	};
	*/
	class M4A1_Aim : Mods {
		Handler = "WEAPON";
		Attach[] = {{"CAMO","M4A1_Aim_camo"}};
		Detach[] = {}; //{"AIM","M4A1"}
	};
	class M4A1_Aim_camo : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","M4A1_AIM_SD_camo"}};
	};
	class M4A1_AIM_SD_camo : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","M4A1_Aim_camo"}};
	};
	
	// M4A3
	/*class M4A3_CCO_EP1 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","M4A3_RCO_GL_EP1"}};
	};
	class M4A3_RCO_GL_EP1 : Mods {
		Handler = "WEAPON";
		Detach[] = {{"GL","M4A3_CCO_EP1"}};
	};*/
	
	// G36C
	class G36C : Mods {
		Handler = "WEAPON";
		Attach[] = {{"CAMO","G36C_camo"},{"SD","G36_C_SD_eotech"}};
	};
	class G36C_camo : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","G36_C_SD_camo"}};
	};
	class G36_C_SD_camo : Mods {
		Handler = "WEAPON";
		Attach[] = {}; //{"EOTECH","G36_C_SD_eotech"}
		Detach[] = {{"SD","G36C_camo"}};
	};
	class G36_C_SD_eotech : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","G36_C_SD_camo"}};
	};
	
	//G36A
	class G36a : Mods {
		Handler = "WEAPON";
		Attach[] = {{"CAMO","G36A_camo"}}; //{"MG","MG36"}
	};
	class MG36 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"CAMO","MG36_CAMO"}};
	};
	/*class G36A_CAMO : Mods {
		Handler = "WEAPON";
		Attach[] = {{"MG","MG36_CAMO"}};
	};*/
	
	//G36K
	class G36K : Mods {
		Handler = "WEAPON";
		Attach[] = {{"CAMO","G36K_camo"}};
	};
	
	//AKS
	class AKS_74 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GOLD","AKS_GOLD"}}; //{"NVG","AKS_74_NSPU"},{"PSO","AKS_74_pso"},{"KOBRA","AKS_74_kobra"}
	};
	/*class AKS_74_pso : Mods {
		Handler = "WEAPON";
		Detach[] = {{"PSO","AKS_74"}};
	};
	class AKS_74_kobra : Mods {
		Handler = "WEAPON";
		Detach[] = {{"KOBRA","AKS_74"}};
	};
	class AKS_74_NSPU : Mods {
		Handler = "WEAPON";
		Detach[] = {{"NVG","AKS_74"}};
	};*/
	
	// AK74
	/*class AK_74 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","AK_74_GL"}};
	};
	class AK_74_GL : Mods {
		Handler = "WEAPON";
		Attach[] = {{"KOBRA","AK_74_GL_KOBRA"}};
		Detach[] = {{"GL","AK_74"}};
	};
	class AK_74_GL_KOBRA : Mods {
		Handler = "WEAPON";
		Detach[] = {{"KOBRA","AK_74_GL"}};
	};*/
	
	//AK107
	/*class AK_107_pso : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","AK_107_GL_pso"}};
	};
	class AK_107_kobra : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","AK_107_GL_kobra"}};
	};
	class AK_107_GL_pso : Mods {
		Handler = "WEAPON";
		Detach[] = {{"GL","AK_107_pso"}};
	};
	class AK_107_GL_kobra {
		Handler = "WEAPON";
		Detach[] = {{"GL","AK_107_kobra"}};
	};*/
	
	//SCAR L - MK16
	/*class SCAR_L_CQC : Mods {
		Handler = "WEAPON";
		Attach[] = {{"HOLO","SCAR_L_CQC_Holo"}};
	};*/
	class SCAR_L_CQC_Holo : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SDCCO","SCAR_L_CQC_CCO_SD"}}; //{"GL","SCAR_L_CQC_EGLM_Holo"},,{"SSTOCK","SCAR_L_STD_HOLO"}
		Detach[] = {}; //{"HOLO","SCAR_L_CQC"}
	};
	/*class SCAR_L_CQC_EGLM_Holo : Mods {
		Handler = "WEAPON";
		Detach[] = {{"GL","SCAR_L_CQC_Holo"}};
	};*/
	class SCAR_L_CQC_CCO_SD : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SDCCO","SCAR_L_CQC_Holo"}};
	};
	/*class SCAR_L_STD_HOLO : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","SCAR_L_STD_EGLM_RCO"},{"CQT","SCAR_L_STD_Mk4CQT"},{"CQCSTOCK","SCAR_L_CQC_Holo"}};
	};
	class SCAR_L_STD_EGLM_RCO : Mods {
		Handler = "WEAPON";
		Detach[] = {{"GL","SCAR_L_STD_HOLO"}};
	};*/

	//SCAR H - MK17
	class SCAR_H_CQC_CCO : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","SCAR_H_CQC_CCO_SD"}};
	};
	class SCAR_H_CQC_CCO_SD : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","SCAR_H_CQC_CCO"}};
	};
	/*class SCAR_H_STD_EGLM_Spect : Mods {
		Handler = "WEAPON";
		Attach[] = {{"LSTOCK","SCAR_H_LNG_Sniper"}};
		Detach[] = {{"GL","SCAR_H_LNG_Sniper"}};
	};*/
	class SCAR_H_LNG_Sniper : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","SCAR_H_LNG_Sniper_SD"}}; //,{"GL","SCAR_H_STD_EGLM_Spect"},{"NVG","M110_NVG_EP1"}
	};
	class SCAR_H_LNG_Sniper_SD : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","SCAR_H_LNG_Sniper"}};
	};
	
	//M110
	/*class M110_NVG_EP1 : Mods {
		Handler = "WEAPON";
		Detach[] = {{"NVG","SCAR_H_LNG_Sniper"}};
	};*/
	
	//M8
	class m8_Carbine : Mods {
		Handler = "WEAPON";
		Attach[] = {{"SD","M8_HOLO_SD"}}; //{"COMPACT","m8_Compact"},{"GL","M8_CARBINEGL"},,{"SNIPER","m8_sharpshooter"},{"MG","m8_SAW"}
	};
	/*class M8_CARBINEGL : Mods {
		Handler = "WEAPON";
		Detach[] = {{"GL","m8_Carbine"}};
	};*/
	class M8_HOLO_SD : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SD","m8_Carbine"}};
	};
	/*class m8_sharpshooter : Mods {
		Handler = "WEAPON";
		Detach[] = {{"SNIPER","m8_Carbine"}};
	};*/
	
	// L85A2
	/*class BAF_L85A2_ACOG : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","BAF_L85A2_UGL_ACOG"},{"RIS","BAF_L85A2_RIS_ACOG"}};
	};
	class BAF_L85A2_UGL_ACOG : Mods {
		Handler = "WEAPON";
		Detach[] = {{"GL","BAF_L85A2_ACOG"}};
	};
	class BAF_L85A2_RIS_ACOG : Mods {
		Handler = "WEAPON";
		Attach[] = {{"HOLO","BAF_L85A2_RIS_HOLO"},{"SUSAT","BAF_L85A2_RIS_SUSAT"}};
		Detach[] = {{"RIS","BAF_L85A2_ACOG"}};
	};
	class BAF_L85A2_RIS_HOLO : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","BAF_L85A2_UGL_HOLO"}};
		Detach[] = {{"HOLO","BAF_L85A2_RIS_ACOG"}};
	};
	class BAF_L85A2_UGL_HOLO : Mods {
		Handler = "WEAPON";
		Detach[] = {{"GL","BAF_L85A2_RIS_HOLO"}};
	};
	class BAF_L85A2_RIS_SUSAT : Mods {
		Handler = "WEAPON";
		Attach[] = {{"GL","BAF_L85A2_UGL_SUSAT"}};
		Detach[] = {{"HOLO","BAF_L85A2_RIS_ACOG"}};
	};
	class BAF_L85A2_UGL_SUSAT : Mods {
		Handler = "WEAPON";
		Detach[] = {{"GL","BAF_L85A2_RIS_SUSAT"}};
	};
	
	// SA58V
	class SA58V_EP1 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"CCO","SA58V_CCO_EP1"},{"RCO","SA58V_RCO_EP1"}};
	};
	class SA58V_RCO_EP1 : Mods {
		Handler = "WEAPON";
		Detach[] = {{"RCO","SA58V_EP1"}};
	};
	class SA58V_CCO_EP1 : Mods {
		Handler = "WEAPON";
		Detach[] = {{"CCO","SA58V_EP1"}};
	};

	//FAL - NV
	class FN_FAL : Mods {
		Handler = "WEAPON";
		Attach[] = {{"NVG","FN_FAL_ANPVS4"}};
	};
	class FN_FAL_ANPVS4 : Mods {
		Handler = "WEAPON";
		Detach[] = {{"NVG","FN_FAL_ANPVS4"}};
	};
	*/
	// END RIFLES ***************************************************

	// SNIPER RIFLES ***********************************************

	//SVD
	class SVD : Mods {
		Handler = "WEAPON";
		Attach[] = {{"CAMO","SVD_CAMO"}};
	};
	/*class SVD_DES_EP1 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"NVG","SVD_NSPU_EP1"}};
	};
	class SVD_CAMO : Mods {
		Handler = "WEAPON";
		Attach[] = {{"NVG","SVD_NSPU_EP1"}};
	};
	class SVD_NSPU_EP1 : Mods {
		Handler = "WEAPON";
		Detach[] = {{"NVG","SVD_CAMO"}};
	};	*/
	
	// M24
	class M24 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"HBOLT","M40A3"}};
	};
	class M24_DES_EP1 : Mods {
		Handler = "WEAPON";
		Attach[] = {{"HBOLT","M40A3"}};
	};
	
	// END SNIPER RIFLES ********************************************

	// MACHINE GUNS *************************************************
	
	// M240
	/*class M240_DZ : Mods {
		Handler = "WEAPON";
		Attach[] = {{"ACOG","M240_SCOPED_EP1_DZE"}};
	};
	class M240_SCOPED_EP1_DZE : Mods {
		Handler = "WEAPON";
		Detach[] = {{"ACOG","M240_DZ"}};
	};
	
	// M249
	class M249_DZ : Mods {
		Handler = "WEAPON";
		Attach[] = {{"ACOG","M249_M145_EP1_DZE"}};
	};
	class M249_M145_EP1_DZE : Mods {
		Handler = "WEAPON";
		Detach[] = {{"ACOG","M249_DZ"}};
	};
	
	// END MACHINE GUNS ************************************************* */

};