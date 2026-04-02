/// @description does player things, inherits physics
event_inherited();

if (START_BUTTON_RELEASED)
{
	room_persistent = true;
	global.roomPausedFrom = room;
	room_goto(room_pauseMenu);	
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
if (A_BUTTON) 
{
	//Jumpoffset can depend on held item
	var _balloonOffset = (instance_exists(myCarry) && (myCarry.object_index == obj_balloon)) * jumpOffset / 2;
	var _jumpOffset = jumpOffset + _balloonOffset;
	vsp -= _jumpOffset;
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
	
	//If the player touches lava or something they just die. Exits the loop cause at that point it doesn't matter what else theyre touchin.
	if (object_is_family(_collisions[_i], abs_lethal))
	{
		player_die();
		break;
	}
	
	//If flicker is activated then a hit has been registered and can exit the loops step from here.
	if (flicker > 0)
	{
		continue;	
	}
	
	if (object_is_family(_collisions[_i], abs_enemyCarry))
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


#region /// Demo stuff
if (keyboard_check(ord("1")))
{
	transition_goto(room_atrium, 1700, 672);
}

if (keyboard_check(ord("2")))
{
	transition_goto(room_beach, 126, 2043);
}

if (keyboard_check(ord("3")))
{
	transition_goto(room_flowerFields, 128, 2064);
}

if (keyboard_check(ord("4")))
{
	transition_goto(room_city, 96, 2288);
}

if (keyboard_check(ord("5")))
{
	transition_goto(room_sky, 2304, 2400);
}

if (keyboard_check(ord("6")))
{
	transition_goto(room_skyPalaceE, 944, 720);
}

if (keyboard_check(ord("7")))
{
	transition_goto(room_dirtIsland, 176, 672);
}

if (keyboard_check(ord("8")))
{
	transition_goto(room_lavaIsle, 96, 2048);
}

if (keyboard_check(ord("9")))
{
	transition_goto(room_motherAndDaughterIsle, 96, 2048);
}



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

var _layer = layer_get_id("Parallax");

if (_layer)
{
	//works for 1280 high backgrounds, haven't tested it on others.
	//layer_y(_layer, y - (960 * (y / room_height) ));
	//layer_y(_layer, y/10);
}