//params ["_player"];
private _colJTL = player getVariable "colJumpTypeLong";
private _colJumpTypeLong = toLower _colJTL; 
switch (_colJumpTypeLong) do {
    case "omni": {player execVM "COL_Functions\functions\fn_coleopteraOmni.sqf";};
    case "vector": {player execVM "COL_Functions\functions\fn_coleopteraVector.sqf";};
    case default {
        hint parseText "<t color=#ff0000>INVALID JUMP TYPE</t>\nCONSULT SUICIDE BOOTH FOR FURTHER INFORMATION"
    };
};