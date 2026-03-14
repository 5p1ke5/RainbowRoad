/// @description If a physics object is right on top of this, sets that objects vsp to -20
event_inherited();

var _onTop = collision_rectangle_array(bbox_left, bbox_top - 1, bbox_right, bbox_top, abs_physics, true)
var _top = bbox_top;

for (var _i = 0; _i < array_length(_onTop); _i++) 
{    
	with (_onTop[_i])
	{
		if (bbox_bottom <= _top)
		{
			vsp = -20;	
		}
	}
}