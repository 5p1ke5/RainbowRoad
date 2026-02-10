/// @description Draws arms, body. Flickers if taken damage. 

if (flicker % 5 != 0)
{
	doll_draw();
}

draw_text_color(x, bbox_top - string_height(alert), alert, c_black, c_black, c_black, c_black, 1);