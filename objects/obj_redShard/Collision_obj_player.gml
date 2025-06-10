var _startingMaxHP = global.maxHP;

global.redShards++;
global.maxHP = STARTING_HP + (global.redShards div 4);
global.hp = global.maxHP;

instance_destroy();	

if (_startingMaxHP == global.maxHP)
{
	audio_play_sound(sfx_powerup1, 1, false);	
}
else //Plays a special fanfare of maxHP was raised.
{
	audio_play_sound(sfx_powerup2, 1, false);
}



//If this is the first red shard collected, explains what they are by making the player character spawn a speech bubble..
if (global.redShards == 1)
{
	with (other)
	{
		npc_speak("This is a red shard. Every four I collect raises my max HP.", "Player");
	}
}