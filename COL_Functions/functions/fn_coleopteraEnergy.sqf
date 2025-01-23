coleopteraEnergy = 100;
_coleopteraMaxEnergy = 100;
_coleopteraERate = 1;
_coleopteraEIncrease = 2;
// systemChat "We ballin.";
while {alive player} do {
    _getPack = backpack player;
    _coleopteraCheck = (configFile >> "cfgVehicles" >> _getPack >> "isColeoptera") call bis_fnc_getCfgDataBool;
    if (_coleopteraCheck isEqualTo true) then {
        _fromConfigCheck = (configFile >> "cfgVehicles" >> _getPack >> "takeFromConfig") call bis_fnc_getCfgDataBool;
        if (_fromConfigCheck isEqualTo true) then {
            _coleopteraMaxEnergy = (configFile >> "cfgVehicles" >> _getPack >> "maxEnergy") call bis_fnc_getCfgData;
            _coleopteraERate = (configFile >> "cfgVehicles" >> _getPack >> "chargeRate") call bis_fnc_getCfgData;
            _coleopteraEIncrease = (configFile >> "cfgVehicles" >> _getPack >> "chargeAmount") call bis_fnc_getCfgData;
        } else {
            _coleopteraMaxEnergy = coleopteraMaxEnergy;
            _coleopteraERate = coleopteraERate;
            _coleopteraEIncrease = coleopteraEIncrease;
        };
        if (_coleopteraMaxEnergy > coleopteraEnergy) then {
            coleopteraEnergy = coleopteraEnergy + _coleopteraEIncrease;
        };
        if (coleopteraEnergy > _coleopteraMaxEnergy) then { // godawful max charge clamp
            coleopteraEnergy = _coleopteraMaxEnergy;
        };
    };
    sleep _coleopteraERate;
};