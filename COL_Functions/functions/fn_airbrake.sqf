if (!hasInterface) exitWith {};
_getPack = backpack player;
_coleopteraCheck = (configFile >> "cfgVehicles" >> _getPack >> "isColeoptera") call bis_fnc_getCfgDataBool;
_shortJumpCost = (configFile >> "CfgVehicles" >> _getPack >> "shortJumpCost") call BIS_fnc_getCfgData;
if (_coleopteraCheck isEqualTo true) then {
    _stopVel = (velocityModelSpace player) vectorMultiply 0.15;
    player setVelocityModelSpace _stopVel;
    coleopteraEnergy = coleopteraEnergy - _shortJumpCost;
    _SoundStop = createSoundSource ["coleopteraJSFXA", getPosASL player, [], 0];
    _SoundStop attachto [vehicle player];
    waitUntil { istouchingground player };
    deleteVehicle _SoundStop;
};