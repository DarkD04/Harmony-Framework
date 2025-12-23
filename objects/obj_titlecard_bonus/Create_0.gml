/// @description Values
	surf_bg = surface_create(global.window_width, global.window_height);
	surf = surface_create(global.window_width, global.window_height);
	timer = 0;
	act_card = true
	
	//Offset values
	offset[0] = 0
	offset[1] = 0
	offset[2] = 0
	offset[3] = 0
	offset[4] = -512
	offset[5] = -512
	offset[6] = 0
	
	//Disable flags
	obj_player.input_disable = true;
	obj_level.disable_timer = true;