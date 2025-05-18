///@function carry_initialize(_carrier, _canCarry, _carried)
///@description Initializes variables for an object that can be carried.
///@param _canCarry Whether or not the object can currently be carrie
///@param _carrier The instance currently carrying this one.
///@param _collision Whether the object is recognizing collisions.
function carry_initialize(_canCarry = true, _carrier = noone, _collision = true)
{
	canCarry = _canCarry;
	carrier = _carrier;
	
	collision = _collision;
}

///@function carry_carried_step()
///@description Makes the carried object follow the carrier. Should usually be put in the step event.
function carry_carried_step()
{
	//X is alligned with carrier's x, y is so that the sprite's bottom is on the character's top.
	x = carrier.x;
	y = carrier.bbox_top - (bbox_bottom - bbox_top);
}


///@function carry_pickup_instance(_pickup)
///@descrption Makes the calling instance pick up a carriable object.
///@param _pickup Instance to be picked up.
function carry_pickup_instance(_pickup)
{
	myCarry = _pickup;
	var _self = self;
	
	with (myCarry)
	{
		carrier = _self;
		
		//Does whatever code the object has for being picked up.	
		event_user(USER_EVENTS.U_EVENT_PICKED_UP);
	}
	
	audio_play_sound(sfx_pickup, 0, false);
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
		
		//Check collision first. If one is there cancels by resetting mask_index and returning.
		if (!place_empty(x + _xOffset, y + _yOffset, [BLOCK, ONEWAY_CARRY]))
		{
			return false;
		}
		
		hsp = _hsp;
		vsp = _vsp;
		hspExt = hsp;
		
		x += _xOffset;
		y += _yOffset;
		
		///Does whatever code the thrown object has for being thrown.
		event_user(USER_EVENTS.U_EVENT_THROWN)
		
		
	}
	
	audio_play_sound(sfx_throw, 1, false);
	
	myCarry = noone;
	return true;
}