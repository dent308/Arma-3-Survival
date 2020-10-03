/* ----------------------------------------------------------------------------
Function: BLWK_fnc_healPlayer

Description:
	Heals the player when they select the action ont he bulwark

	Executed from "initServer.sqf" & "BLWK_fnc_endWave"

Parameters:
	NONE

Returns:
	NOTHING

Examples:
    (begin example)

		null = [] spawn BLWK_fnc_startWave;

    (end)

Author:
	Hilltop & omNomios,
	Modified by: Ansible2 // Cipher
---------------------------------------------------------------------------- */
if (!isServer OR {!canSuspend}) exitWith {};

// update wave number
private _previousWaveNum = missionNamespace getVariable ["BLWK_currentWaveNumber",0];
missionNamespace setVariable ["BLWK_currentWaveNumber", _previousWaveNum + 1,true];

missionNamespace setVariable ["BLWK_inBetweenWaves",false,true];

call BLWK_fnc_decideWaveType;

// loot is spawned before the wave starts at round 1
if (BLWK_currentWaveNumber > 1) then {
	// this will also clean up previous loot
	call BLWK_fnc_spawnLoot;
};

call BLWK_fnc_cleanUpTheDead;

// loop to check wave end
waitUntil {
	if (call BLWK_fnc_isWaveCleared) exitWith {
		null = [] spawn BLWK_fnc_endWave;
		true
	};

	sleep 3;
	false
};