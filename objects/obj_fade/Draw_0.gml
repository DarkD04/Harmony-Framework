/// @description Draw fade
	//Screen values
	var c, cx, cy, sw, sh, r, g, b;
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	sw = global.window_width;
	sh = global.window_height;
	
	//==FADE CODE==//
	if(fade_white)
	{
		r = fade_timer - 256;
		g = fade_timer - 128;
	    b = fade_timer;
	}
	else
	{
		r = fade_timer - 256;
		g = fade_timer - 128;
	    b = fade_timer;
	}
	
	r = clamp(r, 0, 255);
	g = clamp(g, 0, 255);
	b = clamp(b, 0, 255);
	
	r ^= 0xFF;
    g ^= 0xFF;
	b ^= 0xFF;
	
	//Color the fade
	var color = make_color_rgb(r, g, b);
	
	//Draw the fade
	if(fade_white)
	{
		gpu_set_blendmode(bm_add);
	}
	else
	{
		gpu_set_blendmode(bm_subtract);
	}
	draw_set_color(color);
	draw_rectangle(cx, cy, cx + sw, cy + sh, false);
	draw_set_color(c_white)
	gpu_set_blendmode(bm_normal);