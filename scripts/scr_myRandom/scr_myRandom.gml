function my_irandom(_max)
{
	_irandom = (irandom(_max) * current_time) % (_max + 1);
	return _irandom;
}

function my_irandom_range(_min, _max)
{
	var _range = _max - _min
	_irandom = _min + (irandom(_range) * current_time) % (_range + 1);
	return _irandom;
}

/// @function my_choose(_choices)
/// @description Chooses a random item from the array.
/// @param _choices an array of elements. A random one will be chosen.
function my_choose(_choices)
{
	var _index = my_irandom(array_length(_choices))
	return array_get(_choices, _index);
}