/// @description Values
	spr_width = sprite_get_width(sprite_index);
	screen_width = (global.window_width)/sprite_get_width(sprite_index);
	surf = surface_create(global.window_width, global.window_height);
	surf_bg = surface_create(global.window_width, global.window_height);
	
	//Change animation speed
	image_speed = 0.7;