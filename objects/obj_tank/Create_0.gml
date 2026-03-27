// Inherit the parent event
event_inherited();

enemy_initialize(6);

spawner_initialize(obj_rocket, game_get_speed(gamespeed_fps) * 2);

hDir = sign(image_xscale)
spd = 1;

//Increment that will be flipped to toggle what cannon the missiles are shot out of.
increment = 1;