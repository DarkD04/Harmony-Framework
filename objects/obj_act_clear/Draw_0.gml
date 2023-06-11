/// @description Draw End Card
	//Local variables
	var cx, cy;

	//Get screen position
	cx = camera_get_view_x(view_camera[view_current]);
	cy = camera_get_view_y(view_camera[view_current]);
	
	//Create surface if it doesn't exist
	if(!surface_exists(surface)) surface = surface_create(global.window_width, global.window_height);
	
	//Set surface target
	surface_set_target(surface);
	draw_clear_alpha(c_black,0);
	
	//Draw the end card text
	draw_sprite(spr_hud_actclear_character, global.character, global.window_width/2 - offset_x[0], global.window_height/2 - 50);
	draw_sprite(spr_hud_actclear_thru_act, obj_level.act - 1, global.window_width/2 + offset_x[0], global.window_height/2 - 32);
	
	draw_sprite(spr_hud_actclear_time_bonus, 0, global.window_width/2-98 + offset_x[1], global.window_height/2);
	draw_sprite(spr_hud_actclear_ring_bonus, 1, global.window_width/2-98 + offset_x[2], global.window_height/2 + 16);
	draw_sprite(spr_hud_actclear_total_bonus, 2, global.window_width/2-82 + offset_x[3], global.window_height/2 + 48);
	
	
	//Draw numbers
	draw_set_halign(fa_right);
	draw_set_font(global.hud_number);
	
	//Draw text
	draw_text(global.window_width/2+82 + offset_x[1], global.window_height/2, string(time_bonus));
	draw_text(global.window_width/2+82 + offset_x[2], global.window_height/2+16, string(ring_bonus));
	draw_text(global.window_width/2+74 + offset_x[3], global.window_height/2+48, string(total_bonus));
	
	draw_set_halign(fa_left);
	
	//Reset surface target ID
	surface_reset_target();
	
	//Draw the surface
	draw_surface(surface, cx, cy);