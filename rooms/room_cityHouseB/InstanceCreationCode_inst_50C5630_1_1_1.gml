doll_initialize(0, 3, 4, 0, 0, c_white1, c_brunette, c_brown, c_aqua, c_brown);

if (gamepad_is_connected(0))
{
	npc_initialize("Brawny", "I love to hold B to run! It lets me go faster and jump higher!");
}
else
{
	npc_initialize("Brawny", "I love to hold X to run! It lets me go faster and jump higher!");
}


