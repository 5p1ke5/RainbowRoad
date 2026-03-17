// Inherit the parent event, makes a singelton
event_inherited();

//If there's already an instance of this object, destroys self.
if (instance_number(object_index) > 1)
{
	instance_destroy();
}