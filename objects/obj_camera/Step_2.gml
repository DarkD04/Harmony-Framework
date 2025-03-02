	//Previous positions
	previous_x = target_x;
	previous_y = target_y;
	
	//Center of the screen
	center_x = WINDOW_WIDTH / 2;
	center_y = WINDOW_HEIGHT / 2;
	
	//Set camera mode
	event_user(mode);
	
	//Set position
	camera_x = clamp(target_x + shift_x, limit_left + center_x, limit_right - center_x);
	camera_y = clamp(target_y + shift_y + look_shift + 16, limit_top + center_y, limit_bottom - center_y);
	
	//The way this shake works is simple, the screen gets offset by the timer, if timer is an odd number, it moves to the negative
	var shake_x_result = (FRAME_TIMER % 2 == 0 ? shake_x : -shake_x);
	var shake_y_result = (FRAME_TIMER % 2 == 0 ? shake_y : -shake_y);
	
	//Subtract the shake timer
	shake_x = max(shake_x - shake_speed, 0);
	shake_y = max(shake_y - shake_speed, 0);
	
	//Scroll the room
	camera_set_view_pos(view_camera[0], floor(camera_x) - center_x + random_range(-camera_shake, camera_shake) + shake_x_result, floor(camera_y) - center_y + random_range(-camera_shake, camera_shake) + shake_y_result);
	
	//Camera shake
	camera_shake *= 0.9;
	if(camera_shake <= 1) 
	{
		camera_shake = 0;
	}
	
	//You know, sometimes it's boring to look at the checkerboard background, so have a parallax!
	layer_x(layer_get_id("Background"), camera_get_view_x(view_camera[view_current]) * 0.7);
	layer_y(layer_get_id("Background"), camera_get_view_y(view_camera[view_current]) * 0.7);
	
	//Subtract lag value
	h_lag = max(h_lag - 1, 0);
	v_lag = max(v_lag - 1, 0);
	
	//Function for camera boundaries
	camera_boundaries();