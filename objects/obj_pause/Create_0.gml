/// @description Initializes flicker, transition variables, string. Should usually be overwritten in creation code.
text = "PAUSE";
flicker = 0;

// Goes through global.starsNearby and checks if each element is true in the global.starsFound array
function _starsFoundNearbyFunction(element, index)
{
	return global.starsFound[element];
}

function _starShardsFoundNearbyFunction(element, index)
{
	return global.starShardsFound[element];
}


starsFoundNearby = array_length(array_filter(global.starsNearby, _starsFoundNearbyFunction));
starShardsFoundNearby = array_length(array_filter(global.starShardsNearby, _starShardsFoundNearbyFunction));