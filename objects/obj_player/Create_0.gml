/// @description Values
	
	//Movement values:
	x_speed = 0;		//Horizontal movement speed.
	y_speed = 0;		//Vertical movement speed.
	ground_speed = 0;	//Player's on ground movement speed.
	ground_angle = 0;	//Player's angle on the ground.
	mode = 0;			//Player's floor mode. 0: Floor. 1:Left wall. 2:Ceiling. 3:Right Wall.
	point_x = [x, x];	
	point_y = [y, y];
	x_dir = 0;
	y_dir = 0;
	steps = 1;
	
	//Physics values
	x_accel = 0.046875;
	y_accel = 0.21875;
	friction_speed = 0.046875;
	top_speed = 6;
	max_speed = 20;
	jump_strenght = 6.5;
	
	//State related values:
	state = ST_NORMAL;
	spindash_rev = 0;
	skid_timer = 0;
	
	//Flags:
	ground = true;
	landed = false;
	jump_flag = false;
	direction_allow = true;
	movement_allow = true;
	ceiling_allow = true;
	ramp_fix = false;
	on_object = false;
	platform_check = true;
	touching_ceiling = false;
	force_roll = false;
	underwater = false;
	detach_allow = true;
	collision_allow = true;
	ceiling_lock = 0;
	knockout_type = 0;
	facing = 1;
	death_timer = 0;
	
	//Hitbox values:
	hitbox_w = 9;
	hitbox_h = 19;
	wall_w = 10;
	wall_h = 0;
	old_hitbox_h = 0;
	
	//Timers and physics modifiers
	speed_shoes = 0;
	speed_shoes_flag = false;
	invincible = false;
	invincible_timer = 0;
	
	//Misc:
	control_lock = 0;
	visual_angle = 0;
	ceiling_landing = 0;
	plane = 0;
	jump_anim_speed = 0;
	shield = S_NONE;
	shield_list = [obj_shield, obj_fire_shield, obj_electric_shield, obj_bubble_shield];
	
	//Create important objects:
	instance_create_depth(0, 0, 0, obj_camera);
	
	//Additional stuff:
	animation_init();
	player_recorder_setup();
	

	