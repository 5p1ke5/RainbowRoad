// Inherit the parent event, increments timer, checks if it became grounded.
var _wasGrounded = grounded;

event_inherited();

if (!carrier)
{

	switch (state) 
	{    
		case 0:
			timer_step();
	        break;
			
	    case 1:
			if (grounded)
			{
			timer_step();
			
				if (collision_validate(instance_place_array(x + hsp + hDir, y, BLOCK, false)))
				{
					hDir = -hDir;
				}
		
				image_xscale = hDir;
				hsp = hDir;
			}
	        break;
			
	    case 2:
			if (grounded)
			{
		        if (!_wasGrounded)
				{
					hsp = 10 * hDir;	
				}	
			
				if (hsp == 0)
				{
					event_user(USER_EVENTS.U_EVENT_TIMER)
				}
			}
			
			if (collision_validate(instance_place_array(x + (hsp), y, BLOCK, false)))
			{
				hDir = -hDir;
				hsp = -hsp;
				image_xscale = hDir;
			}
	        break;
	}
}
