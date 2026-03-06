/// @description Inherits, sets yscale to 0, initializes maxHeightIncrement, creates a moving platform.
image_yscale = 0;
maxHeightIncrement = 4;

movingPlatform = instance_create_depth(bbox_left, y + 7, depth, obj_oneWayMoving);

with (movingPlatform)
{
	moving_platform_initialize(0, -1, true, []);	
}