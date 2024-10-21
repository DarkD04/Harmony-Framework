	//Previous positions
	previous_x = target_x;
	previous_y = target_y;
	
	//Set camera mode
	event_user(mode);
	
	//Set position
	camera_x = clamp(target_x + shift_x, limit_left + center_x, limit_right - center_x);
	camera_y = clamp(target_y + shift_y + look_shift + 16, limit_top + center_y, limit_bottom - center_y);
	
	//Scroll the room
	camera_set_view_pos(view_camera[0], floor(camera_x) - center_x + random_range(-camera_shake, camera_shake), floor(camera_y) - center_y + random_range(-camera_shake, camera_shake));
	
	//Camera shake
	camera_shake *= 0.9;
	if(camera_shake <= 1) 
	{
		camera_shake = 0;
	}
	
	//Subtract lag value
	h_lag = max(h_lag - 1, 0);
	v_lag = max(v_lag - 1, 0);
	
	//Function for camera boundaries
	camera_boundaries();