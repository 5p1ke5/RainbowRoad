/// @description Draws arms, body. Flickers if taken damage. 

if (flicker % 5 != 0)
{
	if (myCarry)
	{
		draw_sprite_ext(spr_armBUp, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
		draw_self();
		draw_sprite_ext(spr_armAUp, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_armB, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
		draw_self();
		draw_sprite_ext(spr_armA, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
	}
}

var _alert = "";

///TODO: Move this to step event somehow.
if (interact)
{
	_alert += "?";
}

if (grab) && !(myCarry)
{
	_alert += "!";	
}

draw_text_color(x, bbox_top - string_height(_alert), _alert, c_black, c_black, c_black, c_black, 1);