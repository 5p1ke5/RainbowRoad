/// @description Draws the speech balloon.

draw_set_halign(fa_left)
draw_set_font(fnt_speech);

var _balloonWidth = string_width_ext(text, string_width(text), TEXT_BALLOON_MAXW);
var _balloonHeight = string_height_ext(text, string_height(text), TEXT_BALLOON_MAXW);

draw_set_alpha(time/maxTime);

//Shadows.
draw_roundrect_color(x - _balloonWidth/2, y, x + _balloonWidth/2 + 10, y + _balloonHeight + 10, c_dkgray, c_dkgray, false);
draw_roundrect_color(x - _balloonWidth/2, y - string_height(name) + 5, x - _balloonWidth/2 + string_width(name) + 10, y + 5, c_dkgray, c_dkgray, false);

draw_roundrect_color(x - _balloonWidth/2 - 5, y - 5, x + _balloonWidth/2 + 5, y + _balloonHeight + 5, c_white, c_white, false);

draw_roundrect_color(x - _balloonWidth/2 - 5, y - string_height(name), x - _balloonWidth/2 + string_width(name) + 5, y, c_gray, c_gray, false);
draw_set_alpha(1);

draw_text_ext_color(x - _balloonWidth/2, y - string_height(name), name, string_height(name), TEXT_BALLOON_MAXW, c_black, c_black, c_black, c_black, time/maxTime);

draw_set_halign(fa_center);
draw_text_ext_color(x, y, text, string_height(text), TEXT_BALLOON_MAXW, c_gray, c_gray, c_gray, c_gray, time/maxTime)
draw_text_ext_color(x, y - 1, text, string_height(text), TEXT_BALLOON_MAXW, c_black, c_black, c_black, c_black, time/maxTime)
draw_set_font(fnt_default);


