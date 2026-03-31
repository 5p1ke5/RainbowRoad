/// @description cancels out of being picked up if the player doesn't have enough money. Otherwise turns into the item.

//If the player has enough money creates the object in the 'object' variable and sets it as the player's held item. Then destroys self.
if (global.money >= cost)
{

	var _object = object;
		
	with (carrier)
	{
		var _sprite = object_get_sprite(_object)
		var _y = bbox_top - sprite_get_height(_sprite)
			
		var _star = instance_create_depth(x, _y, depth, _object);
	}
	
	//Initializes that star as the third star.
	with (_star)
	{
		star_initialize(2);	
	}
	
	global.money -= cost;
	
	audio_play_sound(sfx_buy, 1, false);
	instance_destroy();
}
else
{
//Cancel out.
	with (carrier)
	{
		myCarry = noone;
		npc_speak("I don't have enough money for this.", "Player");
	}
	carrier = noone;
}