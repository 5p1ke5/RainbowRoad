if (gamepad_is_connected(0))
{
	npc_initialize("Sign","Did you know? You can run by holding 'B'.");
}
else
{
	npc_initialize("Sign","Did you know? You can run by holding 'X'.");
}

