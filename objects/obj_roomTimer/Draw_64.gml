/// @description Draws time

var _x = window_get_width()/10;
var _y = window_get_height() * 9 / 10;
var _time = string(time/game_get_speed(gamespeed_fps))

draw_text_colour(_x, _y, "Time: " + _time, c_white, c_white, c_white, c_white, 1);