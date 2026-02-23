// Collision, controls, inherits physics, sets sprite


//Collision

var _collision = instance_place(x, y, obj_marker)

if (_collision)
{
	//Pulls variables from whatever island is being hovered over.
	islandName = _collision.islandName;
	scroll = _collision.description;
}
else
{
	//Otherwise blanks em
	islandName = "";
	scroll = "";
}

hsp = phys_force_add(hsp, RIGHT_BUTTON - LEFT_BUTTON, 3);
vsp = phys_force_add(vsp, DOWN_BUTTON - UP_BUTTON, 3);

event_inherited();


//If over a marker, lets the player press a button to set the island as the destination and exit the world map.
if (B_BUTTON || A_BUTTON)
{
	if (_collision)
	{
		global.shipDoorTo = _collision.roomTo;	
		global.shipDoorToX = _collision.shipDoorToX;
		global.shipDoorToY = _collision.shipDoorToY;
	}
	audio_play_sound(sfx_ping, 1, false);
	
	//Later make a little screen that is like...
	// 'The Dolphin embarked for <Island Name>' and *then* it sends you back
	global.shipX = x;
	global.shipY = y;
	
	room_goto(global.roomPrev);	
}


//Saves position, returns to previous screen.
if (X_BUTTON)
{
	global.shipX = x;
	global.shipY = y;
	room_goto(global.roomPrev);	
}

//Sets sprites.
if (LEFT_BUTTON || RIGHT_BUTTON)
{
	sprite_index = spr_shipE;	
	image_xscale = (2 * RIGHT_BUTTON) - 1; //If 1 xscale is 1; if 0 xscale is -1
}
else if (UP_BUTTON || DOWN_BUTTON)
{
	image_xscale = 1;
	
	if (UP_BUTTON)
	{
		sprite_index = spr_shipN;	
	}
	else
	{
		sprite_index = spr_shipS;
	}
}