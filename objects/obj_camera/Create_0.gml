	/// @description Values
	
	//Center of the screen
	center_x = WINDOW_WIDTH / 2;		//Horizontal center of the screen
	center_y = WINDOW_HEIGHT / 2;		//Vertical center of the screen
	
	//Shift values
	shift_x = 0;						//Horizontal offset
	shift_y = 0;						//Vertical offset
	roll_offset = 0;					//Offset for when the player rolls
	look_shift = 0;						//Offset for when the player looks up or down
	ground_offset = 0;					//Margin ground offset, used for mania vertical focus
	
	//Timers
	camera_shake = 0;					//Camera shake, it's being subtracted by a multiplier
	look_timer = 0;						//Timer value for when player looks up or down
	h_lag = 0;							//Lag timer for horizontal scrolling of the camera
	v_lag = 0;							//Lag timer for vertical scrolling of the camera
	
	//Position values
	camera_x = obj_player.x;			//Horizontal position of the screen
	camera_y = obj_player.y;			//Vertical position of the screen
	target_x = obj_player.x;			//Horizontal position of the target
	target_y = obj_player.y;			//Vertical position of the target
	previous_x = 0;						//Previous horizontal position of the camera
	previous_y = 0;						//Previous vertical position of the camera
	knux_offset_x = 0;					//Target horizontal position for knuckles ledge climb
	knux_offset_y = 0;					//Target vertical position for knuckles ledge climb
	
	//Camera mode
	mode = CAM_NORMAL;					//Current mode of the camera, defined as user event
	
	//Camera target
	target = obj_player;				//Target instance of the camera
	
	//Camera speeds
	scroll_speed_x = 16;				//Target horizontal scrolling speed
	scroll_speed_y = 24;				//Target vertical scrolling speed
	x_speed = scroll_speed_x;			//Value for horizontal scroll speed
	y_speed = scroll_speed_y;			//Value for vertical scroll speed
	return_speed = 0;					//Speed for camera returning, reserved by mode 1
	
	//Camera boundaries
	limit_right = room_width;			//Camera lock boundary for the right side
	limit_left = 0;						//Camera lock boundary for the left side
	limit_bottom = room_height;			//Camera lock boundary for the bottom side
	limit_top = 0;						//Camera lock boundary for the top side
	target_right = room_width;			//Target position for moving the right boundary
	target_left = 0;					//Target position for moving the left boundary
	target_bottom = room_height;		//Target position for moving the bottom boundary
	target_top = 0;						//Target position for moving the top boundary
	
	//Camera macros:
	#macro CAM_NULL -1
	#macro CAM_NORMAL 0
	#macro CAM_RETURN 1
	#macro CAM_RETURN_KNUCKLES 2