/// @description Inherits, checks if it landed on the ground.

var _wasThrown = thrown;

event_inherited();

//If thrown and lands on ground, destroys self and creates a flower instead.
if (grounded) && (_wasThrown)
{
	instance_destroy();
	instance_create_depth(x, bbox_bottom, depth, obj_oneWayFlower);
}