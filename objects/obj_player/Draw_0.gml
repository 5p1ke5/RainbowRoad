/// @description Flickers if taken damage

if (flicker % 5 != 0)
{
	draw_self();
	//draws top hitbox
	
}


if (place_meeting(x, y, abs_interactable))
{
	draw_text_color(x, bbox_top - string_height("?"), "?", c_black, c_black, c_black, c_black, 1);
}