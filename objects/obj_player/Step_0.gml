/// @description Inherits, does player things.
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

if (A_BUTTON)
{
	if (grounded)
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
	if (abs(hsp) < maxSpeed + (0.5 * maxSpeed * X_BUTTON))
	{
		hsp += accel * hDir;	
	}
	
	facing = hDir;
}

//Lets you pick up stuff if you're on top of it.
if (B_BUTTON_RELEASED)
{
	//If not carrying an object, tries to lift whatever's underfoot.
	if (!instance_exists(myCarry))
	{
		var _onTop = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, all, false, true);
		
		if (variable_instance_get(_onTop, "canCarry") == true)
		{
			myCarry = _onTop;
			
			_onTop.carrier = self;
			_onTop.mask_index = spr_maskNone;
		}
	}
	else //If carrying an object, throws it.
	{
		var _throwHsp = facing * 3;
		
		with (myCarry)
		{
			carrier = noone;
			mask_index = originalMask;
			
			hsp = _throwHsp;
			vsp = -2;
		}
		
		myCarry = noone;
	}
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