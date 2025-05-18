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
		var _myCarry = myCarry; //Saves myCarry as a temporary variables.
		if (carry_throw_instance(0, 0, 0, (bbox_bottom - bbox_top) + (myCarry.bbox_bottom - myCarry.bbox_top) + 5))
		{
			//Double jumps if holding A
			if (A_BUTTON)
			{
				vsp = -jumpHeight;
			}
			else //otherwise just cancels hsp & vsp and makes sure the player is above the object.
			{
				hsp = 0;
				vsp = 0;
				while (place_meeting(x, y + 1, _myCarry))
				{
					y--;
				}
			}
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
	
	if (B_BUTTON_PRESSED)
	{
		//Checks just below the character first
		var _grab = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, all, false, true);
		
		if (variable_instance_get(_grab, "canCarry") == true)
		{
			carry_pickup_instance(_grab);
		}
		//Next directly above the character.
		else
		{
			_grab = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top - 1, all, false, true);
		}
			
		if (variable_instance_get(_grab, "canCarry") == true)
		{
			carry_pickup_instance(_grab);
		}
	}
	else if (B_BUTTON)
	{
		var _grab = instance_place(x, y, [BLOCK_CARRY, ONEWAY_CARRY]);	
		
		if (variable_instance_get(_grab, "canCarry") == true)
		{
			carry_pickup_instance(_grab);
		}
		
	}
	/*
	//Checks just below the character first
	var _grab = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, all, false, true);
		
	if (variable_instance_get(_grab, "canCarry") == true)
	{
		carry_pickup_instance(_grab);
	}
		
	//Next checks directly where the characters is.
	else
	{
		_grab = instance_place(x, y, [BLOCK_CARRY, ONEWAY_CARRY]);	
	}
		
	if (variable_instance_get(_grab, "canCarry") == true)
	{
		carry_pickup_instance(_grab);
	}
		
	//Last checks directly above the character.
	else
	{
		_grab = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top - 1, all, false, true);
	}
			
	if (variable_instance_get(_grab, "canCarry") == true)
	{
		carry_pickup_instance(_grab);
	}
	*/
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