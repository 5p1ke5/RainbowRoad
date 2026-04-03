// Inherit the parent event
event_inherited();

if (FACE_BUTTON_RELEASED)
{
	switch (options[optionSelected]) 
	{   
		case "Yes":
				file_delete(SAVEFILE);
				file_delete(HOUSEFILE);
				room_goto(ROOM_START);
		break;
		case "No":
				room_goto(ROOM_TITLE);
		break;
	}
}

