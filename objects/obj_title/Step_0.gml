// Inherit the parent event
event_inherited();

if (FACE_BUTTON_RELEASED)
{
	switch (options[optionSelected]) 
	{   
		case "Continue":
			savegame_load(SAVEFILE);
		break;
		case "New Game":
			room_goto(ROOM_START)
		break;
	}
}

