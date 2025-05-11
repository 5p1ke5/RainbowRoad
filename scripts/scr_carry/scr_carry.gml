///@function carry_initialize(_carrier, _canCarry, _carried)
///@description Initializes variables for an object that can be carried.
///@param _canCarry Whether or not the object can currently be carrie.d
///@param _carried Whether or not the object is currently being carried.
///@param _carrier The instance currently carrying this one.
function carry_initialize(_canCarry = true, _carried = false, _carrier = noone)
{
	canCarry = _canCarry;
	carrier = _carrier;
	originalMask = mask_index;
}

///@function carry_carried_step()
///@description Makes the carried object follow the carrier. Should usually be put in the step event.
function carry_carried_step()
{
	//X is alligned with carrier's x, y is so that the sprite's bottom is on the character's top.
	x = carrier.x;
	y = carrier.y - sprite_height;
}