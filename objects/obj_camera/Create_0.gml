/// @description Values
	center_x = global.window_width/2
	center_y = global.window_height/2
	shift_x = 0;
	shift_y = 0;
	roll_offset = 0;
	camera_shake = 0;
	camera_x = obj_player.x;
	camera_y = obj_player.y;
	target_x = obj_player.x;
	target_y = obj_player.y;
	mode = 0;
	target = obj_player;
	h_lag = 0;
	v_lag = 0;
	previous_x = 0;
	previous_y = 0;
	
	limit_right = room_width;
	target_right = room_width;
	limit_left = 0;
	target_left = 0;
	limit_bottom = room_height;
	target_bottom = room_height;
	limit_top = 0;
	target_top = 0;
	
	camera_type = 1; //Type 0 is classic megadrive camera. Type 1 is mania camera
	ground_offset = 0;