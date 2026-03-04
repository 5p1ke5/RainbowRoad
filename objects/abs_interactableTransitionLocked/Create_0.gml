/// @description Inherits to initialize variables, decides if locked or not.
event_inherited();

//Sets Locked variable. This can be overwritten in craetion code.
//If the previous room is the door this one leads to, assumes that this door was already unlocked.
locked = (roomTo == room_last);