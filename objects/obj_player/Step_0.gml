/// @description does player things, inherits


event_inherited();

///Controls.
if (RESTART_BUTTON)
{
	room_restart();	
}


hDir = RIGHT_BUTTON - LEFT_BUTTON;

if (UP_BUTTON_RELEASED)
{
	var _interactable = instance_place(x, y, abs_interactable);
	
	with (_interactable)
	{
		event_user(0);
	}
}

if (X_BUTTON_PRESSED)
{
	image_speed = animSpeedRun;
}

if (X_BUTTON_RELEASED)
{
	image_speed = animSpeed;	
}

if (A_BUTTON_PRESSED)
{
	if (grounded)
	{
		
		audio_play_sound(sfx_jump, 1, false);
		vsp = -jumpHeight;
		hsp += hspExt;
		hspExt = 0;
	}
} 
else if (A_BUTTON)
{
	vsp -= jumpOffset;		
}


///Movement
if (hDir != 0)
{
	hsp = phys_force_add(hsp, accel * hDir, maxSpeed + (0.5 * maxSpeed * X_BUTTON))

	
	facing = hDir;
}



//The object being targeted to grab.
grab = carry_grab();

//Lets you pick up stuff if you're on top of it.
if (B_BUTTON_RELEASED) && (instance_exists(myCarry))
{
	if (!grounded) && (DOWN_BUTTON)
	{
		if (carry_throw_instance(0, 0, 0, (bbox_bottom - bbox_top) + (myCarry.bbox_bottom - myCarry.bbox_top) + 5))
		{
			vsp = -jumpHeight;
		}
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
else if (!instance_exists(myCarry))
{
	
	if (B_BUTTON_RELEASED)
	{
		if (grab)
		{
			carry_pickup_instance(grab)	
		}
	}
}	

//Timers
if (flicker >= 0)
{
	flicker--;	
}

///Set sprite properties.
image_xscale = facing;


if (grounded)
{
	if (hDir == 0)
	{
		if (!instance_exists(myCarry))
		{
			sprite_index = spr_player;	
		}
		else
		{
			sprite_index = spr_playerCarry;			
		}
	}
	else
	{
		if (!instance_exists(myCarry))
		{
			sprite_index = spr_playerRun;	
		}
		else
		{
			sprite_index = spr_playerRunCarry;			
		}
	}
}
else
{
	if (!instance_exists(myCarry))
	{
		sprite_index = spr_playerJump;	
	}
	else
	{
		sprite_index = spr_playerJumpCarry;			
	}
}