/// @description Increments flicker, awaits input
flicker++;

if (A_BUTTON_RELEASED || B_BUTTON_RELEASED || X_BUTTON_RELEASED || Y_BUTTON_PRESSED)
{
	transition_goto(roomTo, spawnX, spawnY, spawnHsp, spawnVsp);	
}