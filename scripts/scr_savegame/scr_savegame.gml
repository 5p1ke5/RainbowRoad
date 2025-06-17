
///@function savegame_save(_file)
///@description Saves the game to an ini file.
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
	}
	
	
	ini_open(_file);

		//Ini migh read the json_stringify stuff wrong might have to use a normal file.
	ini_write_real("SAVE", "room", room);
	ini_write_real("SAVE", "spawnX", global.spawnX);
	ini_write_real("SAVE", "spawnY", global.spawnY);
	ini_write_string("SAVE", "myCarry", json_stringify(global.carried));
	ini_write_real("SAVE", "bgm", global.bgm);
	
	ini_write_real("SAVE", "redShards", global.redShards);
	ini_write_string("SAVE", "shardsFound", json_stringify(global.shardsFound));
	
	ini_write_real("SAVE", "hp", global.hp);
	ini_write_real("SAVE", "maxHp", global.maxHP);
	
	////First clears both sections.
	//ini_section_delete("STATS");
	//ini_section_delete("INVENTORY");

	//ini_write_real("STATS", "hunger", global.hunger);
	//ini_write_real("STATS", "food", global.food);
	//ini_write_real("STATS", "money", global.money);
	//ini_write_real("STATS", "happiness", global.happiness);
	//ini_write_real("STATS", "color", global.color);
	//ini_write_real("STATS", "roomIndex", global.roomIndex);

	////Saves inventory.
	//for (var _i = 0; _i < array_length(global.inventory); _i++) 
	//{
	//	ini_write_string("INVENTORY", string(_i), object_get_name(global.inventory[_i]));
	//}
	
	ini_close();
}

///@function savegame_load(_file)
///@description Loads the game from an ini file.
///@param _file Name of the file to load.
function savegame_load(_file)
{
	ini_open(_file);

	//global.hunger = ini_read_real("STATS", "hunger", 100);
	//global.food = ini_read_real("STATS", "food", 0);
	//global.money = ini_read_real("STATS", "money", 0);
	//global.happiness = ini_read_real("STATS", "happiness", 100);
	//global.color = ini_read_real("STATS", "color", c_white);
	//global.roomIndex = ini_read_real("STATS", "roomIndex", 0);


	////Reads from the inventory section.
	
	//global.inventory = []; //Resets inventory.
	//var _i = 0;
	//while ini_key_exists("INVENTORY", string(_i)) 
	//{
	//	var _read = ini_read_string("INVENTORY", string(_i), "obj_inventoryBlueDye");
	//    global.inventory[_i] = asset_get_index(_read);
	//	_i++;
	//}

	ini_close();
}

///@function savegame_delete(_file)
///@description Clears an ini file 
///@param _file Name of the file to revert.
function savegame_delete(_file)
{
	ini_open(_file);

	////First clears both sections.
	//ini_section_delete("STATS");
	//ini_section_delete("INVENTORY");
	
	ini_close();
}