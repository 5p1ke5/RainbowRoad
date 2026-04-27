// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);

if (flicker % 4 != 0)
{
	draw_text_ext_transformed(window_get_width()/2, window_get_height() / 2, text, string_height(text), room_width * 3/4, 3, 3, 0);		
}

