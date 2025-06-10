/// @description follows owner, decrements timer and destroys self when finished.
if (instance_exists(owner))
{
	x = owner.x;
	y = owner.y - 32 - height;
}

time--;

if (time < 0)
{
	instance_destroy();	
}