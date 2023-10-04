/// @description Values
	character = global.character;
	
	//Movement values:
	x_speed = 0;
	y_speed = 0;
	ground_speed = 0;
	ground_angle = 0;
	mode = 0;
	point_x = [x, x];
	point_y = [y, y];
	x_dir = 0;
	y_dir = 1;
	steps = 1;
	angle_mode = 0;
	
	//Physics values
	x_accel = 0.046875;
	y_accel = 0.21875;
	friction_speed = 0.046875;
	top_speed = 6;
	max_speed = 24;
	jump_strenght = 6.5;
	
	//State related values:
	state = ST_NORMAL;
	spindash_rev = 0;
	skid_timer = 0;
	dropdash_timer = 0;
	force_roll = false;
	death_timer = 0;
	knockout_type = 0;
	jump_flag = false;
	direction_allow = true;
	movement_allow = true;
	attacking = false;
	
	//Flags:
	ground = true;
	landed = false;
	ceiling_allow = true;
	on_edge = false;
	on_object = false;
	platform_check = true;
	touching_ceiling = false;
	underwater = false;
	detach_allow = true;
	collision_allow = true;
	gravity_allow = true;
	ground_collision_allow = true;
	ceiling_lock = 0;
	facing = 1;
	debug = false;
	input_disable = false;
	is_time_over = false;
	speed_allow = true;
	roll_mov = true;
	can_collect_rings = true;
	follower = false;
	
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
	
	//Character specifics:
	tails_timer = 480;
	knuckles_angle = 90;
	glide_speed = 2.5;
	knux_frame = 0;
	
	//Misc:
	control_lock = 0;
	visual_angle = 0;
	ceiling_landing = 0;
	plane = 0;
	air = 0;
	jump_anim_speed = 0;
	shield = S_NONE;
	shield_list = [obj_shield, obj_fire_shield, obj_electric_shield, obj_bubble_shield];
	
	//Create important objects:
	instance_create_depth(0, 0, 0, obj_camera);
	
	//Additional stuff:
	animation_init();
	player_recorder_setup();
	player_get_input();
	
	//Disable title card input
	if(instance_exists(obj_titlecard)) input_disable = true;