/// @description Pre-main player
	//Change character
	character = global.character;
	
	//Water run object
	if(instance_exists(obj_water) && !instance_exists(obj_water_run)) instance_create_depth(x, obj_water.y, 0, obj_water_run);
	
	//Tails object
	if(character = CHAR_TAILS && !instance_exists(obj_tails_object)) instance_create_depth(x, y, depth + 1, obj_tails_object)
	if(character != CHAR_TAILS)instance_destroy(obj_tails_object);
	
	//Flag reset
	ramp_fix = false;
	ceiling_allow = true;
	detach_allow = true;
	
	//Hitbox variables
	hitbox_top_offset = 0;
	hitbox_left_offset = 0;
	hitbox_bottom_offset = 0;
	hitbox_right_offset = 0;
	
	//Player input scripts
	player_get_input();
	
	//Hande player physics values
	player_handle_physics();
	
	//prevent player for dieing in the bonus stage
	if (instance_exists(obj_bonus_level)) {
		disable_death = true	
	}
	
	//check if player should be able to turn super
	allow_super = true
	if (input_disable || obj_level.disable_timer || instance_exists(obj_bonus_level) || instance_exists(par_shield)){
		allow_super = false	
	}
	
	//Handle invincibility and speed shoes
	player_inv_speed();