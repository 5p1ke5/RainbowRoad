/// @description If Space is down restarts room.
if (A_BUTTON_PRESSED)
{
	global.roomPrev = room;
	room_goto(room_reset);
}