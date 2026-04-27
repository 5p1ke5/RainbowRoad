// Inherit the parent event, increments timer, checks if it became grounded.

var _wasGrounded = grounded;

event_inherited();

timer_step();

switch (state) 
{    
	case 0:
        
        break;
    case 1:
		if (grounded)
		{
			if (collision_validate(instance_place_array(x + hsp + hDir, y, BLOCK, false)))
			{
				hDir = -hDir;
			}
		
		image_xscale = hDir;
		hsp = hDir;
			
		}
        break;
    case 2:
        if (!_wasGrounded) && (grounded)
		{
			hsp = 20 * hDir;	
		}
        break;
}