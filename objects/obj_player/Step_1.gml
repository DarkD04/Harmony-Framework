/// @description Pre-main player
	
	//Water run object
	if(instance_exists(obj_water) && !instance_exists(obj_water_run)) instance_create_depth(x, obj_water.y, 0, obj_water_run);
	//Flag reset
	ramp_fix = false;
	ceiling_allow = true;
	detach_allow = true;
	
	//Hande player physics values
	player_handle_physics();
	
	//Handle invincibility and speed shoes
	player_inv_speed();