/// @description TODO: Move to proper hurtbox. Code for collision with enemies/hurtboxes. I need to move this to the step event probably...Under like if (B_BUTTON), probably

//Ignores if its a carried object or if collision is off.
if ((myCarry) && (myCarry.id == other.id)) || !(other.collision)
{
	return;	
}



if (bbox_bottom + 1 > other.bbox_top - 1)
{
	if (flicker < 0)
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
			instance_destroy();
			instance_create_depth(x, y, depth, obj_gameOver);
			audio_play_sound(sfx_playerDead, 1, false);
			global.hp = global.maxHP;
		}
	}
}