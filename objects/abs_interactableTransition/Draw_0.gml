/// @description Draws self, lock sprite if necessary.

draw_self();

if (locked)
{
	draw_sprite(spr_doorLock, image_index, x, y);	
}