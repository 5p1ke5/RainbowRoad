/// @function moving_platform_initialize(_hsp, _vsp, _collision)
/// @description Initliazes variables for a moving platform. An abbreviated form of phys_initialize(). If it uses physics use phys_initialize() instead.
/// @param _hsp Horizontal speed of the platform.
/// @param _vsp Vertical speed of the platgorm.
/// @param _collision If collision is true.
function moving_platform_initialize(_hsp, _vsp, _collision = true, _block = [BLOCK, obj_oneWayMovingMarker])
{
	hsp = _hsp;
	vsp = _vsp;
	hspExt = 0; 
	
	collision = _collision;
	block = _block;
}


/// @function moving_platform_move_step()
/// @description Moves the moving platform. Stripped-down version of collision in physics, if the moving platform uses physics use that instead.
function moving_platform_move_step()
{

	//Checks every pixel in the object's path for collision. If a collision would happen reverses direction.
	
	for (var _i = 0; ( abs(_i) < abs(hsp) ); _i += sign(hsp))
	{
		if (collision_validate(instance_place_array(x + _i, y, block, false), []))
		{
			hsp *= -1;
		}
	}
	
	for (var _i = 0; ( abs(_i) < abs(vsp) ); _i += sign(vsp))
	{
		if (collision_validate(instance_place_array(x, y + _i, block, false), []))
		{
			vsp *= -1;
		}
	}
}


///@function moving_platform_carry_step()
///@description checks what objects are on top of this instance and move them along with this object. Assumes the object has initialized physics variables.
function moving_platform_carry_step()
{
	if (!collision)
	{
		return;	
	}
	
	
	//TODO: This adds a 'margin' but thats kinda hacky, figure out a better solution.
	//var _collisions = collision_rectangle_array(bbox_left, bbox_top - vsp - 1, bbox_right, bbox_top, all, true, true, false);
	var _collisions = collision_rectangle_array(bbox_left, bbox_top - abs(vsp) - 4, bbox_right, bbox_top, [abs_physics, abs_carryBlock, abs_carryOneway], true, true, false);
	
	for (var _i = 0; _i < array_length(_collisions); _i++) 
	{
		//Checks if the other instance is on top of this one. 
		if (_collisions[_i].bbox_bottom - 2 <= bbox_top + 1 - vsp) && (_collisions[_i].vsp >= 0)
		{
			//If it has *Ext variables sets them.
			if (variable_instance_exists(_collisions[_i], "hspExt"))
			{
				//Saves this instance's hsp and vsp variables
				var _hsp = hsp;
				var _hspExt = hspExt;
				
				var _vsp = vsp;
			
				with (_collisions[_i])
				{
					hspExt = _hsp + _hspExt;
					y += round(_vsp);
				}
			}
		}
		
	}
}