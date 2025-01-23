_getPack = backpack player;
_coleopteraEnergy = 100;
_coleopteraMaxEnergy = 100;
while (true) do {
    _coleopteraCheck = (configFile >> "cfgVehicles" >> _getPack >> "isColeoptera") call bis_fnc_getCfgDataBool;
    if (_coleopteraCheck isEqualTo true) then {
        if (_coleopteraMaxEnergy > _coleopteraEnergy) then {
            _coleopteraERate = coleopteraERate;
            _coleopteraEIncrease = coleopteraEIncrease;
            _coleopteraEnergy = _coleopteraEnergy + _coleopteraEIncrease;
        };
    };
    sleep _coleopteraERate;
};