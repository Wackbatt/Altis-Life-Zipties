//Add this above "if (playerSide isEqualTo west) then {"

_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";
if (crew _curTarget isEqualTo []) then {_Btn4 ctrlEnable false;};
