/// @description Initialize variables.

if (file_exists(SAVEFILE))
{
	var _options = ["Continue", "New Game"]
}
else
{
	var _options = ["New Game"];	
}

menu_initialize(_options);