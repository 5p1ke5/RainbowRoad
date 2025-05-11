/// @description If mouse is down goes to the pet screen.
if (MOUSE_LEFT_BUTTON_RELEASED)
{
	clicks++;
	
	if (clicks =2)
	{
		room_goto(PET);	
	}
}