[
	"Recharging Jetpack",
	10, // time in seconds
	{alive player;}, // condition
	{
		_batteryClass = 
		player removeItem "COL_battery";
        coleopteraEnergy = coleopteraEnergy + coleopteraBatteryAmount;
	}, // script on success
	{hint "Aborted Recharge";} // script on failure
] call cba_fnc_progressBar;