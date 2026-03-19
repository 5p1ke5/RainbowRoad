/// @description When interacted with destroys self and replaces self with closed door. If only door left restarts level.
if (instance_number(obj_hotelDoorOpen) == 1)
{
	room_restart();	
	global.money += 3;
	
	audio_play_sound(sfx_coin, 1, false);
}
else
{
	instance_create_depth(x, y, depth, obj_hotelDoorClosed);
	instance_destroy();
	
	audio_play_sound(sfx_lever, 1, false);
}
