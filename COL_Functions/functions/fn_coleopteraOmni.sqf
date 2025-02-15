if (!hasInterface) exitWith {};
_getPack = backpack player;
_coleopteraCheck = (configFile >> "cfgVehicles" >> _getPack >> "isColeoptera") call bis_fnc_getCfgDataBool;
_longJumpCost = (configFile >> "CfgVehicles" >> _getPack >> "longJumpCost") call BIS_fnc_getCfgData;
if (_coleopteraCheck isEqualTo true) then {
    if (_longJumpCost < coleopteraEnergy) then {
        if (inputAction "MoveForward" > 0) then {
			player setVelocityModelSpace [0, 16, 20.5];
		} else {
			if (inputAction "MoveBack" > 0) then {
				player setVelocityModelSpace [0, -16, 20.5];
			} else {
				if (inputAction "TurnRight" > 0) then {
					player setVelocityModelSpace [16, 0, 20.5];
				} else {
					if (inputAction "TurnLeft" > 0) then {
						player setVelocityModelSpace [-16, 0, 20.5];
					} else {
						player setVelocityModelSpace [0, 0, 20.5];
					};
				};
			};
		};
        player allowdamage false;
        coleopteraEnergy = coleopteraEnergy - _longJumpCost;
        //private _colSoundPack = player getVariable "colSoundPack";
        _Sound = createSoundSource [(player getVariable "colSoundPack"), position player, [], 0];
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
        player allowdamage true;
    };
};