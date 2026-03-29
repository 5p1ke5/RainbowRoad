/// @function star_initialize(_index)
/// @desc Initializes index for stars, destroys if already collected.
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


/// @function star_collect()
/// @desc Destroys star and sets its corresponding index in the starsFound array to true. Also plays the sound effect.
function star_collect()
{
	audio_play_sound(sfx_powerup1, 1, false);
	global.starsFound[index] = true;
	instance_destroy();
}


/// @function star_number()
/// @desc Gets the number of stars collected.
function star_number()
{
	 return array_length(array_filter(global.starsFound, function _fB(element, index) {return element;}))
}

/// @function star_total()
/// @desc Gets the total of stars + stars from star shards
function star_total()
{
	return star_number() + (starShard_number() div 5);
}

/// @function starShard_initialize(_index)
/// @desc Initializes index for starshard, destroys if already collected.
/// @param _index Index in global.starsFound that this star correlates to
function starShard_initialize(_index)
{
	index = _index;
	
	//If this star was already found, destroys self.
	if (global.starShardsFound[index])
	{
		instance_destroy();	
	}
}


/// @function starShard_collect()
/// @desc Destroys starShard and sets its corresponding index in the starsFound array to true. Also plays the sound effect.
function starShard_collect()
{
	global.starShardsFound[index] = true;
	
	if (starShard_number() % 5 != 0)
	{
		with (other)
		{
			npc_speak("I have " + string(starShard_number() % 5) + " star shards now! If I get 5 I can make them into a star.", "Player");	
		}
	}
	else
	{
		with (other)
		{
			npc_speak("I got five star shards! I combined them into a star. I now have " + string(star_total()) + " Stars!.", "Player");	
		}
	}
	
	audio_play_sound(sfx_powerup1, 1, false);
	instance_destroy();
}





/// @function starShard_number()
/// @desc Gets the number of stars collected.
function starShard_number()
{
	 return array_length(array_filter(global.starShardsFound, function _fA(element, index) {return element;}))
}