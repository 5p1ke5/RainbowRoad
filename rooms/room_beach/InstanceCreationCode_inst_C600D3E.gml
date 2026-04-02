if (gamepad_is_connected(0))
{
	npc_initialize("Sign", ["You can throw objects directly up by pressing Up + X.", "This is handy for placing objects directly where you're standing."]);
}
else
{
	npc_initialize("Sign", ["You can throw objects directly up by pressing Up + Z.", "This is handy for placing objects directly where you're standing."]);
}