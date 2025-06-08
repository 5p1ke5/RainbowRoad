/// @description Initialize physics variables.
//phys_initialize(,,,,,,,, [abs_enemy]);
phys_initialize(,,,,,,,, [abs_enemy, obj_blockSand]);
//Problem: The above code only works if its literally the same object index (so abs_enemy doesn't work.) Figure out inheritance stuff.


//Initializes variables for carrying this object.
carry_initialize();