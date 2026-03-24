/// @description Inherits, if hsp = 0 destroys self and creates explosion.
event_inherited();

if (!instance_exists(carrier))
{
	if (hsp == 0)
	{
		instance_destroy();
		instance_create_depth(x, y, depth, obj_explosion);
	}
}