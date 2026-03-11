/// @description Makes variables for an enemy that cannot be picked up or stepped on.
// TODO: Make this into an abstract object
phys_initialize(,0.1);

enemy_initialize(3);

hitbox_initialize([BLOCK_CARRY, ONEWAY_CARRY]);

hDir = sign(image_xscale)

jumpCD = game_get_speed(gamespeed_fps) * 1.5;
jumpTimer = jumpCD;