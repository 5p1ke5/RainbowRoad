/// @description Initializes doll things. The firt two should be overwritten in creation code or by children.
npc_initialize("Mr. Ocean", "Oh! My beloved husband Dr. Ocean must have sent you! I can make my way back from here. Thank you!");
doll_initialize(17, 4, 6, 0, 0, c_hispanic2, c_brunette, c_yellow, c_blue, c_red);

phys_initialize(0.2, 0.2);

myCarry = noone;

if (global.flagHusbandFound)
{
	instance_destroy();	
}