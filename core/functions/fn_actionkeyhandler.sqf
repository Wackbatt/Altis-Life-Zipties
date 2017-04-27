/*
Add the following above

if (playerSide isEqualTo west && {player getVariable ["isEscorting",false]}) exitWith {
    [] call life_fnc_copInteractionMenu;
};

*/

if (playerSide isEqualTo civilian && {player getVariable ["isEscorting",false]}) exitWith {
    [] call zipties_fnc_zip_interaction;
};

/*
add the following below

if ((_curObject getVariable ["restrained",false]) && !dialog && playerSide isEqualTo west) then {
    [_curObject] call life_fnc_copInteractionMenu;
};
*/

if ((_curObject getVariable ["ziptied",true]) && !dialog) then {
    [_curObject] call zipties_fnc_zip_interaction;
};
