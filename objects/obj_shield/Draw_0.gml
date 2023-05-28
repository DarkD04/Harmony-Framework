/// @description Draw shield effects
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 0.6)
	gpu_set_blendmode(bm_normal);

	//Lmao
	var cx, cy;
	cx = camera_get_view_x(view_camera[view_current]);
	cy = camera_get_view_y(view_camera[view_current]);
	
	
	//Draw whole ass water
	if(!surface_exists(surf)) surf = surface_create(48, 48);
	
	
	surface_set_target(surf);
	draw_clear_alpha(c_white, 0)
	
	//Copy screen
	surface_copy(surf, cx-x + sprite_width/2, cy-y + sprite_height/2, application_surface);
	
	//Draw mask
	gpu_set_blendmode(bm_subtract)
	draw_sprite(spr_shield_mask, 0, 24, 24)
	gpu_set_blendmode(bm_normal)
	surface_reset_target();

	set_color_grading(tex_shield_lut, 17);
	draw_surface(surf, x - sprite_width/2, y - sprite_height/2);
	shader_reset();