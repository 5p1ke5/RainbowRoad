/// @description uses simplified physics with no collision.

vsp = phys_gravity(vsp, grav, TERMINAL_VELOCITY);
hsp = phys_friction(hsp, frict, grounded);

y += vsp;
x += hsp;