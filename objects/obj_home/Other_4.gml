/// @description Attempts ot open the ini file section for this room, then spawns the read instances.

var _roomName = room_get_name(room);
var _fName = _roomName + ".dat";
var _file = file_text_open_read(_fName);

//If the file was found, reads through it and initializes objects from the json strings.
if (_file)
{
	while (!file_text_eof(_file))
	{
		//Reads the json string from each line of the ext file, then parses it into a valid struct.
		var _json = file_text_readln(_file);
		
		//make sure it's a valid JSon.
		if (string_char_at(_json, 0) == "{")
		{
			var _struct = json_parse(_json);
	
			//Once the struct has been parsed deserializes it into an instance.
			var _instance = instance_deserialize_depth(_struct, _struct.x, _struct.y, depth);	
		}	
	}

	file_text_close(_file);
}