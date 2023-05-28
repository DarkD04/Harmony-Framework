/// @description Draw fade
	//Screen values
	var c, cx, cy, sw, sh, r, g, b;
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	sw = global.window_width;
	sh = global.window_height;
	
	//==FADE CODE==//
	r = fade_timer;
	g = fade_timer - 128;
    b = fade_timer - 256;
	
	if (r < 0) r = 0;
    else if (r > 255) r = 255;
    if (g < 0) g = 0;
    else if (g > 255) g = 255;
    if (b < 0) b = 0;
    else if (b > 255) b = 255;
	
	r ^= 0xFF;
    g ^= 0xFF;
	b ^= 0xFF;
	
	//Color the fade
	var color = make_color_rgb(r , g , b );
	
	//Draw the fade
	gpu_set_blendmode_ext(bm_dest_color, bm_zero); 
	draw_set_color(color);
	draw_rectangle(cx, cy, cx + sw, cy + sh, false);
	draw_set_color(c_white)
	gpu_set_blendmode(bm_normal);
	
	//Add fade timer depending on the type
	fade_timer -= (fade_speed * (512/100)) * fade_type;
	
	//Limit the fade
	fade_timer = clamp(fade_timer, 0, 512);