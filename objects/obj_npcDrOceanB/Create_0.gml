/// @description Initializes doll things. The firt two should be overwritten in creation code or by children.

var _dialogue = "Thank you for defeating Dr. Sky for me! You rescued my son! Say thank you, Junior!";
npc_initialize("Dr. Ocean", _dialogue);
doll_initialize(0, 5, 14, 0, 0, c_white1, c_blue, c_white, c_dkgray, c_red);

phys_initialize(0.2, 0.2);
