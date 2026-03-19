/// @description When picked up destroys self, adds to moeny, makes player talk.

with (carrier)
{
	npc_speak("Wow! This diamond must be worth 200 coins!", "Player");
	myCarry = noone;
}

global.money += 200;
instance_destroy();

audio_play_sound(sfx_coin, 1, false);