/*
  File: fn_zip_tie.sqf
  Author: Wackbatt | 76561198071769386
  Desciption: Give's robbers the ability to ziptie the player they have captured.
  Notes: File closely based off fn_restrain.sqf written by TAW_Tonic.
  Origin: Altisliferpg.com and armargplife.com
*/
private["_rebel","_player","_vehicle"];
_rebel = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
_vehicle = vehicle player;
if(isNull _rebel) exitWith {};

//Monitor excessive restrainment
[] spawn {
	private "_time";
	for "_i" from 0 to 1 step 0 do {
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};

		if(!(player getVariable ["ziptied",FALSE])) exitWith {};
		if(!([civilian,getPos player,30] call life_fnc_nearUnits) && (player getVariable ["ziptied",FALSE]) && isNull objectParent player) exitWith {
			player setVariable ["ziptied",FALSE,TRUE];
			player setVariable ["Escorting",FALSE,TRUE];
			player setVariable ["transporting",false,true];
			player setVariable ["transporting",false,true];
			player setVariable ["gagged",false,true];
			player setVariable ["blindfolded",false,true];
			detach player;
			titleText[localize "STR_ExcessiveTied","PLAIN"];
		};
	};
};

titleText[format[localize "STR_tied",_rebel getVariable ["realname",name _rebel]],"PLAIN"];

life_disable_getIn = true;
life_disable_getOut = false;

while {player getVariable  "ziptied"} do {
	if(isNull objectParent player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getVariable "ziptied") || vehicle player != _state};

	if(!alive player) exitWith {
		player setVariable ["ziptied",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;
	};

	if(!alive _rebel) then {
		player setVariable ["Escorting",false,true];
		detach player;
	};

	if(vehicle player != player && life_disable_getIn) then {
		player action["eject",vehicle player];
	};

	if((vehicle player != player) && (vehicle player != _vehicle)) then {
		_vehicle = vehicle player;
	};

	if(isNull objectParent player && life_disable_getOut) then {
		player moveInCargo _vehicle;
	};

	if((vehicle player != player) && life_disable_getOut && (driver (vehicle player) == player)) then {
		player action["eject",vehicle player];
		player moveInCargo _vehicle;
	};

	if(vehicle player != player && life_disable_getOut) then {
		_turrets = [[-1]] + allTurrets _vehicle;
		{
			if (_vehicle turretUnit [_x select 0] == player) then {
				player action["eject",vehicle player];
				sleep 1;
				player moveInCargo _vehicle;
			};
		}forEach _turrets;
	};
};

//disableUserInput false;

if(alive player) then {
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	detach player;
};
