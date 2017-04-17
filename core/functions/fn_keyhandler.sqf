//replace line 24 to 26 with

if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player getVariable ["restrained",false]) || (player getVariable ["playerSurrender",false]) || (player getVariable ["ziptied",false]) || life_isknocked || life_istazed)) exitWith {
    true;
};

//add
!(player getVariable ["ziptied",false])
// to the if statement for case 21

//Replace case 19
case 19: {
    if (_shift) then {_handled = true;};
    if (_shift && playerSide isEqualTo west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "Escorting")} && {!(cursorObject getVariable "restrained")} && {speed cursorObject < 1}) then {
        [] call life_fnc_restrainAction;
    } else {
        [] call zipties_fnc_zip_tieAction;
    };
};
