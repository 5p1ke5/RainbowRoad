///@description initialize variables
event_inherited();

//If anything is top this presses the button.
var _onTop = array_length(collision_rectangle_array(bbox_left, bbox_top - 1, bbox_right, bbox_top, [abs_physics, abs_carryBlock, abs_carryOneway], true, true, false)) > 0;

pressed = _onTop;


image_index = pressed;
image_speed = 0;

wasPressed = pressed;

object = undefined; //The object that will be opened / closed. Should be overwritten by children.