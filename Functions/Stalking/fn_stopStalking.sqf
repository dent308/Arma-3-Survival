#include "..\..\Headers\Stalker Global Strings.hpp"
/* ----------------------------------------------------------------------------
Function: BLWK_fnc_stopStalking

Description:
	Stops a unit from stalking and readjusts the stalker counts for the unit
	 they were stalking.

Parameters:
	0: _stalkerGroup : <OBJECT> - The group that you want to stop being a stalker
	1: _defaultPosition : <OBJECT, GROUP, or ARRAY> - The position for the 
	 _stalkerGroup to travel to and patrol if (OPTIONAL)

Returns:
	BOOL

Examples:
    (begin example)

		[aStalkerGroup,positionToGoTo] call BLWK_fnc_stopStalking;

    (end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
params [
	["_stalkerGroup",grpNull,[grpNull]],
	["_defaultPosition",objNull,[objNull,grpNull,[]]]
];

if (isNull _stalkerGroup) exitWith {
	"BLWK_fnc_stopStalking _stalkerGroup isNull" call BIS_fnc_error;

	false
};
if (isNil {_stalkerGroup getVariable DO_STALK_VAR}) exitWIth {
	"BLWK_fnc_stopStalking _stalkerGroup was not stalking" call BIS_fnc_error;

	false
};
_stalkerGroup setVariable [DO_STALK_VAR,nil];


private _stalkerGroupUnits = units _stalkerGroup;
if (_stalkerGroupUnits isEqualTo []) exitWith {
	_stalkerGroup setVariable [STALKED_UNIT_VAR,nil];
	true
};

// update stalker count
private _stalkedUnit = _stalkerGroup getVariable STALKED_UNIT_VAR;
if (!isNull _stalkedUnit) then {
	private _numberOfStalkers = _stalkedUnit getVariable [STALKER_COUNT_VAR,0];
	_stalkerGroup setVariable [STALKED_UNIT_VAR,nil];
	_stalkedUnit setVariable [STALKER_COUNT_VAR,_numberOfStalkers - (count _stalkerGroupUnits)];
};

// remove events
private "_id_temp";
_stalkerGroupUnits apply {
	_id_temp = _x getVariable UNIT_KILLED_EVENT_VAR;
	_x removeEventHandler ["KILLED",_id_temp];
};

// move units to default position if defined
if (!isNull _defaultPosition) then {
	[_stalkerGroup, _defaultPosition, 100, 3, "MOVE", "AWARE"] call CBAP_fnc_taskPatrol;
};


true