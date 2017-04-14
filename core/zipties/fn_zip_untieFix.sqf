/*
  File: fn_zip_untieFix.sqf
  Author: Wackbatt | 76561198071769386
  Desciption: Give's robbers the ability to untie the player they have captured.
  Notes: N/A
  Origin: Altisliferpg.com and armargplife.com
*/
5 enableChannel true;
player setvariable ["gagged",false,true];
cutText ["","BLACK IN"];
hint "You have been un-blindfolded.";
player setvariable ["blindfolded",false,true];
