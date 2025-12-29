	animator = new animator_create();

	animation_add(0,spr_crabmeat_walk,16,0, true, true)
	animation_add(1,spr_crabmeat_walkl_steep,16, 0, true, true)
	animation_add(2,spr_crabmeat_walkr_steep,16, 0, true, true)
	animation_add(3,spr_crabmeat_shoot,1,0 ,true)
	
	// Set up badnik's values
	move_speed = 0.25
	steep_side = -1
	x_speed = -move_speed;
	y_speed = 0;
	state_time = 0;
	state = 0;
	facing = 1;
	walk_distance = 0
	
	