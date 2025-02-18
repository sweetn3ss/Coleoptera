params ["_unit", "_batteryClass"];

[
	"Recharging Jetpack",
	10, // time in seconds
	{alive player;}, // condition
	{
		_unit removeItem _batteryClass;
		_coleopteraChargeAdded = (configFile >> "cfgWeapons" >> _batteryClass >> "batteryCapacity") call bis_fnc_getCfgData;
        coleopteraEnergy = coleopteraEnergy + _coleopteraChargeAdded;
	}, // script on success
	{hint "Aborted Recharge";} // script on failure
] call cba_fnc_progressBar;