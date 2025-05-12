/// @description Initializes variables.

phys_initialize(0.2, 0.5);

//Initialize player variables.
hDir = 0;
facing = 1;
maxSpeed = 3;
accel = 1;
jumpHeight = 4;
jumpOffset = 0.1;

animSpeed = 0.2;
animSpeedRun = 0.8;

image_speed = animSpeed;

//The object currently being carried.
myCarry = noone;