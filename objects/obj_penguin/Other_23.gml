/// @description Event when the timer goes off.


//If going from slide to walk or wait, moves up a little to stop from being stuck in the floor.
if (state == 2)
{
	y -= sprite_height;	
}

//Randomly sets direction, state. 
hDir = my_choose([1, -1])
image_xscale = hDir;

//State can't repeat.
var _states = [0, 1, 2];
array_delete(_states, array_get_index(_states, state), 1)
state = my_choose(_states);


switch (state) 
{    
	case 0:
		sprite_index = spr_penguin;
		break;
    case 1:
		sprite_index = spr_penguinWalk;
        break;
    case 2:
        sprite_index = spr_penguinSlide;
		vsp = -3;
        break;
}

timer_reset();