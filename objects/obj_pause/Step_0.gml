/// @description Increments flicker, awaits input
flicker++;

if (START_BUTTON_RELEASED)
{
	room_goto(global.roomPausedFrom);	
}