// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);

draw_text_ext(window_get_width()/2, window_get_height()/16, text, string_height(text), room_width * 3/4)

if (flicker % 4 != 0)
{
	draw_text_ext(window_get_width()/2, window_get_height() * 7/8, "Press space to continue.", string_height(text), room_width * 3/4)		
}

