/// @description does physics things, destroy self if inside a block.
phys_step();

var _hits = hitbox_step_instance_array(false);

if (array_length(_hits))
{
	if (collision_validate(_hits))
	{
		instance_destroy();	
	}
}