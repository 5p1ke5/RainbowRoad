///@description opens or closes as necessary.

if (!open)
{
	if (image_yscale < baseYscale)
	{
		image_yscale += (baseYscale/(sprite_height/8));
		image_yscale = min(image_yscale, baseYscale);
	}
}
else
{
	if (image_yscale > 0)
	{
		image_yscale -= (baseYscale/(sprite_height/8));
		image_yscale = max(image_yscale, 0);
	}
}
