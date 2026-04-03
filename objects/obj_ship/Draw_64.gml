draw_set_halign(fa_center);
draw_text_transformed_colour(window_get_width()/2, (window_get_height() / 4) + 5, islandName, 4, 4, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(window_get_width()/2, window_get_height() / 4, islandName, 4, 4, 0, c_white, c_white, c_white, c_white, 1);

if (islandName != "")
{
	draw_text_transformed_colour(window_get_width()/2, (window_get_height() / 2) + 5, "Press a button to embark!", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_colour(window_get_width()/2, window_get_height() / 2, "Press a button to embark!", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
}



draw_set_halign(fa_left);