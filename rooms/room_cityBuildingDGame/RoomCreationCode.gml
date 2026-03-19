var _doorsPerFloor = 5;
var _startX = 512;
var _marginX = 64;



// Creates 5 doors per floor and adds them to the correct floor array.

// Can maybe make this a matrix later, like...
//var _doors = [[],[],[]];

var _floor1 = [];
var _floor1Y = 928;

for (var _i = 0; _i < _doorsPerFloor; _i++) 
{
	var _doorX = _startX + (_i * _marginX);
	var _door = instance_create_layer(_doorX, _floor1Y, "Level", obj_hotelDoorOpen)
	array_push(_floor1, _door);
}

var _floor2 = [];
var _floor2Y = 784;

for (var _i = 0; _i < _doorsPerFloor; _i++) 
{
	var _doorX = _startX + (_i * _marginX);
	var _door = instance_create_layer(_doorX, _floor2Y, "Level", obj_hotelDoorOpen)
	array_push(_floor2, _door);
}


var _floor3 = [];
var _floor3Y = 640;

for (var _i = 0; _i < _doorsPerFloor; _i++) 
{
	var _doorX = _startX + (_i * _marginX);
	var _door = instance_create_layer(_doorX, _floor3Y, "Level", obj_hotelDoorOpen)
	array_push(_floor3, _door);
}


// Generates elevators.
//Gets a random door from each floor
var _floor1ElevatorUpIndex = irandom(array_length(_floor1) - 1)
var _floor1ElevatorUpDoor = _floor1[_floor1ElevatorUpIndex];

var _floor2ElevatorDownIndex = irandom(array_length(_floor2) - 1)
var _floor2ElevatorDownDoor = _floor2[_floor2ElevatorDownIndex];

//The selected door creates an elevator object, then removes itself from the floor array and deletees itself.
with (_floor1ElevatorUpDoor)
{
	var _floor1ElevatorUp = instance_create_layer(x, y, layer, obj_elevator);
	array_delete(_floor1, _floor1ElevatorUpIndex, 1)
	instance_destroy();
}

//The selected door creates an elevator object, then removes itself from the floor array and deletees itself.
with (_floor2ElevatorDownDoor)
{
	var _floor2ElevatorDown = instance_create_layer(x, y, layer, obj_elevator);
	array_delete(_floor2, _floor2ElevatorDownIndex, 1)
	instance_destroy();
}

//Next connect the two created elevators.
with (_floor1ElevatorUp) 
{ 
	teleporter_initialize(_floor2ElevatorDown.x, _floor2ElevatorDown.y);
}

with (_floor2ElevatorDown) 
{ 
	teleporter_initialize(_floor1ElevatorUp.x, _floor1ElevatorUp.y);
	sprite_index = spr_elevatorDown;
}




var _floor2ElevatorUpIndex = irandom(array_length(_floor2) - 1)
var _floor2ElevatorUpDoor = _floor2[_floor2ElevatorUpIndex];

var _floor3ElevatorDownIndex = irandom(array_length(_floor3) - 1)
var _floor3ElevatorDownDoor = _floor3[_floor3ElevatorDownIndex];

//The selected door creates an elevator object, then removes itself from the floor array and deletees itself.
with (_floor2ElevatorUpDoor)
{
	var _floor2ElevatorUp = instance_create_layer(x, y, layer, obj_elevator);
	array_delete(_floor2, _floor2ElevatorUpIndex, 1)
	instance_destroy();
}

//The selected door creates an elevator object, then removes itself from the floor array and deletees itself.
with (_floor3ElevatorDownDoor)
{
	var _floor3ElevatorDown = instance_create_layer(x, y, layer, obj_elevator);
	array_delete(_floor3, _floor3ElevatorDownIndex, 1)
	instance_destroy();
}

//Next connect the two created elevators.
with (_floor2ElevatorUp) 
{ 
	teleporter_initialize(_floor3ElevatorDown.x, _floor3ElevatorDown.y);
}

with (_floor3ElevatorDown) 
{ 
	teleporter_initialize(_floor2ElevatorUp.x, _floor2ElevatorUp.y);
	sprite_index = spr_elevatorDown;
}














