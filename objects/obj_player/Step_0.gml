/// @description does player things, inherits


event_inherited();

///Controls.
hDir = RIGHT_BUTTON - LEFT_BUTTON;

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

//Lets you pick up stuff if you're on top of it.
if (B_BUTTON_PRESSED) && (instance_exists(myCarry))
{
	if (!grounded) && (DOWN_BUTTON)
	{
		
		if (carry_throw_instance(0, vsp + 1, 0, (bbox_bottom - bbox_top) + (myCarry.bbox_bottom - myCarry.bbox_top) + 5))
		{
			//Double jumps if holding A
			if (A_BUTTON)
			{
				vsp = -jumpHeight;
			}
			else //otherwise just cancels vsp (experimental, cool but registers as a collision)
			{
				vsp = 0;
				y = y+1;
			}
		}
	}
	else if (UP_BUTTON)
	{
		carry_throw_instance(0, -jumpHeight, 0, 0);
	}
	else
	{
		carry_throw_instance(facing * 3, -2);
	}
}
else if (B_BUTTON_PRESSED)
{
	//If not carrying an object, tries to lift whatever's underfoot.
	if (!instance_exists(myCarry))
	{
		//Checks just below the character first
		var _grab = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, all, false, true);
		
		if (variable_instance_get(_grab, "canCarry") == true)
		{
			carry_pickup_instance(_grab);
		}
		 
		else 
		{
			_grab = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top - 1, all, false, true);
			
			if (variable_instance_get(_grab, "canCarry") == true)
			{
				carry_pickup_instance(_grab);
			}
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