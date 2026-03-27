/// @description if outside of room culls past certain point

//Doesn't destroy if it's above room boundaries.
if (y > room_height + (room_height/4))	||
  (x > room_width + (room_width/4))		||
  (x < -(room_width/4))
{
	instance_destroy();
}