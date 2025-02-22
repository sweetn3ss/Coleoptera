if (!hasInterface) exitWith {};
_getPack = backpack player;
_coleopteraCheck = (configFile >> "cfgVehicles" >> _getPack >> "isColeoptera") call bis_fnc_getCfgDataBool;
_shortJumpCost = (configFile >> "CfgVehicles" >> _getPack >> "shortJumpCost") call BIS_fnc_getCfgData;
if (_coleopteraCheck isEqualTo true) then {
    if (_shortJumpCost < coleopteraEnergy) then {
        if (inputAction "MoveForward" > 0) then {
			player setVelocityModelSpace [0, 8, 10.25];
		} else {
			if (inputAction "MoveBack" > 0) then {
				player setVelocityModelSpace [0, -8, 10.25];
			} else {
				if (inputAction "TurnRight" > 0) then {
					player setVelocityModelSpace [8, 0, 10.25];
				} else {
					if (inputAction "TurnLeft" > 0) then {
						player setVelocityModelSpace [-8, 0, 10.25];
					} else {
						player setVelocityModelSpace [0, 0, 10.25];
					};
				};
			};
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
    };
};