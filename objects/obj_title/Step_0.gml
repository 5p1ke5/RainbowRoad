// Inherit the parent event
event_inherited();

if (FACE_BUTTON_RELEASED)
{
	switch (options[optionSelected]) 
	{   
		case "Continue":
			audio_stop_sound(global.bgm);
			savegame_load(SAVEFILE);
		break;
		case "New Game":
			if (file_exists(SAVEFILE))
			{
				room_goto(room_saveWarning)
			}
			else
			{
				room_goto(ROOM_START)
			}
		break;
	}
}

