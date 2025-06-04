/// @description Attempts to write to the file.

var _roomName = room_get_name(room);
var _fName = _roomName + ".dat";
var _file = file_text_open_write(_fName);

var _jsonString = "";

//Clears the file..
file_text_write_string(_file, "");


//get all objects from the room and write their serialized versions to a file using json_stringify
for (var _i = 0; _i < instance_count; _i++) 
{
	var _instance = instance_find(all, _i);
	
	if (_instance.object_index != BLOCK) &&
	(_instance.object_index != ONEWAY) &&
	(_instance.object_index != PLAYER) &&
	(_instance.object_index != obj_home) &&
	(!object_is_family(_instance, abs_interactableTransition)) &&
	(instance_exists(PLAYER) && PLAYER.myCarry != _instance)
	{
		var _serializedInstance = serialize_instance_extended(_instance);	
		show_debug_message("Instance written to struct: " + string(_serializedInstance));
		
		_jsonString = _jsonString + json_stringify(_serializedInstance) + "\n";
	}
}
		
file_text_write_string(_file, _jsonString);


file_text_close(_file);