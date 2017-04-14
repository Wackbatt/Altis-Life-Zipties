#include "..\..\script_macros.hpp"
/*
  File: fn_zip_interaction.sqf
  Author: Wackbatt | 76561198071769386
  Desciption: Give's robbers an interaction menu for players they have tied.
  Notes: Copy & paste of fn_copInteractionMenu.sqf by TAW_Tonic, edited for zipties.
  Origin: Altisliferpg.com and armargplife.com
*/
#define Btn1 37450
#define Btn3 37452
#define Btn4 37453
#define Btn7 37456
#define Title 37401

private ["_display","_curTarget","_seizeRank","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];

disableSerialization;
_curTarget = param [0,objNull,[objNull]];

if!((_curTarget GetVariable "ziptied")) exitWith {};

if(player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if(!dialog) then {
    createDialog "pInteraction_Menu";
};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn7 = _display displayCtrl Btn7;
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText "Un-tie Player";
_Btn1 buttonSetAction "[life_pInact_curTarget] call zipties_fnc_zip_untie; closeDialog 0;";

//Set Search Button
_Btn3 ctrlSetText "Pat Down";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn zipties_fnc_zip_patDownAction; closeDialog 0;";

//Set Escort Button
if(player getVariable ["isEscorting",false]) then {
    _Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn4 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn4 ctrlSetText localize "STR_pInAct_Escort";
    _Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";
