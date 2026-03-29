/// @description Inherits but only if you have a star.
if (array_contains(global.starsFound, true))
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
