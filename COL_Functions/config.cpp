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
            class coleopteraEnergy {}; // COL_fnc_coleopteraEnergy
            class customWoundHandler {}; // COL_func_customWoundHandler
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
	class coleopteraJSFX
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
};
class CfgVehicles
{
	class COL_JSFX
	{
        scope=1;
        side=1;
		sound="coleopteraJSFX";
	};
};
class ACE_Medical_Injuries {
	class damageTypes {
        class woundHandlers;
        class falling {
            class woundHandlers: woundHandlers {
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
