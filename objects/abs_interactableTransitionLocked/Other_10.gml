/// @description Checks if the player is holding a key. If so, removes the key and transitions.
var _player = instance_find(obj_player, 0);
var _carry = _player.myCarry;

if (_carry.object_index == obj_key)
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
		npc_speak("Player", "I need a key to open this door.");	
	}
}