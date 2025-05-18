///Speaks.

show_debug_message("Speak! {0}", current_time);

/// @description NPC speech.
if !(instance_exists(myBalloon)) && (dialogue != "")
{
	myBalloon = npc_speak(dialogue);
}