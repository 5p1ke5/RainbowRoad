/// @description Overrides parent, just does physics.
carry_initialize();
hDir = sign(image_xscale)
spd = 4;

phys_initialize(0, 0, hDir * spd, 0);