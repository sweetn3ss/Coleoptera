if (isNull objectParent _unit) then {
    if ( _currentE >= LJUMP_COST ) then {
        if (inputAction "MoveForward" > 0) then {
            _unit setVelocityModelSpace [0, 16, 20.5];
        } else {
            if (inputAction "MoveBack" > 0) then {
                _unit setVelocityModelSpace [0, -16, 20.5];
            } else {
                if (inputAction "TurnRight" > 0) then {
                    _unit setVelocityModelSpace [16, 0, 20.5];
                } else {
                    if (inputAction "TurnLeft" > 0) then {
                        _unit setVelocityModelSpace [-16, 0, 20.5];
                    } else {
                        _unit setVelocityModelSpace [0, 0, 20.5];
                    };
                };
            };
        };
        _unit allowdamage false;
        private _energy = _currentE - LJUMP_COST;
        _Sound = createSoundSource ["Project_Airborne_Jump_Sound", position _unit, [], 0];
        _Sound attachto [vehicle _unit];
        _Smoke1 = "#particlesource" createVehicleLocal [0,0,0];  
        _Smoke1 setParticleClass "Flare1";  
        _Smoke1 attachto [vehicle _unit,[0.225,-0.1,1.5]]; 
        _Smoke2 = "#particlesource" createVehicleLocal [0,0,0];  
        _Smoke2 setParticleClass "Flare1";  
        _Smoke2 attachto [vehicle _unit,[-0.225,-0.1,1.5]];
        _Sparks1 = "#particlesource" createVehicleLocal [0,0,0];  
        _Sparks1 setParticleClass "LaptopSparks";  
        _Sparks1 attachto [vehicle _unit,[0.225,-0.1,1.5]];
        _Sparks2 = "#particlesource" createVehicleLocal [0,0,0];  
        _Sparks2 setParticleClass "LaptopSparks";  
        _Sparks2 attachto [vehicle _unit,[-0.225,-0.1,1.5]];
        sleep 0.1;
        waitUntil { sleep 0.1; istouchingground _unit };
        deleteVehicle _Smoke1;
        deleteVehicle _Smoke2;
        deleteVehicle _Sparks1;
        deleteVehicle _Sparks2;
        deleteVehicle _Sound;
        _unit allowdamage true;
    };
};