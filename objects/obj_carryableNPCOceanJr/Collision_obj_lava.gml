instance_destroy(myBalloon);

npc_speak("NOOOOO I CAN'T BELIEVE YOU THREW ME INTO THE LAVA! CURSE YOU!!", "Ocean Jr.");

instance_destroy();

var _drOcean = instance_nearest(x, y, obj_npcDrOceanB);

if (_drOcean)
{
	with (_drOcean)
	{
		dialogue = "Whoa you killed my son! Oh well I never liked him much anyhow.";
		instance_destroy(myBalloon);
		npc_speak(dialogue, name);
	}
}

global.flagSonFound = false;