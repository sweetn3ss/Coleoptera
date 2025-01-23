_getPack = backpack player;
_coleopteraCheck = (configFile >> "cfgVehicles" >> _getPack >> "isColeoptera") call bis_fnc_getCfgDataBool;
_longJumpCost = (configFile >> "CfgVehicles" >> _OmniJumppack >> "longJumpCost") call BIS_fnc_getCfgData;
