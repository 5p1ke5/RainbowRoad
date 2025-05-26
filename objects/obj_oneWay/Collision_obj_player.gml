if (other.myCarry) && (other.myCarry.id == self.id)
{
	return;	
}

//Just leaving this on for a moment. Might put this on enemies as conditional for their damage but we'll see.
if (other.bbox_bottom > bbox_top + 1)
{
	show_debug_message("Hit - {0}", current_time);
}