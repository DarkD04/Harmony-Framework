/// @description Draw Title Card
	var c, cx, cy;
	
	//Screen values
	c = view_camera[view_current];
	cx = camera_get_view_x(c);
	cy = camera_get_view_y(c);
	
	if (act_card) {
		var r = offset[5] - 256;
		var g = offset[5] - 128;
	    var b = offset[5];
	
	
		r = clamp(r, 0, 255);
		g = clamp(g, 0, 255);
		b = clamp(b, 0, 255);
	
		r ^= 0xFF;
	    g ^= 0xFF;
		b ^= 0xFF;
	
		//Color the fade
		var color = make_color_rgb(r, g, b);
	
		gpu_set_blendmode(bm_add);
		draw_set_color(color);
		draw_rectangle(cx, cy, cx+ global.window_width,  cy +global.window_height, false);
		draw_set_color(c_white)
		gpu_set_blendmode(bm_normal);	
	}
	
	//Draw whole ass water
	if(!surface_exists(surf_bg)) surf_bg = surface_create(global.window_width, global.window_height);
	
	//Draw shit in this
	surface_set_target(surf_bg);
	
	//Clear alpha
	draw_clear_alpha(c_black, 0)
	
	draw_set_font(fon_titlecard);
	draw_set_halign(fa_left);
	
	//Draw the red part of title card
	draw_set_color(#fc0000);
	draw_rectangle(offset[3], offset[2] - 16, offset[0], offset[2], false);
	
	
	draw_set_color(c_white);
	draw_set_halign(fa_center)
	draw_text((WINDOW_WIDTH / 2) + 2, offset[1]+2, string(obj_level.stage_name));
	//draw_text(152 - offset[2], 96, "ACT " + string(obj_level.act));
	draw_set_color(c_black);
	draw_text(WINDOW_WIDTH / 2, offset[1], string(obj_level.stage_name));

	
	draw_set_halign(fa_left)
	//Done
	surface_reset_target();

	//Draw surface
	draw_surface(surf_bg, cx, cy);