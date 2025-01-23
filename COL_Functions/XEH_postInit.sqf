PlzNoFallMommy = false;
player ExecVM "COL_Functions\functions\fn_coleopteraEnergy.sqf";

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
	[2,64,2,0],
	1
] call CBA_fnc_addSetting;