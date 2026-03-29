// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);

draw_text_ext_transformed(window_get_width()/2, window_get_height()/16, text, string_height(text), room_width/4, 4, 4, 0);

draw_sprite_ext(spr_star, 0, window_get_width() / 6, window_get_height() / 4, 2, 2, 0, c_white, 1);
draw_text_ext_transformed(window_get_width() / 6, window_get_height()  / 3, "Stars - " + string(star_total()), string_height(text), room_width/3, 2, 2, 0);

draw_sprite_ext(spr_starShard, 0, window_get_width() / 6, window_get_height() * 7 / 16, 2, 2, 0, c_white, 1);
draw_text_ext_transformed(window_get_width() / 6, window_get_height()  / 2, "Star Shards - " + string(starShard_number() % 5), string_height(text), room_width/3, 2, 2, 0);

if (flicker % 4 != 0)
{
	draw_text_ext_transformed(window_get_width()/2, window_get_height() * 7/8, "Press start to continue.", string_height(text), room_width /4, 2, 2, 0)		
}

