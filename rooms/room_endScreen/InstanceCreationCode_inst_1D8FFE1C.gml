if (global.flagHusbandFound) && (global.flagWifeFound) && (global.flagSonFound)
{
	text = 	 "After a long adventure, you have rescued Dr. Ocean's family. As a reward, he has made you the new captain of the Kujira! With the wind at your back, go out and find the last of the stars!"
}

if (global.flagHusbandFound) && (global.flagWifeFound) && (!global.flagSonFound)
{
	text = 	 "You rescued everyone excep Dr. Ocean's son, but he decides that's good enough. As a reward, Dr. Ocean has made you the new captain of the Kujira! With the wind at your back, go out and find the last of the stars!"
}


if (global.flagHusbandFound) && (!global.flagWifeFound) && (global.flagSonFound)
{
	text =  "After a long adventure, you have rescued Dr. Ocean's family except for his wife. While Dr. Ocean goes to find a new wife, he has made you the new captain of the Kujira! With the wind at your back, go out and find the last of the stars!"
}

if (!global.flagHusbandFound) && (global.flagWifeFound) && (global.flagSonFound)
{
	text = 	 "After a long adventure, you have rescued Dr. Ocean's family except for his husband. While Dr. Ocean goes to find a new man, he has made you the new captain of the Kujira! With the wind at your back, go out and find the last of the stars!"
}

if (!global.flagHusbandFound) && (!global.flagWifeFound) && (global.flagSonFound)
{
	text = 	 "After a long adventure, you were only able to save Dr. Ocean's son. Since he's busy raising his child now, Dr. Ocean he has made you the new captain of the Kujira! With the wind at your back, go out and find the last of the stars!"
}

if (global.flagHusbandFound) && (!global.flagWifeFound) && (!global.flagSonFound)
{
	text = 	 "After a long adventure, you have rescued Dr. Ocean's husband. While he hits the dating scene, Dr. Ocean has made you the new captain of the Kujira! With the wind at your back, go out and find the last of the stars!"
}

if (!global.flagHusbandFound) && (global.flagWifeFound) && (!global.flagSonFound)
{
	text = 	 "After a long adventure, you have rescued Dr. Ocean's wife. While he looks for a new husband, Dr. Ocean has made you the new captain of the Kujira! With the wind at your back, go out and find the last of the stars!"
}

if (!global.flagHusbandFound) && (!global.flagWifeFound) && (!global.flagSonFound)
{
	text = 	 "You completely failed to save any of Dr. Ocean's family. After leaving Dr. Sky's palace, you kill Dr. Ocean and take his ship. You are the new captain of the Kujira! With the wind at your back, go out and find the last of the stars!"
}