/// @description Draw the HUD

	//Don't render the hud
	if(!render)
	{
		exit;	
	}
	
	//Temp value
	var minute, sec, milsec, c, cx, cy;
	
	//Screen values
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	
	//Time
	milsec = floor(global.stage_timer/10) mod 100;
	sec = floor(global.stage_timer/1000) mod 60;
	minute = floor(global.stage_timer/60000);
	
	//Draw whole ass water
	if(!surface_exists(surf)) surf = surface_create(global.window_width, global.window_height);
	
		
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	//Draw normal text
	draw_sprite(spr_hudtext, 0, 16 + offset[0], 8);
	draw_sprite(spr_hudtext, 1, 16 + offset[1], 24);
	draw_sprite(spr_hudtext, 2, 16 + offset[2], 40);
	
	//Red flashing text
	if(global.rings == 0 && global.object_timer mod 20 < 20/2) draw_sprite(spr_hudtext, 4, 16 + offset[2], 40);
	if(global.stage_timer >= 540000 && global.object_timer mod 20 < 20/2) draw_sprite(spr_hudtext, 3, 16 + offset[1], 24);
	
	//Draw life icon
	draw_sprite(spr_hud_life_icons, global.character, 16 + offset[3], global.window_height - 26);
	
	//Set font numbers
	draw_set_font(global.hud_number);
	draw_set_halign(fa_right);
	
	//Draw number
	draw_text(120 + offset[0], 9, string(global.score));
	draw_text(120 + offset[1], 25, string(minute)+" "+(sec > 9 ? "" : "0") + string(sec)+" "+(milsec > 9 ? "" : "0") + string(milsec));
	draw_text(96 + offset[2], 41, string(global.rings));
	draw_text(56 + offset[3], global.window_height - 24, (global.life > 9 ? "" : "0") + string(global.life));
	
	surface_reset_target();
	
	draw_surface(surf, cx, cy);
	
	
	if(slide_in)
	{
		for(var i = 0; i <= 3; i++)
		{
			var debug_offset = 0;
			if(instance_exists(obj_dev)) debug_offset = -128 * obj_dev.debug;
			offset[i] = approach(offset[i], debug_offset, 8);	
		}
	}
	
