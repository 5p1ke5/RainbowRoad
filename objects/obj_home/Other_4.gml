/// @description Attempts ot open the ini file section for this room, then spawns the read instances.

//var _fName = "housing.ini";
//var _roomName = room_get_name(room);
//var _i = 0;

//show_debug_message("Accessing {0}", _fName);

//ini_open(_fName);

//if (ini_section_exists(_roomName))
//{
//	while (ini_key_exists(_roomName, _i))
//	{
//		var _json = ini_read_string(_roomName, _i++, "noone");
		
//		show_debug_message(_json);
		
//		var _struct = json_parse(_json);
	
//		instance_deserialize(_struct, _struct.x, _struct.y, _struct.depth);
//	}
//}

//ini_close();