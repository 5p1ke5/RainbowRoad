//If not being carried does NPC stuff.
if (!carrier)
{  
	var _player = instance_nearest(x, y, obj_player);
	
	if (_player)
	{
		if (grounded)
		{
			hDir = sign(_player.x - x) == 0 ? 1 : sign(_player.x - x);
			image_xscale = hDir;
			hsp = hDir * spd;
		}
	}

}



var _spawn = spawner_step(x, y, depth);

if (_spawn)
{
	var _x = x + (97 * hDir);
	var _y = y + 16 + (increment * 32);
	var _xscale = image_xscale;
	
	with (_spawn)
	{
		x = _x;
		y = _y; 
		image_xscale = _xscale;
		hsp = spd * image_xscale;
	}
	
	increment = 1 - increment;
}

// Inherit the parent event
event_inherited();