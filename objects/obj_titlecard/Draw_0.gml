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
	
		gpu_set_blendmode(bm_subtract);
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
	
	var act_text = "Zone " + string(obj_level.act)
	if (obj_level.act == 0) {
		act_text = "Zone"	
	}
	
	draw_set_font(fon_titlecard);
	draw_set_halign(fa_left);
	if(timer < 100) {
		var curve = animcurve_get(curve_titlecard)
		var c_channel_3 = animcurve_get_channel(curve,"curve3")
		var c_channel_4 = animcurve_get_channel(curve,"curve4")
		offset[4] = (-string_width(string(obj_level.stage_name))) - 24 + (animcurve_channel_evaluate(c_channel_3, min(timer / 100,1)) * (string_width(string(obj_level.stage_name))+ 71 + 24))
		offset[6] = -string_width(act_text) - 24 + (animcurve_channel_evaluate(c_channel_4, min(timer / 100,1)) * (string_width(act_text)+ 71 + 24))
	}
	
	//Draw the red part of title card
	draw_set_color(#fc0000);
	draw_rectangle(0, 16 + offset[2], offset[0], 16+16 + +  offset[2], false);
	
	
	draw_set_color(c_black);
	draw_text(offset[4] +10, offset[2]+2, string(obj_level.stage_name));
	//draw_text(152 - offset[2], 96, "ACT " + string(obj_level.act));
	draw_set_color(c_white);
	draw_text(offset[4]+8, offset[2], string(obj_level.stage_name));
	
	//Draw the left part of the sprite
	
	draw_set_color(c_white);
	for (var i = 0; i < 4; ++i) {
	   draw_sprite_part(spr_title_card_piece,0,0,0,64,224, -offset[3], (-64*i) + timer)
	   draw_sprite_part(spr_title_card_piece,0,64,0,8,224, -offset[3] + 64, (64*i) - (timer /2))
	}
	
	//Draw the red part of title card
	draw_set_color(#fc0000);
	draw_rectangle(0, 16 +  offset[1], (offset[0]+ 48) / 3, 16+16 + +  offset[1], false);
	
	
	//Set font numbers
	
	draw_set_font(fon_titlecard);
	draw_set_halign(fa_left);
	draw_set_color(c_black);
	draw_text(offset[6] +10, offset[1]+2, act_text);
	//draw_text(152 - offset[2], 96, "ACT " + string(obj_level.act));
	draw_set_color(c_white);
	draw_text(offset[6]+8, offset[1], act_text);
	
	
	//Done
	surface_reset_target();

	//Draw surface
	draw_surface(surf_bg, cx, cy);