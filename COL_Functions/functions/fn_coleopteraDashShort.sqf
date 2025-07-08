if (!hasInterface) exitWith {};
_getPack = backpack player;
_coleopteraCheck = (configFile >> "cfgVehicles" >> _getPack >> "isColeoptera") call bis_fnc_getCfgDataBool;
_shortJumpCost = (configFile >> "CfgVehicles" >> _getPack >> "shortJumpCost") call BIS_fnc_getCfgData;
_packCanSwap = (configFile >> "CfgVehicles" >> _getPack >> "colCanOpen") call BIS_fnc_getCfgDataBool;
private _swappedBag = false;
if (_coleopteraCheck isEqualTo true) then {
    if (_shortJumpCost < coleopteraEnergy) then {
        if (inputAction "MoveForward" > 0) then {
			player setVelocityModelSpace [0, 8, 5];
		} else {
			if (inputAction "MoveBack" > 0) then {
				player setVelocityModelSpace [0, -8, 5];
			} else {
				if (inputAction "TurnRight" > 0) then {
					player setVelocityModelSpace [8, 0, 5];
				} else {
					if (inputAction "TurnLeft" > 0) then {
						player setVelocityModelSpace [-8, 0, 5];
					} else {
						player setVelocityModelSpace [0, 12, 8];
					};
				};
			};
		};
        
        if (_packCanSwap) then {
            _bagItems = backpackItems player;
            _swappedBag = true;
            _packSwapOpen = (configFile >> "CfgVehicles" >> _getPack >> "colOpenBag") call BIS_fnc_getCfgData;
            removeBackpack player;
            player addBackpack _packSwapOpen;
            {player addItemToBackpack _x} forEach _bagItems;
        };
        PlzNoFallMommy = true;
        coleopteraEnergy = coleopteraEnergy - _shortJumpCost;
        //private _colSoundPack = player getVariable colSoundPack;
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
            _bagItems = backpackItems player;
            _getPack2 = backpack player;
            _packSwapClose = (configFile >> "CfgVehicles" >> _getPack2 >> "colClosedBag") call BIS_fnc_getCfgData;
            removeBackpack player;
            player addBackpack _packSwapClose;
            {player addItemToBackpack _x} forEach _bagItems;
        };
    };
};