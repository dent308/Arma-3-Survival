#include "..\..\Headers\descriptionEXT\GUI\musicManagerCommonDefines.hpp"

params ["_addButtonControl","_removeButtonControl"];

_addButtonControl ctrlAddEventHandler ["ButtonClick",{
	params ["_control"];
	
	private _availableMusicListControl = (uiNamespace getVariable "BLWK_musicManager_control_songsList");

	private _selectedIndex = lnbCurSelRow _availableMusicListControl;
	if (_selectedIndex isEqualTo -1) then {
		hint "You need to have a selection made from the songs list";
	} else {
		// class name of song is stored in its data
		[TO_STRING(BLWK_PUB_CURRENT_PLAYLIST),_availableMusicListControl lnbData [_selectedIndex,0]] remoteExecCall ["KISKA_fnc_pushBackToArray",0,true];
	};
}];

_removeButtonControl ctrlAddEventHandler ["ButtonClick",{
	params ["_control"];
	
	private _selectedIndex = lbCurSel (uiNamespace getVariable "BLWK_musicManager_control_currentPlaylist");
	if (_selectedIndex isEqualTo -1) then {
		hint "You need to have a selection made from the Current Playlist";
	} else {
		// class name of song is stored in its data
		[TO_STRING(BLWK_PUB_CURRENT_PLAYLIST),_selectedIndex] remoteExecCall ["KISKA_fnc_deleteAtArray",0,true];
	};
}];