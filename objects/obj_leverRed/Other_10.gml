///@description When called activates all 'red' triggered objects and anything linked with it.

with (obj_gateRed)
{
	event_user(0);
}

//Also flips x axis.
image_xscale = -image_xscale;

audio_play_sound(sfx_lever, 1, false);