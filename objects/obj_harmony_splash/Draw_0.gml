	surface_deform(WINDOW_WIDTH, WINDOW_HEIGHT, deform_data, global.object_timer, 1);
	draw_sprite(spr_splash_bg, 0, 0, 0);
	shader_reset();
	
	draw_sprite_tiled_horizontal(spr_splash_border_top, 0, -global.object_timer, -bar_pos);
	draw_sprite_tiled_horizontal(spr_splash_border_bottom, 0, global.object_timer, WINDOW_HEIGHT+bar_pos);
	
	for (var i = 0; i < 3; ++i) 
	{
		if(!surface_exists(logo_surface[i]))
		{
			logo_surface[i] = surface_create(WINDOW_WIDTH, WINDOW_HEIGHT);
		}
	}
	
	surface_set_target(logo_surface[0]);
	
	draw_clear_alpha(c_white, 0);
	
	draw_sprite_ext(spr_splash_logo, 0, WINDOW_WIDTH / 2, (WINDOW_HEIGHT / 2), scale_x, scale_y, 0, c_white, 1);
	
	surface_reset_target();
	
	
	surface_set_target(logo_surface[1]);
	
	surface_deform(WINDOW_WIDTH, WINDOW_HEIGHT, distortion_y, global.object_timer * 3, 1);
	surface_copy(logo_surface[1], 0, 0, logo_surface[0]);
	shader_reset();
	
	surface_reset_target();
	
	surface_set_target(logo_surface[2]);
	
	surface_deform(WINDOW_WIDTH, WINDOW_HEIGHT, distortion_x, global.object_timer);
	surface_copy(logo_surface[2], 0, 0, logo_surface[1]);
	shader_reset();
	
	surface_reset_target();
	
	alpha_dither(dither_timer);
	draw_surface(logo_surface[2], 0, 0);
	shader_reset();