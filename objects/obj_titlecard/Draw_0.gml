/// @description Draw Title Card
	var c, cx, cy;
	
	//Screen values
	c = view_camera[view_current];
	cx = camera_get_view_x(c);
	cy = camera_get_view_y(c);
	
	//Draw whole ass water
	if(!surface_exists(surf_bg)) surf_bg = surface_create(global.window_width, global.window_height);
	
	//Draw shit in this
	surface_set_target(surf_bg);
	
	//Clear alpha
	draw_clear_alpha(c_black, 0)
	
	if(act_card)
	{
		//Draw black part of the rectanle
		if(timer < 64)
		{
			draw_set_color(c_black);
			draw_rectangle(0,0, global.window_width, global.window_height, false);
		}
	
		//Draw background of the title card
		draw_set_color(#48486c);
		draw_rectangle(0,0, global.window_width, global.window_height-offset[0], false);
	
		//Draw top part of the card
		draw_set_color(#9090b4);
		draw_rectangle(offset[3], 0, global.window_width, 48, false);
	
		//Draw bottom part of the card
		draw_set_color(#9090b4);
		draw_rectangle(0, global.window_height-48, global.window_width-offset[3], global.window_height, false);
	}
	
	//Draw the red part of title card
	draw_set_color(#fc0000);
	draw_rectangle(64+offset[2], 64, global.window_width, 64+16, false);
	
	//Draw the left part of the sprite
	draw_set_color(c_white);
	for (var i = 0; i < 4; ++i) {
	   draw_sprite(spr_title_card_piece,0, -offset[1], 64*i)
	}
	
	//Draw the red part of title card
	draw_set_color(#fc0000);
	draw_rectangle(0, 96, global.window_width-offset[2]-112, 96+16, false);
	
	//Reset color
	draw_set_color(c_white);
	
	//Set font numbers
	draw_set_font(global.text_font);
	draw_set_halign(fa_left);
	
	draw_text(128 + offset[2], 64, string(obj_level.stage_name));
	draw_text(152 - offset[2], 96, "ACT " + string(obj_level.act));
	
	//Done
	surface_reset_target();

	//Draw surface
	draw_surface(surf_bg, cx, cy);