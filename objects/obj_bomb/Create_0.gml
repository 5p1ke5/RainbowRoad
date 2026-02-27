/// @description Inherits, sets bomb-specific variables.
event_inherited();

//Timer is incremented when bomb is armed.
armed = false;
timerCD = game_get_speed(gamespeed_fps) * 5;
timer = timerCD;

image_speed = 0;