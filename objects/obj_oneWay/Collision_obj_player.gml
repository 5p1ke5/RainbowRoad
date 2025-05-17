//if (variable_instance_get(other, "myCarry.id") == self.id)
if (other.myCarry) && (other.myCarry.id == self.id)
{
	return;	
}

show_debug_message("Hit - {0}", current_time);
