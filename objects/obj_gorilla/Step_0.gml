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


//Jumps at player.

//Decrements jumpTimer while grounded
var _player = instance_nearest(x, y, obj_player);

if (instance_exists(_player))
{
	jumpTimer -= grounded;
	
	var _hDir = sign(_player.x - x);
	
	//When jumpTimer goes off jumps in direction of player and resets timer..
	if (jumpTimer < 0)
	{
		hsp = 3 * _hDir;
		vsp = -3;
		
		jumpTimer = jumpCD;
		
		if (_hDir != 0)
		{
			image_xscale = _hDir;	
		}
	}
	
}
image_index = !grounded;