class cfgPatches {
    class COL_Functions {
        name = "Coleoptera Functions";
        author = "Gray";
        units[]={};
        weapons[]={};
        requiredVersion = 0.1;
        requiredAddons[] = {};
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
        };
    };
    class Keys {
		class KeyInt {
			class colPostInit {
				file = "COL_Functions\XEH_postInit.sqf";
				postInit=1;
			};
		};
	};
};