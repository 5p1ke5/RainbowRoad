// Inherit the parent event
event_inherited();

if (FACE_BUTTON_RELEASED)
{
	switch (optionSelected) 
	{   
		default:
			room_goto(ROOM_START)
		break;
	}
}
