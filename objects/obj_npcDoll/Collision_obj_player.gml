// Turns to face player.
event_inherited();

if (other.x < x)
{
	image_xscale = -1;	
}
else
{
	image_xscale = 1;	
}

