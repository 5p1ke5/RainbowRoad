/// @description When destroyed creates four dirt particles.
//Creates 4 dirt particles.
var _image_index = 0;
for (var _i = -1; _i <= 1; _i += 2) 
{
	for (var _ii = -1; _ii <= 1; _ii += 2) 
	{
		var _dirt = instance_create_depth(x, y, depth, obj_particleDirt);
		with (_dirt)
		{
			hsp = _i;
			vsp = _ii;
			image_index = _image_index;
		}
		_image_index++;
	}	
}