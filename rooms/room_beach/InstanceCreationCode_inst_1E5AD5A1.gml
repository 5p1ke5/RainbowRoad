if (gamepad_is_connected(0))
{
	npc_initialize("Sign","You can press START to pause the game and view collectable items in the area.");
}
else
{
	npc_initialize("Sign","You can press ENTER to pause the game and view collectable items in the area.");
}

