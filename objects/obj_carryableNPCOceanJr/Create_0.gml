/// @description Inherits parent variables, initializes NPC variables.
event_inherited();

doll_initialize(6, 14, 11, 0, 0, c_hispanic2, c_brunette, c_white, c_gray, c_black);

npc_initialize("Ocean Jr.", ["Hi! I'm Dr. Ocean's son. Thanks for saving me.", "You wouldn't throw me into that lava, right?"]);


global.flagSonFound = true;