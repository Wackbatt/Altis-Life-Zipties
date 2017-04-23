/*
  File: fn_zip_gagPlayer.sqf
  Author: Wackbatt | 76561198071769386
  Desciption: Give's robbers the ability to gag the player they have captured.
  Notes: N/A
  Origin: Altisliferpg.com and armargplife.com
*/
if(player getVariable ["gagged",true]) then {
  hint "You have been un-gagged.";
  5 enableChannel true;
  player setvariable ["gagged",false,true];
 } else {
  hint "You have been gagged by someone.";
  5 enableChannel false;
  player setvariable ["gagged",true,true];
};
