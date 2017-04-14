//Replace case 19

case 19: {
    if (_shift) then {_handled = true;};
    if (_shift && playerSide isEqualTo west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "Escorting")} && {!(cursorObject getVariable "restrained")} && {speed cursorObject < 1}) then {
        [] call life_fnc_restrainAction;
    } else {
        [] call zipties_fnc_zip_tieAction;
    };
};
