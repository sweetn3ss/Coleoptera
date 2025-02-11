#include "\a3\editor_f\Data\Scripts\dikCodes.h"
PlzNoFallMommy = false;
player ExecVM "COL_Functions\functions\fn_coleopteraEnergy.sqf";
_longJumpType = "Vector";
_shortJumpType = "Omni";

[ // jetpack energy recharge time
	"coleopteraERate",
	"SLIDER",
	["Recharge Interval","The interval in seconds between energy deposits into the player's pool. May require mission restart."],
	"Coleoptera Settings",
	[1,5,1,0],
	1
] call CBA_fnc_addSetting;

[ // jetpack energy recharge amount
	"coleopteraEIncrease",
	"SLIDER",
	["Recharge Amount","The amount of energy deposited after the interval defined above. Does not require mission restart."],
	"Coleoptera Settings",
	[2,50,2,0],
	1
] call CBA_fnc_addSetting;

[ // jetpack energy max amount
	"coleopteraMaxEnergy",
	"SLIDER",
	["Default Max Energy","The maximum amount of energy that a non-config pack can have. Does not require mission restart."],
	"Coleoptera Settings",
	[25,250,100,0],
	1
] call CBA_fnc_addSetting;

[
"Coleoptera",
"colOmniShort",
"Short Jump with Jetpack",
{[] execVM "COL_Functions\functions\fn_coleopteraOmniShort.sqf";},
""
] call CBA_fnc_addKeybind;

[
"Coleoptera",
"colOmniLong",
"Long Jump with Jetpack",
{[] execVM "COL_Functions\functions\fn_coleopteraOmni.sqf";},
""
] call CBA_fnc_addKeybind;