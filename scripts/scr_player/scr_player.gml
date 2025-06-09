function player_die()
{
	instance_destroy();
	global.hp = global.maxHP;
	instance_create_depth(x, y, depth, obj_gameOver);
	
	audio_play_sound(sfx_playerDead, 1, false);
}

function player_hit()
{
	global.hp--;
	flicker = FLICKER_MAX;	
	vsp = -jumpHeight;
		
	//If above 0 hp just plays the damage sound effect, otherwise dies.
	if (global.hp > 0)
	{
		audio_play_sound(sfx_playerHit, 1, false);
	}
	else
	{
		player_die();
	}
}