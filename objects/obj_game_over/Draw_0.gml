/// @description Draw GUI
	//Temp values
	var cx, cy;
	
	//Get screen values
	cx = camera_get_view_x(view_camera[view_current]);
	cy = camera_get_view_y(view_camera[view_current]);
	
	//Draw surface
	if(!surface_exists(surf)) surf = surface_create(global.window_width, global.window_height);
	
	//Set target surface
	surface_set_target(surf);
	
	//Clear the alpha
	draw_clear_alpha(c_black, 0);
	
	//Get sprite width
	var width = sprite_get_width(spr_hud_gameover);
	
	//Draw game over
	draw_sprite(spr_hud_gameover, type, (global.window_width/2)-width-8 - offset, global.window_height/2);
	draw_sprite(spr_hud_gameover, 2, (global.window_width/2)+8+offset, global.window_height/2);
	
	//Reset surface target
	surface_reset_target();
	
	//Draw entire surface
	draw_surface(surf, cx, cy);