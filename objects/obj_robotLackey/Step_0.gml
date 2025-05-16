// Inherit the parent event

event_inherited();

var _collision_on = function (element, index) { return (variable_instance_get(element, "collision") == true) };

if (array_any(instance_place_array(x + hsp, y, BLOCK, false), _collision_on))
{
	hDir = -hDir;
	image_xscale = hDir;
}

if (grounded)
{
	hsp = hDir * spd;
}