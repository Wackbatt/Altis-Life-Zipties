/*
  File: fn_zip_untie.sqf
  Author: Wackbatt | 76561198071769386
  Desciption: Give's robbers the ability to untie the player they have captured.
  Notes: File closely based off the file fn_unrestrain.sqf written by TAW_Tonic.
  Origin: Altisliferpg.com and armargplife.com
*/
private ["_unit"];
_unit = param [0,objNull,[objNull]];
if (isNull _unit || !(_unit getVariable ["ziptied",false])) exitWith {}; //Error check?

_unit setVariable ["ziptied",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["gagged",false,true];
_unit setVariable ["blindfolded",false,true];
detach _unit;

[player] remoteExec ["zipties_fnc_zip_untieFix",cursorobject];
[0,"STR_NOTF_unzipteed",true,[cursorobject GetVariable["realname", name cursorobject], profileName]] remoteExecCall ["life_fnc_broadcast",-2];
