
///@function savegame_save(_file)
///@description Saves the game to an ini file.
///@param _file Name of the file to save to.
function savegame_save(_file)
{
	//ini_open(_file);

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
	
	//ini_close();
}

///@function savegame_load(_file)
///@description Loads the game from an ini file.
///@param _file Name of the file to load.
function savegame_load(_file)
{
	//ini_open(_file);

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

	//ini_close();
}

///@function savegame_delete(_file)
///@description Clears an ini file 
///@param _file Name of the file to revert.
function savegame_delete(_file)
{
	//ini_open(_file);

	////First clears both sections.
	//ini_section_delete("STATS");
	//ini_section_delete("INVENTORY");
	
	//ini_close();
}