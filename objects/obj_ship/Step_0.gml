// Controls, inherits physics, sets sprite, collision

hsp = phys_force_add(hsp, RIGHT_BUTTON - LEFT_BUTTON, 3);
vsp = phys_force_add(vsp, DOWN_BUTTON - UP_BUTTON, 3);

event_inherited();

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

if (X_BUTTON)
{
	room_goto(global.roomPrev);	
}

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