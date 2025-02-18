class cfgPatches {
    class COL_Functions {
        name = "Coleoptera Functions";
        author = "Gray";
        units[]={};
        weapons[]={};
        requiredVersion = 0.1;
        requiredAddons[] = {
            "cba_main",
            "ace_medical"
        };
    };
};/*
class Extended_PostInit_EventHandlers
{
	class col_postInit {
		init = "call compile preprocessFileLineNumbers 'XEH_postInit.sqf'";
	};
};*/
class cfgFunctions {
    class COL {
        class functions { 
            file = "COL_Functions\functions";
            class coleopteraOmni {}; // COL_fnc_coleopteraOmni
			class coleopteraOmniShort {};
			class coleopteraDashShort {};
            class coleopteraEnergy {}; // COL_fnc_coleopteraEnergy
            class customWoundHandler {}; // COL_fnc_customWoundHandler
			class shortSwitch {}; // COL_fnc_shortSwitch
			class longSwitch {}; // COL_fnc_longSwitch
			class soundChange {}; // COL_fnc_soundChange
			class shortChange {}; // COL_fnc_shortChange
			class longChange {}; // COL_fnc_longChange
			class useBattery {}; // COL_fnc_useBattery
        };
    };
    class COL_Init {
        class functions {
            file = "COL_Functions\functions";
            class coleopteraPostInit {
                postInit = 1;
            };
        };
    };
};
class CfgSFX
{
	class coleopteraJSFX0
	{
		sound0[]=
		{
			"COL_Functions\sfx\SLACKJAWBESTSOUNDENGINEER.wav",
			250,
			1,
			25,
			1,
			0,
			0,
			5
		};
		sounds[]={"sound0"};
		empty[]=
		{
			"",
			0,
			0,
			0,
			0,
			0,
			0,
			0
		};
	};
	class coleopteraJSFX1
	{
		sound0[]=
		{
			"COL_Functions\sfx\fresh.ogg",
			250,
			1,
			25,
			1,
			0,
			0,
			5
		};
		sounds[]={"sound0"};
		empty[]=
		{
			"",
			0,
			0,
			0,
			0,
			0,
			0,
			0
		};
	};
};
class CfgVehicles
{
	class COL_JSFX0
	{
        scope=1;
        side=1;
		sound="coleopteraJSFX0";
		vehicleClass="Sounds";
	};
	class COL_JSFX1
	{
        scope=1;
        side=1;
		sound="coleopteraJSFX1";
		vehicleClass="Sounds";
	};
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class COL_batteryUse {
					displayName="Recharge Jetpack";
					condition="[_player,'COL_battery'] call ace_common_fnc_hasItem";
					icon="";
					statement="[_player,'COL_battery'] call COL_fnc_useBattery";
				};
			};
			class Coleoptera_Actions {
				displayName="Jetpack Settings";
                condition="col_action_check";
                statement="";
                icon = "\COL_Functions\ui\menu1.paa";
				class ColeopteraShortType {
					displayName="Short Jump Type";
					condition="";
					statement="";
					icon="\COL_Functions\ui\short0.paa";
					class ColeopteraShortV {
						displayName="Vector";
						condition="";
						statement="[_player,""Vector""] call COL_fnc_shortChange;";
						icon="COL_Functions\ui\vector.paa";
					};
					class ColeopteraShortO {
						displayName="Directional";
						condition="";
						statement="[_player,""Omni""] call COL_fnc_shortChange;";
						icon="COL_Functions\ui\directional.paa";
					};
					class ColeopteraShortD {
						displayName="Dash";
						condition="";
						statement="[_player,""Dash""] call COL_fnc_shortChange;";
						icon="COL_Functions\ui\dash0.paa";
					};
				};
				class ColeopteraLongType {
					displayName="Long Jump Type";
					condition="";
					statement="";
					icon="\COL_Functions\ui\long0.paa";
					class ColeopteraLongV {
						displayName="Vector";
						condition="";
						statement="[_player,""Vector""] call COL_fnc_longChange;";
						icon="COL_Functions\ui\vector.paa";
					};
					class ColeopteraLongO {
						displayName="Directional";
						condition="";
						statement="[_player,""Omni""] call COL_fnc_longChange;";
						icon="COL_Functions\ui\directional.paa";
					};
				};
				class ColeopteraSoundPack {
					displayName="Sound Pack";
					condition="coleopteraAllowSound";
					statement="";
					icon="\COL_Functions\ui\sound0.paa";
					class ColeopteraSoundClassic {
						displayName="Classic";
						condition="";
						//statement="player setVariable ["colSoundPack","COL_JSFX0"];";
						statement="[_player,""COL_JSFX0""] call COL_fnc_soundChange;";
						icon="COL_Functions\ui\classic0.paa";
					};
					class ColeopteraSoundFresh {
						displayName="Fresh";
						condition="";
						//statement="player setVariable ["colSoundPack","COL_JSFX1"];;";
						statement="[_player,""COL_JSFX1""] call COL_fnc_soundChange;";
						icon="COL_Functions\ui\fresh0.paa";
					};
				};
			};
		};
	};
};
class ACE_Medical_Injuries {
	class damageTypes {
        class woundHandlers;
        class falling {
            class woundHandlers: woundHandlers{
            	COL_Functions = "{call COL_fnc_customWoundHandler;}";
            };
        };
    };
};
class RscTitles
{
	class Coleoptera_Energy_Readout
	{
		idd=2459;
		duration=1e+1000;
		onLoad="uiNamespace setVariable ['coleopteraEnergy', _this select 0]";
		class controls
		{
			class EnergyDisplayControl
			{
				idc=2460;
				type=0;
				style=0;
				x=safeZoneXAbs + 0.01;
				y=safeZoneY - 0.30;
				w=1;
				h=1;
				font="EtelkaNarrowMediumPro";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={0,0.60000002,0,1};
				text="Energy";
			};
		};
	};
	class Project_Airborne_Altitude_Bar
	{
		idd=2479;
		duration=1e+1000;
		onLoad="uiNamespace setVariable ['AltitudeVar', _this select 0]";
		class controls
		{
			class AltitudeDisplayControl
			{
				idc=2480;
				type=0;
				style=0;
				x="safeZoneXAbs";
				y="safeZoneY - 0.40";
				w=1;
				h=1;
				font="EtelkaNarrowMediumPro";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={0,0.60000002,0,1};
				text="Altitude";
			};
		};
	};
};