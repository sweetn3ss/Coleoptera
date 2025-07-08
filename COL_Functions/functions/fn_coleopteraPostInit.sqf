#include "\a3\editor_f\Data\Scripts\dikCodes.h"
PlzNoFallMommy = false;
//missionNamespace setVariable ["PlzNoFallMommy","false"];
col_action_check = false;
player ExecVM "COL_Functions\functions\fn_coleopteraEnergy.sqf";
player setVariable ["colJumpTypeLong","Omni"];
player setVariable ["colJumpTypeShort","Omni"];
//colJumpTypeLong = "Omni";
//colJumpTypeShort = "Omni";
player setVariable ["colSoundPack","COL_JSFX0"];
// colSoundPack = "COL_JSFX0";

[ // jetpack energy recharge time
	"coleopteraERate",
	"SLIDER",
	["Recharge Interval","The interval in seconds between energy deposits into the player's pool. Does not require mission restart."],
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

[ // jetpack sound changes allowed
	"coleopteraAllowSound",
	"CHECKBOX",
	["Allow Changing Sounds?","Whether players should be able to change their sound pack. Should not require mission restart."],
	"Coleoptera Settings",
	true
] call CBA_fnc_addSetting;

[ // jetpack battery amount of charge
	"coleopteraBatteryAmount",
	"SLIDER",
	["Battery Recharge Amount","The maximum recharge a battery can supply. Does not require mission restart."],
	"Coleoptera Settings",
	[25,250,100,0],
	1
] call CBA_fnc_addSetting;

[ // jetpack vector long mod
	"coleopteraYeetStrength",
	"SLIDER",
	["Vector Long Jump Strength","The vector multiplier for long jump distance. Should not require mission restart."],
	["Coleoptera Settings","Jump Settings"],
	[5,50,20,0],
	1
] call CBA_fnc_addSetting;

[ // jetpack vector long up mod
	"coleopteraUpBoost",
	"SLIDER",
	["Vector Long Jump Up Mod","The vertical compensation for vector long jump. Should not require mission restart."],
	["Coleoptera Settings","Jump Settings"],
	[0,10,5,0],
	1
] call CBA_fnc_addSetting;

[ // jetpack vector short mod
	"coleopteraYeetStrengthShort",
	"SLIDER",
	["Vector Short Jump Strength","The vector multiplier for long jump distance. Should not require mission restart."],
	["Coleoptera Settings","Jump Settings"],
	[5,50,10,0],
	1
] call CBA_fnc_addSetting;

[ // jetpack vector short up mod
	"coleopteraUpBoostShort",
	"SLIDER",
	["Vector Short Jump Up Mod","The vertical compensation for vector long jump. Should not require mission restart."],
	["Coleoptera Settings","Jump Settings"],
	[0,10,2,0],
	1
] call CBA_fnc_addSetting;

[
"Coleoptera",
"colJumpShort",
"Short Jump with Jetpack",
{[_player] execVM "COL_Functions\functions\fn_shortSwitch.sqf";},
""
] call CBA_fnc_addKeybind;

[
"Coleoptera",
"colJumpLong",
"Long Jump with Jetpack",
{[_player] execVM "COL_Functions\functions\fn_longSwitch.sqf";},
""
] call CBA_fnc_addKeybind;

[
"Coleoptera",
"colAirbrake",
"Midair Stop with Jetpack",
{[_player] execVM "COL_Functions\functions\fn_airbrake.sqf";},
""
] call CBA_fnc_addKeybind;