//Inherits. If armed, increments timer then detonates.
event_inherited();

if (armed)
{
	timer--;
	
	if (timer < timerCD/2)
	{
		image_speed = 2;	
	} 
	
	if (timer < 0)
	{
		instance_destroy()
		instance_create_depth(x, y, depth, obj_explosion);
	}
}