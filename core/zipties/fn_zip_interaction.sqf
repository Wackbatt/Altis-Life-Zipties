#include "..\..\script_macros.hpp"
/*
  File: fn_zip_interaction.sqf
  Author: Wackbatt | 76561198071769386
  Desciption: Give's robbers an interaction menu for players they have tied.
  Notes: Copy & paste of fn_copInteractionMenu.sqf by TAW_Tonic, edited for zipties.
  Origin: Altisliferpg.com and armargplife.com
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

private["_display", "_curTarget", "_Btn1", "_Btn2", "_Btn3", "_Btn4", "_Btn5", "_Btn6", "_Btn7", "_Btn8"];

disableSerialization;
_curTarget = param[0, objNull, [objNull]];

if !((_curTarget GetVariable "ziptied")) exitWith {};

if (player getVariable["Escorting", false]) then {
    if (isNull _curTarget) exitWith {
        closeDialog 0;
    }; //Bad target
    if (player distance _curTarget > 4) exitWith {
        closeDialog 0;
    }; // Prevents menu accessing from far distances.
};

if (!dialog) then {
    createDialog "pInteraction_Menu";
};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
life_pInact_curTarget = _curTarget;

_btn7 ctrlShow false;
_btn8 ctrlShow false;

//Set Unrestrain Button
_Btn1 ctrlSetText "Un-tie Player";
_Btn1 buttonSetAction "[life_pInact_curTarget] call zipties_fnc_zip_untie; closeDialog 0;";

//Set Search Button
_Btn2 ctrlSetText "Pat Down";
_Btn2 buttonSetAction "[life_pInact_curTarget] spawn zipties_fnc_zip_patDownAction; closeDialog 0;";

//Set Escort Button
if (player getVariable["isEscorting", false]) then {
    _Btn3 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn3 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn3 ctrlSetText localize "STR_pInAct_Escort";
    _Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

_Btn4 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

_Btn5 ctrlSetText "Gag Player";
_Btn5 buttonSetAction "[life_pInact_curTarget] call zipties_fnc_zip_gagAction; closeDialog 0;";

_Btn6 ctrlSetText "Blindfold Player";
_Btn6 buttonSetAction "[life_pInact_curTarget] call zipties_fnc_zip_blindfoldAction; closeDialog 0;";
