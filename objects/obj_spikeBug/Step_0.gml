/// @description Overrides parent. In addition to phys_step() in the 'else' clause it also has a hitbox.

phys_step();
	
//The hitbox checks if it was hit, and if so validates that and takes damage if it was a valid hit
var _hitInstances = hitbox_step_instance_array();
	
if (array_length(_hitInstances) > 0)
{
	var _validate_hit = function (element, index)
	{
		return (element.collision) && (element.thrown);
	}
	
	if (array_any(_hitInstances, _validate_hit))
	{
		hp--;
		
		if (hp <= 0)
		{
			instance_destroy();	
		}
		else
		{		
			flicker = maxFlicker;
		}
		
		audio_play_sound(sfx_enemyHit, 1, false);
	}
	
}

if	(collision_validate(instance_place_array(x + hsp + hDir, y, BLOCK, false))) ||
	(grounded && place_empty(x + hsp + (hDir * (bbox_right - bbox_left)), y + 1, GROUND))
{
	hDir = -hDir;
	image_xscale = hDir;
}

if (grounded)
{
	hsp = hDir * spd;
}