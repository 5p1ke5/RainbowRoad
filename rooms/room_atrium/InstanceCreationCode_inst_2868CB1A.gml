switch (global.shipDoorTo) 
{    
	case room_beach:
        npc_initialize("Dr. Ocean", ["Hello! I'm Dr. Ocean. I found you drifting in the sea so fished you out of the water.", "My nemesis, the evil Dr. Sky kidnapped my husband, wife, and son.", "Will you help me get them back?", "We need to collect the stars to get to Sky Island."]);
        break;
	case room_flowerFields:
        npc_initialize("Dr. Ocean", ["This fertile island is known for being covered in dense forest.", "My sensors indicate a big star is located at the top of the giant tree here."]);
        break;
	case room_city:
        npc_initialize("Dr. Ocean", ["Shore City is a dense metro area with lots of shops and games to play.", "If you're low on cash, I hear Cesario is hiring."]);
        break;
	case room_skyIsland:
        npc_initialize("Dr. Ocean", ["This is where Dr. Sky is holding my husband, wife, and son! I've prepared a special device to help you get up into the sky."]);
        break;
	case room_dirtIsland:
        npc_initialize("Dr. Ocean", ["This island has lots of soft soil to dig up. I bet there are star shards buried here!"]);
        break;
	case room_lavaIsle:
        npc_initialize("Dr. Ocean", ["Dino Island is populated by friendly dinosaurs. You can even jump on their backs and take them for a ride."]);
        break;
	case room_motherAndDaughterIsle:
        npc_initialize("Dr. Ocean", ["The Mother and Daughter Isles are two small islands that are close together. It looks like there's a trailer on each one."]);
        break;
    default:
        npc_initialize("Dr. Ocean", ["Remember to save your game often."]);
        break;
}

/*
if (talkedToCount > 1)
{
	
}
*/

doll_initialize(0, 5, 14, 0, 0, c_white1, c_blue, c_white, c_dkgray, c_red);