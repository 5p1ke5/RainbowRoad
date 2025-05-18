/// @description follows owner, decrements timer and destroys self when finished.
if (instance_exists(owner))
{
	x = owner.x;	
}

time--;

if (time < 0)
{
	instance_destroy();	
}