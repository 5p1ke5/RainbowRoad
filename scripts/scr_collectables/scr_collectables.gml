/// @function star_initialize(_index)
/// @description Initializes index for stars, destroys if already collected.
/// @param _index Index in global.starsFound that this star correlates to
function star_initialize(_index)
{
	index = _index;
	
	//If this star was already found, destroys self.
	if (global.starsFound[index])
	{
		instance_destroy();	
	}
}


function star_collect()
{
	audio_play_sound(sfx_powerup1, 1, false);
	global.starsFound[index] = true;
	instance_destroy();
}