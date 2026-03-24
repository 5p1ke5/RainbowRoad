/// @description Overrides parents, initializes physics like this
carry_initialize();
hDir = sign(image_xscale);
spd = 3;

phys_initialize(0, 0, hDir * spd, 0);