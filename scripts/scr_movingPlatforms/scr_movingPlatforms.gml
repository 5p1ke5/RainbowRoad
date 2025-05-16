///@function moving_platform_step()
///@description checks what objects are on top of this instance and move them along with this object. Assumes the object has initialized physics variables.
function moving_platform_step()
{
	if (!collision)
	{
		return;	
	}
	
	//var _collisions = collision_rectangle_array(bbox_left, bbox_top - vsp - 1, bbox_right, bbox_top, all, true, true, false);
	var _collisions = collision_rectangle_array(bbox_left, bbox_top - abs(vsp) - 6, bbox_right, bbox_top, [abs_physics, abs_carryBlock, abs_carryOneway], true, true, false);
	
	for (var _i = 0; _i < array_length(_collisions); _i++) 
	{
		//Checks if the other instance is on top of this one.
		if (_collisions[_i].bbox_bottom - 1 <= bbox_top + 1 - vsp)
		{
			//If it has *Ext variables sets them.
			if (variable_instance_exists(_collisions[_i], "hspExt"))
			{
				//Saves this instance's hsp and vsp variables
				var _hsp = hsp; 
				var _vsp = vsp;
			
				with (_collisions[_i])
				{
					hspExt = _hsp;
					y += round(_vsp);
				}
			}
		}
		
	}
	

}