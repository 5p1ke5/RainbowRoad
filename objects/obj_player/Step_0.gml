/// @description does player things, inherits physics
event_inherited();

if (RESTART_BUTTON)
{
	room_restart();	
}

#region ///Movement Controls.

//Interacts with things like doors by pressing the up button.
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
	//If the player is holding an item lets them double jump off of that item by throwing it downards.
	else if (instance_exists(myCarry))
	{
		if (carry_throw_instance(0, 0, 0, (bbox_bottom - bbox_top) + (myCarry.bbox_bottom - myCarry.bbox_top) + 5))
		{
			vsp = -jumpHeight;
		}
	}
} 
//Offsets gravity to allow for jump cancelling
else if (A_BUTTON) 
{
	vsp -= jumpOffset;		
}

///Movement
//What direction the instance is trying to move. 1 is right, 0 is neutral, -1 is left.
hDir = RIGHT_BUTTON - LEFT_BUTTON;

//Pressing X makes the player run faster and animate faster too.
if (X_BUTTON_PRESSED)
{
	image_speed = animSpeedRun;
}

if (X_BUTTON_RELEASED)
{
	image_speed = animSpeed;	
}

//If hDir is non-zero adds to hsp every frame and also sets facing direction.
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
	//If an instance is being carried tries to throw it.
	if (instance_exists(myCarry))
	{
		//Can be thrown down if jumping, up, or neutral.
		if (!grounded) && (DOWN_BUTTON)
		{
			carry_throw_instance(0, 0, 0, (bbox_bottom - bbox_top) + (myCarry.bbox_bottom - myCarry.bbox_top) + 5)
		}
		else if (UP_BUTTON)
		{
			carry_throw_instance(0, -jumpHeight, 0, vsp - 2);
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
//Specifically objects that are meant to be touched / you're 'inside' them.
//Blocks/walls are part of physics.

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
			continue;
		}
		
		
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
doll_animate();

#endregion

//update alert
alert = "";

if (interact)
{
	alert += "?";
}

if (grab) && !(instance_exists(myCarry))
{
	alert += "!";	
}

//parallax
//var _layer = layer_get_id("Parallax");

//if (_layer)
//{
//	layer_y(_layer, y/2);
//}