///@description When called saves the game and heals the player

savegame_save(SAVEFILE);

global.hp = global.maxHP

audio_play_sound(sfx_save, 1, false);