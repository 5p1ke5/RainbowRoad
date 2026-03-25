/// @description Resets HSP, then inherits

hDir = carrier.facing;
image_xscale = hDir;
hsp = hDir * spd;
vsp = 0;

event_inherited();