#include "\a3\editor_f\Data\Scripts\dikCodes.h"

player ExecVM "Project_Airborne_Functions\Functions\Project_Airborne_Jetpack\fn_Project_Airborne_Jetpack_Energy.sqf";
player ExecVM "Project_Airborne_Functions\Functions\Project_Airborne_Jetpack_Spec\fn_Project_Airborne_Jetpack_Spec_Energy.sqf";
["Project Airborne", "Project_Airborne_Jetpack", "Jump With Jumppack", {

player ExecVM "Project_Airborne_Functions\Functions\Project_Airborne_Jetpack\fn_Project_Airborne_Jetpack_Omni.sqf";
player ExecVM "Project_Airborne_Functions\Functions\Project_Airborne_Jetpack\fn_Project_Airborne_Jetpack.sqf";
player ExecVM "Project_Airborne_Functions\Functions\Project_Airborne_Jetpack\fn_Project_Airborne_Jetpack_One.sqf";

}, { }, [DIK_SPACE, [false, true, false]], false, -1, false] call cba_fnc_addKeybind;
["Project Airborne", "Project_Airborne_Jetpack_Short", "Short Jump With Jumppack", {

player ExecVM "Project_Airborne_Functions\Functions\Project_Airborne_Jetpack\fn_Project_Airborne_Jetpack_Omni_Short.sqf";
player ExecVM "Project_Airborne_Functions\Functions\Project_Airborne_Jetpack\fn_Project_Airborne_Jetpack_Short.sqf";

}, { }, [DIK_LALT, [false, true, false]], false, -1, false] call cba_fnc_addKeybind;
["Project Airborne", "Project_Airborne_Jetpack_Spec", "Use Jetpack (Hold)", {

_jump = ["Project_Airborne_JLTS_Clone_Jetpack","Project_Airborne_JLTS_Clone_Jetpack_RTO"];
_test = ["OPTRE_Test_Jumppack"];
_backpack = backpack player;
player setVariable ["PEJetpackOn", 1];
if ( _backpack in _jump ) then {
	player ExecVM "Project_Airborne_Functions\Functions\Project_Airborne_Jetpack_Spec\fn_Project_Airborne_Jetpack_Spec.sqf";
};
if ( _backpack in _test) then {
	player ExecVM "Project_Airborne_Functions\Functions\Project_Airborne_Jetpack\fn_OPTRE_Jumppack.sqf";
};

}, 
{ 

player setVariable ["PEJetpackOn", 2];

}, [DIK_SPACE, [false, true, false]], false, -1, false] call cba_fnc_addKeybind;