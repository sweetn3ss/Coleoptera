coleopteraEnergy = 100;
_coleopteraMaxEnergy = 100;
_coleopteraERate = 1;
_coleopteraEIncrease = 2;
while {alive player} do {
    _getPack = backpack player;
    _coleopteraCheck = (configFile >> "cfgVehicles" >> _getPack >> "isColeoptera") call bis_fnc_getCfgDataBool;
    if (_coleopteraCheck isEqualTo true) then {
        if (_coleopteraMaxEnergy > coleopteraEnergy) then {
            _coleopteraERate = coleopteraERate;
            _coleopteraEIncrease = coleopteraEIncrease;
            coleopteraEnergy = coleopteraEnergy + _coleopteraEIncrease;
        };
        if (coleopteraEnergy > _coleopteraMaxEnergy) then { // godawful max charge clamp
            coleopteraEnergy = _coleopteraMaxEnergy;
        };
    };
    sleep _coleopteraERate;
};