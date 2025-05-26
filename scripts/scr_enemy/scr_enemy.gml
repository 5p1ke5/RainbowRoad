/// @function enemy_initialize(_hp = 1)
/// @description Initializes variables for enemy characters.
/// @description _hp The amount of times the enemy can be hit
function enemy_initialize(_hp = 1)
{
	hp = _hp;
	flicker = -1;
}