/// @description Makes variables for an enemy that cannot be picked up or stepped on.
// TODO: Make this into an abstract object
phys_initialize();

enemy_initialize();

hitbox_initialize([BLOCK_CARRY, ONEWAY_CARRY]);

hDir = sign(image_xscale)
spd = 1;