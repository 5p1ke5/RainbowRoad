///@function carry_initialize(_carrier, _canCarry, _carried)
///@description Initializes variables for an instance that can be carried.
///@param _canCarry Whether or not the instance can currently be carried.
///@param _carrier The instance currently carrying this instance.
///@param _collision Whether the instance is recognizing collisions.
function carry_initialize(_canCarry = true, _carrier = noone, _collision = true)
{
	canCarry = _canCarry;
	carrier = _carrier;
	collision = _collision;
	
	//Whether the instance has been thrown.
	thrown = false;
}

/// @function carry_grab_target()
/// @description Selects a target to grab. Checks below, colliding with the instance, and above, in that order. Returns a target, or undefined if none was found..
function carry_grab_target()
{
	//Function to check if collision is on.
	var _canCarry_on = function (element, index) 
	{	
		return (element.canCarry = true) && (element != myCarry);
	};
	
	///We check below the calling instance to see if they are on top of an object. 
	
	//First we get an array of objects within a 1-pixel tall rectangle directly beneath the instance.
	var _array = collision_rectangle_array(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, [BLOCK_CARRY, ONEWAY_CARRY], false, true, false);
	
	//Go through this array using the _canCarry_on function.
	var _i = array_find_index(_array, _canCarry_on);
	
	//If _i == -1 no grabbable instance was found. Otherwise returns the first instance found in the array.
	var _grab = (_i == -1) ? undefined : array_get(_array, _i);
	
	//If an instance was found returns it as the target.
	if (instance_exists(_grab))
	{
		return _grab;	
	}
	
	//Otherwise checks if directly colliding or in front of. Uses similar logic to checking below.
	//This time we check a box consisting of the calling instance's collision mask +1 pixel in front of them.
	var _array = instance_place_array(x + (facing), y, [BLOCK_CARRY, ONEWAY_CARRY], false);
	var _i = array_find_index(_array, _canCarry_on);
	var _grab = (_i == -1) ? undefined : array_get(_array, _i);
	
	if (instance_exists(_grab))
	{
		return _grab;	
	}
	
	//Finally checks directly above.
	var _array = collision_rectangle_array(bbox_left, bbox_top, bbox_right, bbox_top - 1, [BLOCK_CARRY, ONEWAY_CARRY], false, true, false);
	var _i = array_find_index(_array, _canCarry_on);
	var _grab = (_i == -1) ? undefined : array_get(_array, _i);
	
	if (instance_exists(_grab))
	{
		return _grab;	
	}
	
	//If nothing is found returns undefined.
	return undefined;
}

///@function carry_carried_step()
///@description Makes the carried object follow the carrier. Should usually be put in the step event.
function carry_carried_step()
{
	//X is alligned with carrier's x, y is so that the sprite's bottom is on the character's top.
	x = carrier.x;
	y = carrier.bbox_top - (bbox_bottom - bbox_top);
}

///@function carry_uncarried_step()
///@description Code to be run when the carry object is not being carried. Sets 'thrown' as false if grounded and still.
function carry_uncarried_step()
{
	if (thrown)
	{
		//Todo: Make it work if an object is grounded but sliding on the ground kinda but don't mkake it work on enemies who are moving.
		thrown = !(grounded);
		//thrown = !((grounded) && (abs(vsp) + abs(hsp) < 1));
	}
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
	
	audio_play_sound(sfx_pickup, 1, false);
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
		
		//Tries to find a good spot to place the object at.
		
		var _pointFound = place_empty(x + _xOffset, y + _yOffset, [BLOCK, ONEWAY_CARRY])
		if (!_pointFound)
		{
			//Checks to the right and left of object up to half of it's bbox size.
			for (var _i = 0; _i < (bbox_right - x); _i++) 
			{
				_pointFound = place_empty(x + _xOffset + _i, y + _yOffset, [BLOCK, ONEWAY_CARRY]);
				
				//If a valid point is found adjusts _xOffset accordingly and continues as normal.
				if (_pointFound)
				{
					_xOffset += _i;
					break;	
				}
				
				_pointFound = place_empty(x + _xOffset - _i, y + _yOffset, [BLOCK, ONEWAY_CARRY]);
				
				if (_pointFound)
				{
					_xOffset -= _i;
					break;	
				}
				
			}
			
			//If no point was found, returns false.
			if (!_pointFound)
			{
				return false;
			}
			

		}
		
		hsp = _hsp;
		vsp = _vsp;
		hspExt = hsp;
		
		x += _xOffset;
		y += _yOffset;
		
		///Does whatever code the thrown object has for being thrown.
		event_user(USER_EVENTS.U_EVENT_THROWN)
		
		//Sets thrwn as true.
		thrown = true;
	}
	
	audio_play_sound(sfx_throw, 1, false);
	
	myCarry = noone;
	return true;
}