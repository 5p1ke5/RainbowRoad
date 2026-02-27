/// @description cancels out of being picked up if the player doesn't have enough money. Otherwise turns into the item.
event_inherited();

//If the player has enough money creates the object in the 'object' variable and sets it as the player's held item. Then destroys self.
if (global.money >= cost)
{
	var _newObject = instance_create_depth(x, y, depth, object);
	
	with (carrier)
	{
		carry_pickup_instance(_newObject);
	}
	
	global.money -= cost;
	
	audio_play_sound(snd_buy, 1, false);
	instance_destroy();
}
else
{
//Cancel out. TODO: Maybe rewrite so being picked up mostly happens on the item's end??
	with (carrier)
	{
		myCarry = noone;
		npc_speak("I don't have enough money for this.", "Player");
	}

	carrier = noone;
	
}