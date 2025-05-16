/// @function phys_initialize(gravity, friction, hsp, vsp, collision)
/// @description Initializes physics variables.
/// @param _grav How many pixels the object is pulled down by each step.
/// @param _frict How much horizontal speed is reduced each step while it is non-zero.
/// @param _hsp Horizontal speed.
/// @param _vsp vertical speed
/// @param _collision Whether the object stops when it collides with blocks.
/// @param _elasticity How much an object bounces when it collides with something.
function phys_initialize(_grav = 0.1, _frict = 0.2, _hsp = 0, _vsp = 0, _collision = true, _elasticity = 0) 
{
	//Initializes instance variables.
	grav = _grav;
	frict = _frict;
	hsp = _hsp;
	vsp = _vsp;
	collision = _collision;
	elasticity = _elasticity
	
	//*Ext variables are for modifiers to horizontal or vertical speed by 'Ext'ernal forces.
	hspExt = 0;
	
	
	//The object is considered grounded if they are directly above a block with collision = true.
	grounded = variable_instance_get(collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, BLOCK, true, false), "collision") == true;
}

/// @function phys_step()
/// @description Place in the step event to activate physics.
function phys_step() 
{
	//grav increases the object's downwards speed by raising vsp. Does not do so past the terminal velocity.
	vsp = phys_gravity(vsp, grav, TERMINAL_VELOCITY);

	//Friction will reduce horizontal speed. This is reduced while in the air.
	hsp = phys_friction(hsp, frict, grounded);
	


	//Collision with walls. The object's position is changed after each collision function.
	//TODO: Try moving this to after gravity
	if (collision)
	{
	
	//Checks if grounded.
	var _collision_on = function (element, index) { return (variable_instance_get(element, "collision") == true) };
	grounded = (array_any(collision_rectangle_array(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, GROUND, false, true, false), _collision_on));
	
		
	    phys_wall_collision();
	    phys_floor_collision();
		
	}


	y += round(vsp);
	x += round(hsp) + round(hspExt);
	hspExt = 0;
	
}


/// @function phys_force_add(_force, _accel, _max)
/// @description Accelerates a given force value up to a maximum number. Returns the new value.
/// @param _force the base value to be added to. Usually hsp or vsp.
/// @param _accel the number to be added to the _force variable.
/// @param _max the maximum value that _force can be set to.
function phys_force_add(_force, _accel, _max)
{
	var _sign = sign(_accel);
	
	_force += _accel;
	_force = min(abs(_force), _max);
	
	return _force * _sign;
}

/// @function phys_wall_collision(_hsp)
/// @description If the object would end up inside the block object, it instead just moves them as close as possible.
function phys_wall_collision() 
{
	var _collision_on = function (element, index) { return (variable_instance_get(element, "collision") == true) };

	//Checks every pixel in the object's path for collision. TODO: Turn this into an array type thing. Maybe Foreach or a specialized function?
	for (var _i = 0; ( abs(_i) < abs(hsp) + abs(hspExt) ) || (array_any(instance_place_array(x + _i, y, BLOCK, false), _collision_on)); _i += sign(hsp + hspExt))
	{
	    //If there is a valid collision, it will move the player as close to the object as possible and then stop.
		var _collisions = instance_place_array(x + _i, y, BLOCK, false);
		
		for (var _ii = 0; _ii < array_length(_collisions); _ii++) 
		{
		    if (variable_instance_get(_collisions[_ii], "collision") == true)
		    {
		        x += _i - sign(hsp + hspExt);
		        hsp = hsp * -elasticity;
				hspExt = 0;
				return;
		    }
		}
	}
}


/// @function phys_floor_collision() 
/// @description Stops the player if they would touch a block vertically.
function phys_floor_collision() 
{
	
	var _collision_on = function (element, index) { return (variable_instance_get(element, "collision") == true) };
	
	//Checks every pixel in the player's path for collision.
	for (var _i = 0; (abs(_i) < abs(vsp)) || (array_any(instance_place_array(x, y + _i, BLOCK, false), _collision_on)); _i += sign(vsp))
	{
	    //If there is a valid collision, it will move the player as close to the object as possible and then stop.
		var _collisions = instance_place_array(x, y + _i, GROUND, false);
		
		for (var _ii = 0; _ii < array_length(_collisions); _ii++) 
		{
		    if (variable_instance_get(_collisions[_ii], "collision") == true)
		    {
				if ( object_is_ancestor(_collisions[_ii].object_index, BLOCK))
				{
			        y += _i - sign(vsp);
			        vsp = vsp * -elasticity;
					return;
				}
				
				if (_collisions[_ii].object_index == ONEWAY)
				{
		
					if (vsp >= 0)
					{
						if (array_any(collision_rectangle_array(bbox_left, bbox_bottom, bbox_right, bbox_bottom + vsp + 1, ONEWAY, false, true, false), _collision_on))
						{
							//grounded = true;
					        y += _i;// - sign(vsp);
					        vsp = vsp * -elasticity;
							return;
						}
					}
				}
		    }
		}
	}
	
	
	
}


/// @function phys_friction(hsp, friction, grounded)
/// @description Applies friction to a horizontal speed variable. Returns new horizontal speed.
/// @param _hsp Horizontal speed.
/// @param _friction Friction variable.
/// @param _grounded Whether the object is on the ground or not.
function phys_friction(_hsp, _frict, _grounded) 
{
	//Friction will reduce horizontal speed. This is reduced while in the air.
	  _hsp -= (_frict * sign(_hsp)) * (1 / (power(6, !_grounded)));
	  
	//If hsp is lower than the friction value, it just sets hsp to 0.
	if (abs(_hsp) < _frict)
	{
	    return 0;
	}

	//Returns new hsp
	return _hsp;
}

/// @function phys_gravity(_vsp, _grav, _terminalVelocity)
/// @description applies gravity. Returns the new VSP value.
/// @param _vsp the vsp value gravity will be applied to.
/// @param _grav the value that will be applied to vsp.
/// @param _terminalVelocity The maximum gravity that can be applied.
function phys_gravity(_vsp, _grav, _terminalVelocity) 
{
	_vsp = min(_vsp + _grav, _terminalVelocity) 

	return _vsp;


}