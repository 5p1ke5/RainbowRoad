/// @description Overrides parents, initializes physics like this
carry_initialize();

phys_initialize();

image_blend = choose(c_yellow, c_orange, c_lime);
hDir = image_xscale;

image_speed = 0;