if (collision)
{
	if (point_distance(x, y, other.x, other.y) < sprite_width/3)
	{
		instance_destroy();
		instance_create_depth(x, y, depth, obj_explosion);
	}

}

