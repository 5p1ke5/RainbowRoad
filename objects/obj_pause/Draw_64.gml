// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);

var _textX = window_get_width() / 2;
var _textY = window_get_height() / 16;
var _textHeight = string_height(text) * 2;

var _starX = window_get_width() / 2;
var _starY = window_get_height() / 4;
var _starHeight = sprite_get_height(spr_star) * 2;

var _starShardX = window_get_width() / 2;
var _starShardY = window_get_height() * 7 / 16;
var _starShardHeight = sprite_get_height(spr_starShard) * 2;

draw_text_ext_transformed(_textX, _textY, text, _textHeight, room_width, 4, 4, 0);

draw_sprite_ext(spr_star, 0, _starX, _starY, 2, 2, 0, c_white, 1);
draw_text_ext_transformed(_starX, _starY + _starHeight, "Stars - " + string(star_total()),_textHeight, room_width/3, 2, 2, 0);
draw_text_ext_transformed(_starX, _starY + _starHeight + _textHeight, "Stars In Area - " + string(starsFoundNearby) + " out of " + string(array_length(global.starsNearby)), _textHeight, room_width, 2, 2, 0);

draw_sprite_ext(spr_starShard, 0, _starShardX, _starShardY, 2, 2, 0, c_white, 1);
draw_text_ext_transformed(_starShardX, _starShardY + _starShardHeight, "Star Shards - " + string(starShard_number() % 5),_textHeight, room_width/3, 2, 2, 0);
draw_text_ext_transformed(_starShardX, _starShardY + _starShardHeight + _textHeight, "Star Shards In Area - " + string(starShardsFoundNearby) + " out of " + string(array_length(global.starShardsNearby)), _textHeight, room_width, 2, 2, 0);

if (flicker % 4 != 0)
{
	draw_text_ext_transformed(window_get_width()/2, window_get_height() * 7/8, "Press start to continue.",_textHeight, room_width /4, 2, 2, 0)		
}

