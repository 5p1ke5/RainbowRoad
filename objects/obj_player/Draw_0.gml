/// @description Flickers if taken damage. 

if (flicker % 5 != 0)
{
	draw_self();
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