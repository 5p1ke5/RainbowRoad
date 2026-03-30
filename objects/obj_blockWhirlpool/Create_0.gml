/// @desc inherits if the player doesn't have enough stars, otherwise turns off collision.

if (star_total() < 2)
{
	event_inherited();
}
else
{
	collision = false;	
}
