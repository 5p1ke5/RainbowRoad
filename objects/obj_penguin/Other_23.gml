/// @description Event when the timer goes off.
switch (state) 
{    
	case 0:
		image_index = spr_penguinWalk
		state = 1;
		hDir = sign(irandom_range(-1, 1) * 2 - 1)
		timer_reset();
        break;
    case 1:
		image_index = spr_penguin
		state = 0;
		hDir = sign(irandom_range(-1, 1) * 2 - 1)
		timer_reset();
        break;
    case 2:
        
        break;
}

image_xscale = hDir;