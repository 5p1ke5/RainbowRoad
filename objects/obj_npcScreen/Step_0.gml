/// @description Inherits, alters animation.
event_inherited();

if (instance_exists(myBalloon))
{
	image_speed = 1;	
}
else
{
	image_speed = 0;
	image_index = 0;
}
