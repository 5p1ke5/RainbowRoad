/// @description does player things, inherits


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

if (A_BUTTON)
{
	if (instance_exists(grounded))
	{
		vsp = -jumpHeight;
	}
	else //You jump higher if you hold the jump button
	{
		vsp -= jumpOffset;	
	}
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
	if (!instance_exists(grounded)) && (DOWN_BUTTON)
	{
		
		if (carry_throw_instance(0, 1, 0, (bbox_bottom - bbox_top) + (myCarry.bbox_bottom - myCarry.bbox_top) + 2))
		{
			//Double jumps
			vsp = -jumpHeight;
		}
	}
	else if (UP_BUTTON)
	{
		carry_throw_instance(hsp, -jumpHeight, 0, 0);
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
		var _grab = grounded;//collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, all, false, true);
		
		if (variable_instance_get(_grab, "canCarry") == true)
		{
			carry_pickup_instance(_grab);
		}
		
		//Otherwise if nothing was there checks up top next.
		//if (!instance_exists(_grab))
		else {
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

if (instance_exists(grounded))
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

event_inherited();