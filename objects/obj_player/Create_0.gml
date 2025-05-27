/// @description Initializes variables, position at spawn.

phys_initialize(0.2, 0.2);

//Initialize player variables.
hDir = 0; //Horizontal movement direction.
facing = 1; //Direction facing. Should always be 1 or -1.
maxSpeed = 3; 
accel = 0.4;
jumpHeight = 4;
jumpOffset = 0.1;
flicker = -1;

animSpeed = 0.2;
animSpeedRun = 0.5;

image_speed = animSpeed;

//The object currently being carried.
myCarry = noone;

//The objectb being target to grab.
grab = carry_grab();


//Positions at spawn point if defined.
if (global.spawnX != undefined)
{
	x = global.spawnX;
	y = global.spawnY;
}
