/// @description does player things, inherits
event_inherited();

if (RESTART_BUTTON)
{
	room_restart();	
}

#region ///Movement Controls.


interact = instance_place(x, y, abs_interactable);

if (UP_BUTTON_RELEASED)
{
	with (interact)
	{
		event_user(0);
	}
}

//Jumping.
if (A_BUTTON_PRESSED) //Jumps
{
	if (grounded)
	{
		audio_play_sound(sfx_jump, 1, false);
		vsp = -jumpHeight;
		hsp += hspExt;
		hspExt = 0;
	}
	else if (instance_exists(myCarry))
	{
		if (carry_throw_instance(0, 0, 0, (bbox_bottom - bbox_top) + (myCarry.bbox_bottom - myCarry.bbox_top) + 5))
		{
			vsp = -jumpHeight;
		}
	}
} 
else if (A_BUTTON) //Offsets gravity to allow for jump cancelling
{
	vsp -= jumpOffset;		
}

///Running
hDir = RIGHT_BUTTON - LEFT_BUTTON;

if (X_BUTTON_PRESSED)
{
	image_speed = animSpeedRun;
}

if (X_BUTTON_RELEASED)
{
	image_speed = animSpeed;	
}

if (hDir != 0)
{
	hsp = phys_force_add(hsp, accel * hDir, maxSpeed + (0.5 * maxSpeed * X_BUTTON))
	facing = hDir;
}
#endregion




#region ///Grab n throw controls

//The object being targeted to grab.
grab = carry_grab_target();

//Lets you throw stuff.
if (B_BUTTON_RELEASED) 
{
	//If a carry object exists tries to throw it.
	if (instance_exists(myCarry))
	{
		if (!grounded) && (DOWN_BUTTON)
		{
			carry_throw_instance(0, 0, 0, (bbox_bottom - bbox_top) + (myCarry.bbox_bottom - myCarry.bbox_top) + 5)
		}
		else if (UP_BUTTON)
		{
			carry_throw_instance(0, -jumpHeight, 0, 0);
		}
		else
		{
			carry_throw_instance(facing * 3, -2, 0, vsp - 2);
		}
	}
	//Otherwise tiries to pick the target object up.
	else
	{
		if (grab)
		{
			carry_pickup_instance(grab)	
		}
	}
}

#endregion


#region ///Collision

var _collisions = hitbox_step_instance_array();

//Goes through all the collisions and processes each one.
for (var _i = 0; _i < array_length(_collisions); _i++) 
{   
	//If flicker is activated then a hit has been registered and the loop can be broken.
	if (flicker > 0)
	{
		break;	
	}
	
	if (object_is_family(_collisions[_i], abs_enemy))
	{
		//Ignores if it's a carried object or if collision is off.
		if ((myCarry) && (myCarry.id == _collisions[_i].id)) || !(_collisions[_i].collision)
		{
			break;	
		}
		
		
		//if (bbox_bottom + 1 > _collisions[_i].bbox_top - 1)
		if !(bbox_bottom < _collisions[_i].bbox_top)
		{
			player_hit();
		}
	}
	else //Otherwise its a hazard.
	{
		player_hit();	
	}
}




#endregion

#region ///Set sprite properties.
image_xscale = facing;

if (grounded)
{
	if (hDir == 0)
	{
		sprite_index = spr_player;	
	}
	else
	{
		sprite_index = spr_playerRun;	
	}
}
else
{
	sprite_index = spr_playerJump;		
}

#endregion

//update alert
alert = "";

if (interact)
{
	alert += "?";
}

if (grab) && !(myCarry)
{
	alert += "!";	
}

//parallax
var _layer = layer_get_id("Parallax");

if (_layer)
{
	layer_y(_layer, y/2);
}