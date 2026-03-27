/// @description Initializes doll things. The firt two should be overwritten in creation code or by children.
npc_initialize("Mrs. Ocean", "Oh! My beloved husband Dr. Ocean must have sent you! I can make my way back from here. Thank you!");
doll_initialize(7, 9, 7, 0, 1, c_asian1, c_ginger, c_yellow, c_blue, c_red);

phys_initialize(0.2, 0.2);

myCarry = noone;

if (global.flagWifeFound)
{
	instance_destroy();	
}