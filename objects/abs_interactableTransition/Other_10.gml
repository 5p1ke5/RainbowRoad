///@description When called check if locked. If not, transitions to the defined room.

if !(locked)
{
	transition_goto(spawnX, spawnY, roomTo);
}
//Otherwise, checks if the player is holding a key.
else
{
	var _player = instance_find(obj_player, 0);
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
	
		transition_goto(spawnX, spawnY, roomTo);
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