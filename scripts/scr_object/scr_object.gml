/// @function object_is_family(_obj, _par)
/// @description Checks if the passed _obj is an instance of or the child of the passed _par
/// @param _obj An object index to check.
/// @param _par ANother object to check if the first object is equal to or child of.
function object_is_family(_obj, _par)
{
	//If an instance is passed just assumes you meant to pass the object index and so converts it to its object index.
	if !(object_exists(_obj))
	{
		_obj = _obj.object_index;	
	}
	
	if !(object_exists(_par))
	{
		_par = _par.object_index;	
	}
	
	
	return (_obj == _par) || ( object_is_ancestor(_obj, _par))
}