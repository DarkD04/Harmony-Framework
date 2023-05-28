/// @description Values
	surf_bg = surface_create(global.window_width, global.window_height);
	surf = surface_create(global.window_width, global.window_height);
	timer = 0;
	render_bg = true;
	
	//Offset values
	offset[0] = global.window_height + 32;
	offset[1] = global.window_width + 32;
	offset[2] = global.window_width + 32;
	offset[3] = global.window_width + 32;
	
	//Speed up
	if(!render_bg) timer = 32;
	
	//Disable flags
	Input.DisableInput = true;
	obj_level.disable_timer = true;
	