/// @description Resets HSP, then inherits

image_xscale = carrier.facing;
hsp = carrier.facing * spd;
vsp = 0;

event_inherited();