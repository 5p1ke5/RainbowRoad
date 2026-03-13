global.starShards++;

if (global.starShards < 5)
{
	with (other)
	{
		npc_speak("I have " + string(global.starShards) + " star shards now! If I get 5 I can make them into a star.", "Player");	
	}
}
else
{
	global.stars++;
	global.starShards = 0;
	with (other)
	{
		npc_speak("I got five star shards! I combined them into a star. I now have " + string(global.stars) + ".", "Player");	
	}
}

instance_destroy();	

audio_play_sound(sfx_powerup1, 1, false);