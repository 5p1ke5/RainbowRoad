/// Functions for the ocean world map.

/// @function mapMarker_initialize(_roomTo, _name, _description)
/// @description Initializes variabeles for a map marker on the world map.
/// @param _roomTo The room you go to when you land here.
/// @param _islandName The name that will be displayed as the island name.
/// @param _description The description of the island that will be displayed.
function mapMarker_initialize(_roomTo, _islandName, _description)
{
	roomTo = _roomTo;
	islandName = _islandName;
	description = _description;
}