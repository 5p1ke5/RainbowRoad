/// @description Inherits but only if you have a star.
if (global.stars >= 1)
{
	event_inherited();	
}
else
{
	var _player = instance_find(obj_player, 0);
	
	if (_player != noone)
	{
		with (_player)
		{
			npc_speak("I can't go to the World Map until I get a star for the star reactor.", "Player");	
		}
	}
}
