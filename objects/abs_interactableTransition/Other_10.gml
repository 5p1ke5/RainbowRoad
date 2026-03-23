///@description When called check if locked. If not, transitions to the defined room.

if !(locked) && (price == 0)
{
	transition_goto(roomTo, spawnX, spawnY);
}
//Otherwise, checks if the player is holding a key.
else
{
	var _player = instance_find(obj_player, 0);
	
	if (locked)
	{
		var _carry = _player.myCarry;

		//If the player is holding a key opens the door, then dereferences that key from the player and destroys it.
		if (_carry) && (_carry.object_index == obj_key)
		{
			with (_player)
			{
				myCarry = noone;	
			}
	
			with (_carry)
			{
				instance_destroy();	
			}
	
			transition_goto(roomTo, spawnX, spawnY);
		
			audio_play_sound(sfx_unlock, 1, false);
		}
		//Otherwise, says you need to have a key.
		else
		{
			with (_player)
			{
				npc_speak("I need a key to open this door.", "Player");	
			}
		}
	}
	
	if (price > global.money)
	{
		with (_player)
		{
			npc_speak("I need to pay to open this door.", "Player");	
		}
	}
	else
	{
		global.money -= price;
		audio_play_sound(sfx_buy, 1, false);
		transition_goto(roomTo, spawnX, spawnY);
	}
	
}