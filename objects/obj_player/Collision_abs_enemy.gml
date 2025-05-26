/// @description Code for collision with enemies/hurtboxes. I need to move this to the step event probably...Under like if (B_BUTTON), probably

//Ignores if its a carried object.
if (myCarry) && (myCarry.id == other.id)
{
	return;	
}



if (bbox_bottom - 1 > other.bbox_top + 1)
{
	if (flicker < 0)
	{
		flicker = FLICKER_MAX;	
	}
}