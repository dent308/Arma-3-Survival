/* ----------------------------------------------------------------------------
Function: BLWK_fnc_playAreaEnforcementLoop

Description:
	Starts the loop that plays the effects and teleports players back into bounds
	
	It is executed from the "initPlayerLocal.sqf"
	
Parameters:
	NONE

Returns:
	NOTHING

Examples:
    (begin example)

		null = [] spawn BLWK_fnc_playAreaEnforcementLoop;

    (end)
Author(s):
	Hilltop(Willtop) & omNomios,
	Modified by: Ansible2 // Cipher
---------------------------------------------------------------------------- */
if (!hasInterface) exitWith {};
// In the interest of potentially changing the play area dynamically, these percentages of the play area radius will not be cached

waitUntil {!isNil "BLWK_mainCrate" AND {!isNil "BLWK_playAreaCenter"}};

/*
 Each one of these functions checks the successive distance percentage to see if the player is farther away.
 this is so that they do not overlay text on top of each other and to allow one condition check for 
 the vast majority of the time which is when the player is WITHIN the boundries
*/
private _fn_90percentFromCenter = {
	if (BLWK_playerDistanceToTheCrate >= BLWK_playAreaRadius * 0.95) then {
		call _fn_95percentFromCenter;
	} else {
		["<t color='#ffffff'>Warning: Leaving mission area!</t>", 0, 0.1, 2, 0] spawn BIS_fnc_dynamicText;
	};
};
private _fn_95percentFromCenter = {
	if (BLWK_playerDistanceToTheCrate >= BLWK_playAreaRadius * 0.99) then {
		call _fn_99percentFromCenter;
	} else {
		["<t color='#ffff00'>Warning: Leaving mission area!</t>", 0, 0.1, 2, 0] spawn BIS_fnc_dynamicText;
	};
};
private _fn_99percentFromCenter = {
	if (BLWK_playerDistanceToTheCrate >= BLWK_playAreaRadius * 1.1) then {
		call _fn_110percentFromCenter;
	} else {
		["<t color='#ff0000'>Warning: Leaving mission area!</t>", 0, 0.1, 2, 0] spawn BIS_fnc_dynamicText;
	};
};
private _fn_110percentFromCenter = {
	if (BLWK_playerDistanceToTheCrate > BLWK_playAreaRadius * 2) then {
		call _fn_200percentFromCenter;
	} else {
		// blur screen
		private _effectHandle = ppEffectCreate ["DynamicBlur",200];
		_effectHandle ppEffectEnable true;
		_effectHandle ppEffectAdjust [10];
		_effectHandle ppEffectCommit 0.5;

		waitUntil {ppEffectCommitted _effectHandle};

		// put player back eight meters
		private _dir = BLWK_playAreaCenter getDir player;
		private _eightMetersBack = BLWK_playAreaCenter getPos [(BLWK_playAreaRadius * 1.1)-8, _dir];
		player setPos _eightMetersBack;

		// delete effects
		_effectHandle ppEffectAdjust [0];
		ppEffectDestroy _effectHandle;
	};
};
private _fn_200percentFromCenter = {
	private _radius = 2;
	waitUntil {
		if (player setVehiclePosition [BLWK_mainCrate,[],_radius]) exitWith {true};
		_radius = _radius + 0.5;
		sleep 1;
		false;
	};
	hint "Get back here you...";
};

// this global is to have potential supports that put the player outside the immediate play radius
if !(missionNamespace getVariable ["BLWK_enforceArea",false]) then {
	BLWK_enforceArea = true;
};

while {sleep 2; BLWK_enforceArea} do {
	_playerDistanceToTheCrate = player distance2D BLWK_playAreaCenter;

	if (_playerDistanceToTheCrate >= (BLWK_playAreaRadius * 0.9)) then {
		BLWK_playerDistanceToTheCrate = _playerDistanceToTheCrate;
		call _fn_90percentFromCenter;
	};
};