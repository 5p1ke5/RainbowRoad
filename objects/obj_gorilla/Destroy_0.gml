///@description Creates corpse object, key.
var _corpse = instance_create_depth(x, y, depth, CORPSE);

var _spriteIndex = sprite_index;
var _hsp = hsp;

with (_corpse)
{
	sprite_index = _spriteIndex;
	image_yscale = -1;
	hsp = -_hsp;
	vsp = -JUMP_HEIGHT;
}

//Makes key
instance_create_depth(x, bbox_top, depth, obj_key);

//sets story flag.
global.flagSasquatchDefeated = true;