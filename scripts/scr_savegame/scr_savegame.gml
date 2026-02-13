//TODO: Make these ini files?


///@function savegame_save(_file)
///@description Saves the game to a text file.
///@param _file Name of the file to save to.
function savegame_save(_file)
{
	//Has player notify the game has been saved, updates some globals before calling the save function that will actually save them
	with (PLAYER)
	{
		npc_speak("Game saved!", "Player");
		global.spawnX = x;
		global.spawnY = y;
		
		if (myCarry)
		{
			global.carried = serialize_instance(myCarry);	
		}
		else
		{
			global.carried = noone;	
		}
		
		//Saves appearance components.
		global.playerDoll = doll_struct(faceIndex, hairIndex, shirtIndex, pantsIndex, shoeIndex, skinColor, hairColor, shirtColor, pantsColor, shoeColor);
	}
	
	var _textFile = file_text_open_write(_file);
	
	file_text_write_real(_textFile, room);
	file_text_writeln(_textFile);
	file_text_write_real(_textFile, global.spawnX);
	file_text_writeln(_textFile);
	file_text_write_real(_textFile, global.spawnY);
	file_text_writeln(_textFile);
	file_text_write_real(_textFile, global.bgm);
	file_text_writeln(_textFile);
	
	file_text_write_string(_textFile, json_stringify(global.carried)); //Serializes the struct to a string
	file_text_writeln(_textFile);
	
	file_text_write_real(_textFile, global.redShards);
	file_text_writeln(_textFile);
	file_text_write_string(_textFile,json_stringify(global.shardsFound));
	file_text_writeln(_textFile);
	
	file_text_write_real(_textFile, global.hp);
	file_text_writeln(_textFile);
	
	file_text_write_real(_textFile, global.maxHP);
	file_text_writeln(_textFile);
	
	file_text_write_string(_textFile, json_stringify(global.playerDoll));
	file_text_writeln(_textFile);
	
	file_text_close(_textFile);
}

///@function savegame_load(_file)
///@description Attempts to load the game from a text file. Returns true if the load was successful, false if not.
///@param _file Name of the file to load.
function savegame_load(_file)
{
	//If the file was not found returns false.
	if !(file_exists(_file))
	{
		return false;	
	}
	
	var _textFile = file_text_open_read(_file);
	
	//If no file was found returns false.
	if !(_textFile)
	{
		return false;
	}

	var _roomTo = real(file_text_readln(_textFile));
	global.spawnX = real(file_text_readln(_textFile));
	global.spawnY = real(file_text_readln(_textFile));
	global.bgm = real(file_text_readln(_textFile));
	
	global.carried = json_parse(file_text_readln(_textFile));
	
	global.redShards = real(file_text_readln(_textFile));
	global.shardsFound = json_parse(file_text_readln(_textFile));
	
	global.hp = real(file_text_readln(_textFile));
	global.maxHP = real(file_text_readln(_textFile));
	global.playerDoll = json_parse(file_text_readln(_textFile));
	
	file_text_close(_textFile);

	transition_goto(global.spawnX, global.spawnY, _roomTo);
}

///@function savegame_delete(_file)
///@description Clears an ini file 
///@param _file Name of the file to revert.
//function savegame_delete(_file)
//{
//	ini_open(_file);

//	//First clears both sections.
//	ini_section_delete("STATS");
//	ini_section_delete("INVENTORY");
	
//	ini_close();
//}