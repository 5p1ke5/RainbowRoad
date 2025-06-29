///@description opens or closes as necessary.

if (instance_exists(buttonObject))
{
	open = true;
	
	//If all red buttons are pressed, opens. Otherwise closes.
	for (var _i = 0; _i < instance_number(buttonObject); _i++) 
	{
		var _button = instance_find(buttonObject, _i);
		
		if (!_button.pressed)
		{
			open = false;	
		}
	}
}


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

