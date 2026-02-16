/// @description If held just follows carrier.
if (instance_exists(carrier))
{
	x = carrier.x;
	y = carrier.bbox_top - sprite_height;
}
