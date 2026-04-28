/// @desc Inherits, forces state into 2 (slide)
//TODO: this makes the penguin go flying crazy style, let's fx it uo
with (carrier)
{
 var _hDir = facing;	
}

hDir = _hDir;
image_xscale = hDir;

event_inherited();

//Manually resets timer, puts into state 2.
timer_reset();
state = 2;
sprite_index = spr_penguinSlide;