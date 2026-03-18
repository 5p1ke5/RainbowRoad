function teleporter_initialize(_xTo, _yTo)
{
	xTo = _xTo;
	yTo = _yTo;
}

function teleporter_teleport(_xTo, _yTo, _instance)
{
	with (_instance)
	{
		x = _xTo;
		y = _yTo;
	}
}