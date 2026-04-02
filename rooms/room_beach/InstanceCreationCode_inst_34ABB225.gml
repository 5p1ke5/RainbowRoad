if (gamepad_is_connected(0))
{
	npc_initialize("Sign","If you press A while holding an object in midair, you'll double jump off it!");
}
else
{
	npc_initialize("Sign","If you press SPACE while holding an object in midair, you'll double jump off it!");
}

