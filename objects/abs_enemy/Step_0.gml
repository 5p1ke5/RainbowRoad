/// @description Overrides parent. In addition to phys_step() in the 'else' clause it also has a hitbox.

if (carrier)
{
	carry_carried_step();
}
else
{
	phys_step();
	
	//The hitbox checks if it was hit, and if so validates that and takes damage if it was a valid hit.
	var _hitInstances = hitbox_step_instance_array();
	
	if (array_length(_hitInstances) > 0)
	{
		var _validate_hit = function (element, index)
		{
			return (element.collision) && (abs(element.hsp) > 0 || abs(element.vsp) > 0)
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
}

//Does moving platform things
moving_platform_step();