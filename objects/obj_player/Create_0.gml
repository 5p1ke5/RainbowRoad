/// @description Initializes variables, position at spawn.

phys_initialize(0.2, 0.2);

hitbox_initialize([abs_enemy, abs_hazard], FLICKER_MAX); 

var _doll = global.playerDoll;
doll_initialize(_doll.faceIndex, _doll.hairIndex, _doll.shirtIndex, _doll.pantsIndex, _doll.shoeIndex, 
			_doll.skinColor, _doll.hairColor, _doll.shirtColor, _doll.pantsColor, _doll.shoeColor);

animSpeedRun = 0.5;

image_speed = animSpeed;

//The object currently being carried.If a carried object is saved it spawns the saved object into the rom.
if (global.carried)
{
	myCarry = instance_deserialize_depth(global.carried, x, y, depth);
	var _carrier = self;
	with (myCarry)
	{
		carrier = _carrier;
	}
}
else
{
	myCarry = noone;
}

//The object being targettws to grab.
grab = carry_grab_target();

//The target for interaction.
interact = undefined;

//The alert being displayed.
alert = "";


//Positions at spawn point if defined.
if (global.spawnX != undefined)
{
	x = global.spawnX;
	y = global.spawnY;
}
