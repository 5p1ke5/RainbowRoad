///Raises yscale until it's at the maxHeightIncrement

if (image_yscale < maxHeightIncrement)
{
	image_yscale += 0.022;
}
else
{
	with (movingPlatform)
	{
		vsp = 0;	
	}
}