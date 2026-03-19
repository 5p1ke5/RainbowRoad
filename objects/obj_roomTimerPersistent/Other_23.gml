// Inherit the parent event, destroys self.
event_inherited();

instance_destroy();

audio_play_sound(sfx_ping, 1, false);