Energy = 150;
_MaxEnergy = 150;
_MaxCharge = 150;
_RechargeTime = 1;
_energyshowing = false;
_attitudeshowing = false;
_UICanShow = false;
_FixError = 1;
while { true } do {
	_Jumppack = backpack player;
	_IsOmniJumppack = (configFile >> "CfgVehicles" >> _Jumppack >> "IsOmniJumppack") call BIS_fnc_getCfgDataBool; 
	_IsJumppack = (configFile >> "CfgVehicles" >> _Jumppack >> "IsJumppack") call BIS_fnc_getCfgDataBool;
	_IsOPTREJumppack = (configFile >> "CfgVehicles" >> _Jumppack >> "IsOPTREJumppack") call BIS_fnc_getCfgDataBool; 
	if ((_IsJumppack isEqualto true) OR (_IsOmniJumppack isEqualto true) OR (_IsOPTREJumppack isEqualto true)) then {
		_Attitude = getPosATL player;
		_Attitude1 = _Attitude select 2;
		_Attitude2 = round _Attitude1;
		AttitudeVar = _Attitude2;
		_RechargeAmount = (configFile >> "CfgVehicles" >> _Jumppack >> "RechargeAmount") call BIS_fnc_getCfgData; 
		_RechargeTime = (configFile >> "CfgVehicles" >> _Jumppack >> "RechargeTime") call BIS_fnc_getCfgData; 
		_MaxCharge = (configFile >> "CfgVehicles" >> _Jumppack >> "MaxCharge") call BIS_fnc_getCfgData; 
		_JumpShowUI = (configFile >> "CfgVehicles" >> _Jumppack >> "JumpShowUI") call BIS_fnc_getCfgDataBool; 
		if (_JumpShowUI isEqualTo true) then {
			if (( _IsOmniJumppack isEqualTo true ) OR ( _IsJumppack isEqualTo true )) then {
				uiNameSpace getVariable "AttitudeVar" displayCtrl 2480 ctrlSetText "Attitude "+str(AttitudeVar);
				_UICanShow = true;
			} else {
				2479 cutText ["", "PLAIN"];
				_attitudeshowing = false;
				_UICanShow = false;
			};
			if (( 150 == Energy ) && ( _UICanShow isEqualTo true )) then {
				if ( _energyshowing isEqualTo true ) then {
					2459 cutText ["", "PLAIN"];
					_energyshowing = false;
				};
			};
			if (( 150 != Energy ) && ( _UICanShow isEqualTo true )) then {
				if ( _energyshowing isEqualTo false ) then {
					2459 cutRsc ["Project_Airborne_Jump_Energy_Bar","PLAIN"];
					_energyshowing = true;
				};
			};
			if (( _attitudeshowing isEqualTo false ) && ( _UICanShow isEqualTo true )) then {
				2479 cutRsc ["Project_Airborne_Attitude_Bar","PLAIN"];
				_attitudeshowing = true;
			};
		};
		if ( 150 > Energy ) then {
			Energy = Energy + _RechargeAmount;
			if ( _UICanShow isEqualTo true ) then {
				uiNameSpace getVariable "Energy" displayCtrl 2460 ctrlSetText "Energy "+str(Energy);
			} else {
				2459 cutText ["", "PLAIN"];
			};
		};
		if (_FixError == 1) then {
			_FixError = 0;
			_MarCharge = 150;
		};
		if (_MaxEnergy != _MaxCharge) then {
			_MaxEnergy = _MaxCharge;
			Energy = _MaxCharge;
		};
	};
	sleep _RechargeTime;
};