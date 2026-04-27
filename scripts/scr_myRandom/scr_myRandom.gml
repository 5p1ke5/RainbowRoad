function my_random()
{
}

function my_irandom(_int)
{
	_irandom = (irandom(_int) * current_time) % _int;
	return _irandom;
}

function my_irandom_range(_int)
{

}