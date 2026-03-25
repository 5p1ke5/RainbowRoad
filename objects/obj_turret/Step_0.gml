/// @description Inherits, does spawner things.

event_inherited();

var _x = (image_xscale == 1) ? bbox_right : bbox_left;
var _y = y + 2;
var _xscale = image_xscale;

var _spawn = spawner_step(_x, _y, depth);

if (_spawn)
{
	with (_spawn)
	{
		image_xscale = _xscale;
		hsp = spd * image_xscale;
	}
	
	image_speed = 1;
	audio_play_sound(sfx_shoot, 1, false);
}