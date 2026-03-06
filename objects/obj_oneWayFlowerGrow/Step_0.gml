///Raises yscale until it's at the maxHeightIncrement

var _bbox_top = bbox_top;

with (movingPlatform)
{
	if (y < _bbox_top)
	{
		vsp = 0;	
	}
	else
	{
		vsp = -1;	
	}
}

if (image_yscale < maxHeightIncrement)
{
	image_yscale += 0.02;
}
