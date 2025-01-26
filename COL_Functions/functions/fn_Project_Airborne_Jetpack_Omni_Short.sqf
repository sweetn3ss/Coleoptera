_OmniJumppack = backpack player;
_IsOmniJumppack = (configFile >> "CfgVehicles" >> _OmniJumppack >> "IsOmniJumppack") call BIS_fnc_getCfgDataBool;
_ShortJumpCost = (configFile >> "CfgVehicles" >> _OmniJumppack >> "ShortJumpCost") call BIS_fnc_getCfgData;
if ( _IsOmniJumppack isEqualTo true ) then {
    if (isNull objectParent player) then {
        if ( energy >= _ShortJumpCost ) then {
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
            player allowdamage false;
            energy = energy - _ShortJumpCost;
            _Sound = createSoundSource ["Project_Airborne_Jump_Sound", position player, [], 0];
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
};