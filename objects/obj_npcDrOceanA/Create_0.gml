/// @description Initializes doll things. The firt two should be overwritten in creation code or by children.

var _dialogue = [ "Dr. Sky won't open the door to his palace until you free my husband and wife."]

if (global.flagHusbandFound)
{
	array_push(_dialogue, "You found my husband! Thank you!")
}

if (global.flagWifeFound)
{
	array_push(_dialogue, "You found my wife! Wonderful")
}

if (global.flagWifeFound && global.flagHusbandFound)
{
	_dialogue = "You found my husband and wife! Now we can go into Dr. Sky's palace and find my son!";
}

npc_initialize("Dr. Ocean", _dialogue);
doll_initialize(0, 5, 14, 0, 0, c_white1, c_blue, c_white, c_dkgray, c_red);

phys_initialize(0.2, 0.2);

myCarry = noone;