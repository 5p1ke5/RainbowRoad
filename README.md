todo:
-edit physics so that collision code actually gets a reference to the instance at the end of the code and that way it can check if collision is on for that instance and if collision is off for that instance it ignores collisions with it.
-Figure out what to do when you end up inside of a solid object.
--collision event for block: if player is inside damage them and turn collision off [how to turn it back on? maybe if collision is off check if player is inside?]