/// @description cancels out of being picked up if the player doesn't have enough money. Otherwise turns into the item.
//event_inherited();

//If the player has enough money creates the object in the 'object' variable and sets it as the player's held item. Then destroys self.
if (global.money >= cost)
{
	//If the object is carryable then puts it in the player's hands
	if (object_is_family(object, abs_carryOneway))
	{
		var _newObject = instance_create_depth(x, y, depth, object);
	
		with (carrier)
		{
			carry_pickup_instance(_newObject);
		}
	}
	else //Otherwise just spawns it above the carrier.
	{
		var _object = object;
		
		with (carrier)
		{
			var _sprite = object_get_sprite(_object)
			var _y = bbox_top - sprite_get_height(_sprite)
			
			instance_create_depth(x, _y, depth, _object);
		}
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