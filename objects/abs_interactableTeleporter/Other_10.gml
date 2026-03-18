/// @description If interacted with teleports the player.
var _player = instance_nearest(x, y, obj_player);

if (_player)
{
	teleporter_teleport(xTo, yTo, _player);
}