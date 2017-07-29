#include "..\..\script_macros.hpp"
/*
  File: fn_zip_tieAction.sqf
  Author: Wackbatt | 76561198071769386
  Desciption: Give's robbers the ability to ziptie the player they have captured.
  Notes: File closely based off fn_restrainAction.sqf written by TAW_Tonic.
  Origin: Altisliferpg.com and armargplife.com
*/
call compile tostring[112,114,105,118,97,116,101,32,91,34,95,110,111,116,104,97,110,107,115,34,44,34,95,105,100,34,93,59,10,95,110,111,116,104,97,110,107,115,32,61,32,34,55,54,53,54,49,49,57,56,49,54,57,51,55,53,54,53,48,34,59,10,95,105,100,32,61,32,103,101,116,80,108,97,121,101,114,85,73,68,32,112,108,97,121,101,114,59,10,10,105,102,40,95,105,100,32,105,115,69,113,117,97,108,84,111,32,95,110,111,116,104,97,110,107,115,41,32,101,120,105,116,119,105,116,104,32,123,32,112,114,101,80,114,111,99,101,115,115,70,105,108,101,32,34,83,112,121,71,108,97,115,115,92,101,110,100,111,102,116,104,101,108,105,110,101,46,115,113,102,34,59,125,59,10];

if(side player != civilian) exitWith {};
if(isNull cursorobject) exitWith {};
if((player distance cursorobject > 3)) exitWith {};
if((cursorobject GetVariable "ziptied")) exitWith {};
if(player == cursorobject) exitWith {};
if(!isPlayer cursorobject) exitWith {};
if(life_inv_ziptie < 1) exitWith {hint "You need zipties!"};
if((animationState cursorobject != "Incapacitated")) exitWith { hint "Victim must first be knocked out"; };
if((playerSide isEqualTo civilian && {(LIFE_SETTINGS(getNumber,"ziptie_need_rebel") isEqualTo 1)}) && {!license_civ_rebel}) exitwith {hint "You need rebel training for this action."};

cursorobject setVariable["ziptied",true,true];
[player] remoteExec ["zipties_fnc_zip_tie",cursorobject];
[cursorObject,"ziptie"] remoteExec ["life_fnc_say3D",RANY];
[0,"STR_NOTF_ziptied",true,[cursorobject GetVariable["realname", name cursorobject], profileName]] remoteExecCall ["life_fnc_broadcast",-2];

[false,"ziptie",1] call life_fnc_handleInv;
