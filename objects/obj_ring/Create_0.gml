/// @description Values
	x_speed = 0;
	y_speed = 0;
	magnet = false;
	ringloss = false;
	culling = true;
	timer = 0;
	animation_speed = 0.55;
	plane = PLANE_A;
	image_speed = 0;
	
	if (!instance_exists(obj_bonus_level)) {
		if (global.store_object_state[| id]) {
			instance_destroy()	
		}
	}