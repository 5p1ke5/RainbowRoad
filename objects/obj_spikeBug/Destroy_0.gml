///@description Creates corpse object
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