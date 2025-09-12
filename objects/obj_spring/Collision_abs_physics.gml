var _bounceHeight = bounceHeight

with (other)
{
	vsp = _bounceHeight;
}

image_speed = 1;
	
if (!audio_is_playing(sound))
{
	audio_play_sound(sfx_spring, 1, false);
}