/// @description When interacted with makes the player say the door is locked behind story progression
var _player = instance_nearest(x, y, obj_player);

if (_player)
{
	with (_player)
	{
		npc_speak("I can't go inside until I save Dr. Ocean's husband and wife.", "Player");	
	}
}