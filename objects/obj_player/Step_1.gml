/// @description Pre-main player
	
	//Water run object
	if(instance_exists(obj_water) && !instance_exists(obj_water_run)) instance_create_depth(x, obj_water.y, 0, obj_water_run);
	
	//Tails object
	if(character = CHAR_TAILS && !instance_exists(obj_tails_object)) instance_create_depth(x, y, depth + 1, obj_tails_object)
	if(character != CHAR_TAILS)instance_destroy(obj_tails_object);
	
	//Flag reset
	ramp_fix = false;
	ceiling_allow = true;
	detach_allow = true;
	
	//Hande player physics values
	player_handle_physics();
	
	//Handle invincibility and speed shoes
	player_inv_speed();