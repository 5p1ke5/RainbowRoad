switch (global.shipDoorTo) 
{    
	case room_beach:
        npc_initialize("Dr. Ocean", ["Hello! I'm Dr. Ocean. I found you drifting in the sea so fished you out of the water.", "My nemesis, the evil Dr. Sky kidnapped my husband, wife, and son.", "Will you help me get them back?", "We need to collect the stars to get to Sky Island."]);
        break;
	case room_flowerFields:
        npc_initialize("Dr. Ocean", ["This fertile island is known for being covered in dense forest.", "My sensors indicate a big star is located at the top of the giant tree here."]);
        break;
	case room_city:
        npc_initialize("Dr. Ocean", ["This fertile island is known for being covered in dense forest.", "My sensors indicate a big star is located at the top of the giant tree here."]);
        break;
	case room_sky:
        npc_initialize("Dr. Ocean", ["This fertile island is known for being covered in dense forest.", "My sensors indicate a big star is located at the top of the giant tree here."]);
        break;
    default:
        npc_initialize("Dr. Ocean", ["Hello! I'm Dr. Ocean. I found you drifting in the water so fished you out of the water.", "My nemesis, the evil Dr. Sky kidnapped my husband, wife, and son.", "Will you help me get them back?", "We need to collect the stars to get to Sky Island."]);
        break;
}




doll_initialize(0, 5, 14, 0, 0, c_white1, c_blue, c_white, c_dkgray, c_red);