/// @description Draw debug
	//Stop if player doesn't exist
	if(!instance_exists(obj_player)) exit;
	
	//Draw hitboxes
	if(show_hitbox)
	{
		with(all)
		{
			if(object_index != obj_player && object_index != obj_effect && object_index != obj_dust_effect)	
			{
				if(object_index = par_solid) exit
				draw_set_color(c_blue);
				draw_set_alpha(0.5);
				draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
				draw_set_alpha(1);
				draw_set_color(c_white);
			}
		}
	}
	
	//Create surface
	if(!surface_exists(surf)) surf = surface_create(global.window_width, global.window_height);
			
	if(show_player && !debug)
	{
		//Set surface target
		surface_set_target(surf);
		draw_clear_alpha(c_black, 0);
		
		//Draw rectangle
		draw_set_color(c_black);
		draw_set_alpha(0.7);
		draw_rectangle(global.window_width-152, 16, global.window_width, global.window_height-16, false);
		draw_set_alpha(1);
		draw_set_color(c_white);
	
		//Draw text in rectangle
		draw_set_font(global.font_small);
		draw_set_halign(fa_center);
		draw_text(global.window_width-152/2, 16, "PLAYER DEBUG")
		
		//Draw info
		draw_set_halign(fa_left);
		draw_text(global.window_width-150, 32, "X: " + string(floor(obj_player.x)));
		draw_text(global.window_width-150, 32+(8*1), "Y: " + string(floor(obj_player.y)));
		draw_text(global.window_width-150, 32+(8*2), "X SPEED: " + string(obj_player.x_speed));
		draw_text(global.window_width-150, 32+(8*3), "Y SPEED: " + string(obj_player.y_speed));
		draw_text(global.window_width-150, 32+(8*4), "G SPEED: " + string(obj_player.ground_speed));
		draw_text(global.window_width-150, 32+(8*5), "ANGLE: " + string(obj_player.ground_angle));
		draw_text(global.window_width-150, 32+(8*6), "V ANGLE: " + string(obj_player.visual_angle));
		draw_text(global.window_width-150, 32+(8*7), "GROUND: " + string(obj_player.ground));
		draw_text(global.window_width-150, 32+(8*8), "STATE: " + string(obj_player.state));
		draw_text(global.window_width-150, 32+(8*9), "ANIM: " + string(obj_player.animation));
		
		//Reset surface target
		surface_reset_target();
		
		//Draw surface
		draw_surface(surf, camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]))	
		
		//Draw hitbox
		draw_set_color(c_red);
		draw_set_alpha(0.7);
		draw_rectangle(floor(obj_player.x)-obj_player.wall_w, floor(obj_player.y)-obj_player.hitbox_h, floor(obj_player.x)+obj_player.wall_w, floor(obj_player.y)+obj_player.hitbox_h, false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		
		//Draw angle sensors
		draw_set_color(c_red);
		draw_point(obj_player.point_x[0], obj_player.point_y[0]);
		draw_point(obj_player.point_x[1], obj_player.point_y[1]);
		draw_set_color(c_white);
	}
	
	if(show_fps)
	{
		//Set surface target
		surface_set_target(surf);
		draw_clear_alpha(c_black, 0);
		
		//Draw text in rectangle
		draw_set_font(global.font_small);
		draw_set_halign(fa_left);
		draw_text(0, global.window_height-8, "FPS: " + string(fps) + " " + "TRUE FPS:" +string(store_truefps));
		
		//Reset surface target
		surface_reset_target();
		
		//Draw surface
		draw_surface(surf, camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]))	
	}
	//Disable not in debug mode
	if(!debug) exit;
	
	draw_set_alpha(0.75);
	var sprite = object_get_sprite(object_list[object_select]);
	draw_sprite(sprite, 0, mouse_x, mouse_y);
	draw_set_alpha(1);
	
	//Set surface target
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	//Draw text in rectangle
	draw_set_font(global.font_small);
	draw_set_halign(fa_left);
	draw_text(0, 0, string_upper(window_get_caption()));
	
	//Draw info
	draw_set_halign(fa_right);
	draw_text(global.window_width, 0,"CAMERA: " + string(floor(obj_camera.camera_x)) + " " + string(floor(obj_camera.camera_y)));
	draw_text(global.window_width, 8,"CANVAS: " + string(room_width) + " " + string(room_height));
	
	surface_reset_target()
	
	draw_set_halign(fa_center);
	draw_text(mouse_x, mouse_y-32, string_upper(object_get_name(object_list[object_select])));
	
	//Draw surface
	draw_surface(surf, camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]))	