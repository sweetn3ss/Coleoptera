if (!hasInterface) exitWith {};
_getPack = backpack player;
_coleopteraCheck = (configFile >> "cfgVehicles" >> _getPack >> "isColeoptera") call bis_fnc_getCfgDataBool;
_shortJumpCost = (configFile >> "CfgVehicles" >> _getPack >> "shortJumpCost") call BIS_fnc_getCfgData;
_packCanSwap = (configFile >> "CfgVehicles" >> _getPack >> "colCanOpen") call BIS_fnc_getCfgDataBool;
private _swappedBag = false;
if (_coleopteraCheck isEqualTo true) then {
    if (_shortJumpCost < coleopteraEnergy) then {
        private _f_velo = coleopteraYeetStrengthShort;
        private _v_velo = coleopteraUpBoostShort;

        private _v_hat = getCameraViewDirection player;

        private _velocity = [
            (_v_hat select 0) * _f_velo,
            (_v_hat select 1) * _f_velo,
            (_v_hat select 2) * _f_velo + _v_velo
        ];

        player setVelocity _velocity;
        if (_packCanSwap) then {
            _swappedBag = true;
            _packSwapOpen = (configFile >> "CfgVehicles" >> _getPack >> "colOpenBag") call BIS_fnc_getCfgData;
            removeBackpack player;
            player addBackpack _packSwapOpen;
        };
        PlzNoFallMommy = true;
        coleopteraEnergy = coleopteraEnergy - _shortJumpCost;
        //private _colSoundPack = player getVariable "colSoundPack";
        _Sound = createSoundSource [(player getVariable "colSoundPack"), getPosASL player, [], 0];
        _Sound attachto [vehicle player];
        _Smoke1 = "#particlesource" createVehicleLocal [0,0,0]; 
        _Smoke1 setParticleClass "Flare1";
        _Smoke1 attachto [vehicle player,[0.225,-0.1,1.5]];
        _Smoke2 = "#particlesource" createVehicleLocal [0,0,0];
        _Smoke2 setParticleClass "Flare1";
        _Smoke2 attachto [vehicle player,[-0.225,-0.1,1.5]];
        _Sparks1 = "#particlesource" createVehicleLocal [0,0,0];
        _Sparks1 setParticleClass "LaptopSparks";
        _Sparks1 attachto [vehicle player,[0.225,-0.1,1.5]];
        _Sparks2 = "#particlesource" createVehicleLocal [0,0,0];
        _Sparks2 setParticleClass "LaptopSparks";
        _Sparks2 attachto [vehicle player,[-0.225,-0.1,1.5]];
        sleep .1;
        waitUntil { istouchingground player };
        deleteVehicle _Smoke1;
        deleteVehicle _Smoke2;
        deleteVehicle _Sparks1;
        deleteVehicle _Sparks2;
        deleteVehicle _Sound;
        PlzNoFallMommy = false;
        if (_swappedBag) then {
            _getPack2 = backpack player;
            _packSwapClose = (configFile >> "CfgVehicles" >> _getPack2 >> "colClosedBag") call BIS_fnc_getCfgData;
            removeBackpack player;
            player addBackpack _packSwapClose;
        };
    };
};