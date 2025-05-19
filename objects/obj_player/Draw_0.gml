/// @description Flickers if taken damage

if (flicker % 5 != 0)
{
	draw_self();
}

var _alert = "";

if (place_meeting(x, y, abs_interactable))
{
	_alert += "?";
}

if (grab) && !(myCarry)
{
	_alert += "!";	
}

draw_text_color(x, bbox_top - string_height(_alert), _alert, c_black, c_black, c_black, c_black, 1);