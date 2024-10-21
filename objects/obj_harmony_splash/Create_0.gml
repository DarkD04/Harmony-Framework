	for (var i = 0; i < 3; ++i) 
	{
	    logo_surface[i] = surface_create(WINDOW_WIDTH, WINDOW_HEIGHT)
	}
	
	distortion_x = [];
	distortion_y = [];
	
	for (var i = 0; i < 128; ++i) 
	{
	    deform_data[i] = 8 * dsin((360 / 128) * i);
	}
	
	range_x = 64;
	range_y = 32;
	
	scale_x = 1;
	scale_y = 2;
	
	dither_timer = 0;
	
	timer = 0;
	
	ease_timer[0] = 1;
	ease_timer[1] = 1;
	ease_timer[2] = 0;
	ease_timer[3] = 0;
	
	bar_pos = 0;
	
	fade_in_room(3);
	play_sound(j_harmony_splash);