///@description Decides if something is on top of and if so is pressed.

//If anything is top this presses the button.
var _onTop = array_length(collision_rectangle_array(bbox_left, bbox_top - 1, bbox_right, bbox_top, [abs_physics, abs_carryBlock, abs_carryOneway], true, true, false)) > 0;

pressed = _onTop;


image_index = pressed;
image_speed = 0;

if pressed && (!wasPressed)
{
	audio_play_sound(sfx_lever, 1, false);
}

wasPressed = pressed;