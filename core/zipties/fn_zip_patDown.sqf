/*
  File: fn_zip_patDown.sqf
  Author: Wackbatt | 76561198071769386
  Desciption: Give's robbers the ability to pat down the player they have captured.
  Notes: File closely based off file written by Scotty from Realmenofgenius.
  Origin: Altisliferpg.com and armargplife.com
*/
private["_handguns","_holder","_items","_primaryweapons","_safeItems","_secondaryweapons","_weapons"];

_safeItems = ["FirstAidKit","ItemRadio","ItemMap","ItemCompass","ItemGPS","ItemWatch","NVGoggles","Rangefinder","Binocular"];

0 cutText["Your weapons and ammo have been removed!","PLAIN"];

_weapons = [];

_primaryweapons = primaryWeaponItems player;
_secondaryweapons = secondaryWeaponItems player;
_handguns = handGunItems player;
_mags = magazinesAmmoFull player;

{player removeMagazine _x} foreach (magazines player);

if(primaryWeapon player != "") then
{
	_weapons pushBack (primaryWeapon player);
	player removeWeapon (primaryWeapon player);
};

if(secondaryWeapon player != "") then
{
	_weapons pushBack (secondaryWeapon player);
	player removeWeapon (secondaryWeapon player);
};

if(handgunWeapon player != "") then
{
	_weapons pushBack (handgunWeapon player);
	player removeWeapon (handgunWeapon player);
};

{
	_items = _x;
	{
		player unassignItem _x;
		player removeItem _x;
	}forEach _items;
}forEach [_handguns, _primaryweapons, _secondaryweapons];

{
	if (!(_x in _safeItems)) then
	{
		player removeItem _x;
		_weapons pushBack _x;
	};
}forEach (weapons player);

 _holder = createVehicle [ "GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE" ];
{
  _holder addWeaponCargoGlobal [_x,1];
}forEach _weapons;

{
	_holder addMagazineCargoGlobal [_x select 0,1];
}forEach _mags;

{
	_items = _x;
	{
		_holder addItemCargoGlobal [_x,1];
	}forEach _items;
}forEach [_handguns, _primaryweapons, _secondaryweapons];

[3] spawn SOCK_fnc_updatePartial;
