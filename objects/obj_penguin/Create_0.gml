// Inherits, initializes timers.
phys_initialize(, 0.1,,,,,,, [abs_enemyCarry, obj_blockSand]);

//Initializes variables for carrying this object.
carry_initialize();

timer_initialize(game_get_speed(gamespeed_fps) * 2, game_get_speed(gamespeed_fps) * 2, true);

//state 0 = stand
//state 1 = walk
//state 2 = slide
state = 0;
hDir = image_xscale;

image_speed = 1;