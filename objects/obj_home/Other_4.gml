/// @description Attempts ot open the ini file section for this room, then spawns the read instances.

var _roomName = room_get_name(room);
var _fName = _roomName + ".dat";

show_debug_message("Accessing {0}", _fName);

var _file = file_text_open_read(_fName);




//If the file was found, reads through it and initializes objects from the json strings.
if (_file)
{
	while (!file_text_eof(_file))
	{
		var _json = file_text_readln(_file);
		
		var _struct = json_parse(_json);
		show_debug_message(_struct);
		
		var _instance = instance_deserialize(_struct, _struct.x, _struct.y, -2000);
		with (_instance)
		{
			depth = -2000;	
		}
		show_debug_message(_instance.depth);
	}

	file_text_close(_file);
}