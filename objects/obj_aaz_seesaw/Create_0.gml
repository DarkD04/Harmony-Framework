/// @description Values

	child_left = instance_create_depth(x-32, y+64, depth, obj_aaz_seesaw_launcher)
	child_right = instance_create_depth(x+32, y+64, depth, obj_aaz_seesaw_launcher)
	child_weight = instance_create_depth(x+32, y+64, depth, obj_aaz_seesaw_weight)
	for (var i = 0; i < 5; ++i) 
	{
	    child_bead[i] = instance_create_depth(x-24+(i*12), y+64, depth+3, obj_aaz_seesaw_bead)
	}
	bouncing = false
	weight = 0
	right_override = false
	weightoff = false
