/// @description Event when the timer goes off.
switch (state) 
{    
	case 0:
		sprite_index = spr_penguinWalk
		state = 1;
		hDir = my_choose([1, -1])
		timer_reset();
        break;
    case 1:
		sprite_index = spr_penguin
		state = 0;
		hDir = my_choose([1, -1])
		timer_reset();
        break;
    case 2:
        
        break;
}

image_xscale = hDir;