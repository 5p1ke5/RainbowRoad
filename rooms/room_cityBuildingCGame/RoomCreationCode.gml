
//Replaces 10 random dirt blocks with coins to be dug up.
while (instance_number(obj_money) < 30)
{
	var _block = instance_find(obj_dirtBlock, my_irandom(instance_number(obj_dirtBlock) - 1));
	
	with (_block)
	{
		instance_create_depth(x, (bbox_bottom + bbox_top)/2, depth, obj_money);
		instance_destroy();
	}
}