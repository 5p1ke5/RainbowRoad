///@function carry_initialize(_carrier, _canCarry, _carried)
///@description Initializes variables for an object that can be carried.
///@param _canCarry Whether or not the object can currently be carrie
///@param _carrier The instance currently carrying this one.
function carry_initialize(_canCarry = true, _carrier = noone)
{
	canCarry = _canCarry;
	carrier = _carrier;
	
	//If the object has a mask sets originalMask to the mask_index. Otherwise sets it as the object's sprite.
	originalMask = (mask_index == -1) ? sprite_index : mask_index;
}

///@function carry_carried_step()
///@description Makes the carried object follow the carrier. Should usually be put in the step event.
function carry_carried_step()
{
	//X is alligned with carrier's x, y is so that the sprite's bottom is on the character's top.
	x = carrier.x;
	y = carrier.y - (sprite_get_bbox_bottom(originalMask) - sprite_get_bbox_top(originalMask));
}


///@function carry_pickup_instance(_pickup)
///@descrption Makes the calling instance pick up a carriable object.
///@param _pickup Instance to be picked up.
function carry_pickup_instance(_pickup)
{
	myCarry = _pickup;
	
	var _self = self;
	
	with (_pickup)
	{
		carrier = _self;
		mask_index = MASK_BLANK;
	}
}

///@function carry_throw_instance(_hsp, _vsp, _xOffset, _yOffset)
///@description Checks if a held instance can be placed in a given position, and if so makes the calling instrance throw its held instance. 
///@return True if successfully thrown, false if not.
///@param _hsp hsp to gve the thrown instance.
///@param _vsp vsp to gve the thrown instance.
///@param _xOffset x position to teleport the instance to relative to the calling instance.
///@param _yOffset y position to teleport the instance to relative to the calling instance.
function carry_throw_instance(_hsp, _vsp, _xOffset = 0, _yOffset = 0)
{
	
	with (myCarry)
	{
		mask_index = originalMask;
		
		//Check collision first. If one is there cancels by resetting mask_index and returning.
		if (! place_empty(x + _xOffset, y + _yOffset, all))
		{
			mask_index = MASK_BLANK;
			return false;
		}
		
		carrier = noone;
		
		hsp = _hsp;
		vsp = _vsp;
		
		x += _xOffset;
		y += _yOffset;
	}
	
	myCarry = noone;
	return true;
}