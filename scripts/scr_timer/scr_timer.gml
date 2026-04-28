/// @function timer_initialize()
/// @description intializes variables for a timer.
/// @param _duration number of frames for the timer to count down. Positive = active, 0 = going off, -1 = inactive.
/// @param _time Starting time for the timer. Defaults to _duration.
/// @param _loop Should the timer loop. Defaults to false.
function timer_initialize(_duration, _time = _duration, _loop = false)
{
	duration = _duration;
	time = _time;
	loop = _loop;
	
}

/// @function timer_step()
/// @description decrements a timer during the step event..
function timer_step(_decrement = 1)
{
	if (time > 0)
	{
		time -= _decrement;	
	}
	
	if (time <= 0)
	{
		event_user(USER_EVENTS.U_EVENT_TIMER)
	}
}

/// @function timer_reset()
/// @description Resets the timer. Should usually go in Event 13
function timer_reset()
{
	if (loop)
	{
		time = duration;	
	}
}