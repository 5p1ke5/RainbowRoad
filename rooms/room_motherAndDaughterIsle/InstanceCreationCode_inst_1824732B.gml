doll_initialize(8, 11, 9, 0, 1, c_hispanic3, c_red, c_white, c_aqua, c_red);
npc_initialize("Hank", ["Oof! I cut all this lumber to build a bridge so I can see my girlfriend.", "But now I'm too tired to build a bridge! Could you help me?"])


if (global.starShardsFound[11])
{
	instance_destroy();	
}