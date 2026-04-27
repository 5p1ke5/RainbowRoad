/// @function game_initialize()
/// @description Sets up things right as the game starts. Sets random seed, initializes globals.
function game_initialize()
{
	globals_initialize();
	draw_set_font(fnt_default);
	room_goto(ROOM_CLICK);
	show_debug_message("Game initialized.");
	
	show_debug_message("Random: " + string(my_irandom(32)))
	show_debug_message("Random: " + string(my_irandom(32)))
	show_debug_message("Random: " + string(my_irandom(32)))
	show_debug_message("Random: " + string(my_irandom(32)))
	show_debug_message("Random: " + string(my_irandom(32)))
}