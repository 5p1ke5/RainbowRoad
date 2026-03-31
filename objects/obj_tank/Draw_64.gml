/// @description draws health bar, money.
var _scale = 4;
var _sprite = spr_heart;
var _width = (sprite_get_width(_sprite) * _scale) + sprite_get_width(_sprite);
var _text = "Boss: ";
var _textW = string_width(_text)
var _x = window_get_width() / 4
var _y = window_get_height() * 7 / 8

var _scale = 3;

for (var _i = 0; _i < hp; _i++) 
{
	draw_sprite_ext(_sprite, 0, _x + (_textW * _scale) + _i * _width, _y, 4, 4, 0, c_white, 1);
}

draw_set_halign(fa_left);
draw_text_transformed(_x, _y, _text, _scale, _scale, 0);