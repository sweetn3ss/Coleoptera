coleopteraEnergy = 100;
_coleopteraMaxEnergy = 100;
_coleopteraERate = 1;
_coleopteraEIncrease = 2;
_uiShowing = false;
// systemChat "We ballin.";
if (!hasInterface) exitWith {};
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
            2459 cutRsc ["Coleoptera_Energy_Readout","PLAIN"];
        };
        if (coleopteraEnergy < _coleopteraMaxEnergy) then {
            if (_uiShowing isEqualTo false) then {
                uiNameSpace getVariable "coleopteraEnergy" displayCtrl 2460 ctrlSetText "Energy "+str(coleopteraEnergy);
            };
        };
        if (coleopteraEnergy > _coleopteraMaxEnergy) then { // godawful max charge clamp
            coleopteraEnergy = _coleopteraMaxEnergy;
            _uiShowing = false;
            2459 cutText ["", "PLAIN"];
        };
    } else {
        2459 cutText ["", "PLAIN"];
    };
    sleep _coleopteraERate;
};