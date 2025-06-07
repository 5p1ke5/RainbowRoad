/// @description hitbox things

//var _collision_on = function (element, index) { return collision_validate(element, collisionBlacklist) };

//if (array_any(hitbox_step(), _collision_on))
var _hit = hitbox_step();
if (_hit)
{
	if (collision_validate(_hit))
	{
		instance_destroy();	
	}
}