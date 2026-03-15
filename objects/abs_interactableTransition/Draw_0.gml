/// @description Draws self, lock sprite if necessary.

draw_self();

if (locked)
{
	draw_sprite(spr_doorLock, image_index, x, y);	
}

if (price > 0)
{
	draw_text(x, bbox_bottom + string_height(price) * 2, price);
}