/// @description hitbox things. If hit destroys self, can only be destroyed by thrown objects.
var _hit = hitbox_step();

if (_hit)
{
	if (collision_validate(_hit))
	{
		if (_hit.thrown)
		{
			audio_play_sound(sfx_shoot, 1, false);
			instance_destroy();	
		}
	}
}