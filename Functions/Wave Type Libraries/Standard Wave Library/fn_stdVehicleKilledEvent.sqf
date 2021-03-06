/* ----------------------------------------------------------------------------
Function: BLWK_fnc_stdVehicleKilledEvent

Description:
	Executes the code in the standard enemy vehicles killed event
	 for adding points to players and markers.

	Executed from the event added by "BLWK_fnc_stdEnemyVehicles"

Parameters:
	0: _eventInfo: <ARRAY> -
		0: _unit : <OBJECT> - Object the event handler is assigned to
		1: _killer : <OBJECT> - Object that killed _unit – contains unit itself in case of collisions (not used)
		2: _instigator : <OBJECT> - Person who pulled the trigger
		3: _useEffects : <BOOL> - same as useEffects in setDamage alt syntax (not used)
		
	1: _handlerID : <NUMBER> - The eventhandler's id number

Returns:
	NOTHING

Examples:
    (begin example)

		[_this,_thisEventhandler] call BLWK_fnc_stdVehicleKilledEvent;

    (end)

Author(s):
	Hilltop(Willtop) & omNomios,
	Modified by: Ansible2 // Cipher
---------------------------------------------------------------------------- */
params ["_eventInfo","_handlerID"];

private _killedUnit = _eventInfo select 0;
private _instigator = _eventInfo select 2;


// points for players
if (local _instigator AND {isPlayer _instigator} AND {hasInterface}) then {
	private _points = [_killedUnit] call BLWK_fnc_getPointsForKill;
	[_points] call BLWK_fnc_addPoints;
	[_killedUnit,_points,true] call BLWK_fnc_createHitMarker;
};

// mp events need to be removed on the unit where they are local
if (local _killedUnit) then {
	_killedUnit removeMPEventHandler ["MPKILLED",_handlerID];
};