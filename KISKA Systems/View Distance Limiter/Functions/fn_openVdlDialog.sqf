/* ----------------------------------------------------------------------------
Function: KISKA_fnc_openVdlDialog

Description:
	Opens the GUI for the VDL system.

Parameters:
	NONE
	
Returns:
	BOOL 

Examples:
	(begin example)
		call KISKA_fnc_openVdlDialog;
	(end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
if (!hasInterface) exitWith {false};

disableSerialization;

#include "..\ViewDistanceLimiterCommonDefines.hpp"

createDialog VIEW_DISTANCE_LIMITER_DIALOG_STR;