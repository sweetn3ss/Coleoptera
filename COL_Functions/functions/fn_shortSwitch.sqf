//params ["_player"];
private _colJTS = player getVariable "colJumpTypeShort";
private _colJumpTypeShort = toLower _colJTS;
switch (_colJumpTypeShort) do {
    case "omni": {player execVM "COL_Functions\functions\fn_coleopteraOmniShort.sqf";};
    case "vector": {player execVM "COL_Functions\functions\fn_coleopteraVectorShort.sqf";};
    case "dash": {player execVM "COL_Functions\functions\fn_coleopteraDashShort.sqf"};
    default {
        hint parseText "<t color=#ff0000>INVALID JUMP TYPE</t>\nCONSULT SUICIDE BOOTH FOR FURTHER INFORMATION"
    };
};