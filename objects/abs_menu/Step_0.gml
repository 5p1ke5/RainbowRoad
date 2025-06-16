/// @description allows swapping menu items. Handling for different options should be done in children.
var _arraySize = array_length(options);

optionSelected += DOWN_BUTTON_PRESSED - UP_BUTTON_PRESSED;

//alternately :
//optionSelected = abs(optionSelected) % _arraySize;

//If option goes beyond bounds of array loops to other side.
if (optionSelected < 0)
{
	optionSelected = _arraySize - 1;
}

if (optionSelected >= _arraySize)
{
	optionSelected = 0;
}