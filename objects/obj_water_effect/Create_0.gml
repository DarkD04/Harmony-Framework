
	global.pal_surf = surface_create(global.window_width, global.window_height);
	
	//Visual functions
	function aaz2_water_dist_start(){
		if(!instance_exists(obj_water)) exit;
		var c = view_camera[0];
              
	    if (!surface_exists(global.pal_surf)) 
		{
	        global.pal_surf = surface_create(global.window_width, global.window_height);
	    }

	    surface_set_target(global.pal_surf);
                  
	    camera_apply(c);
	    draw_clear_alpha(c_white, 0);
	}

	function aaz2_water_dist_end(){
		if(!instance_exists(obj_water)) exit;
		
		var c = view_camera[0];
	    var cx = camera_get_view_x(c);
	    var cy = camera_get_view_y(c);
  
		
	    surface_reset_target();
	
		//Shader shit
		var distort_data = [1, 1, 2, 2, 3, 3, 3, 3, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -2, -2, -3, -3, -3, -3, -2, -2, -1, -1,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

		surface_deform(global.window_width, global.window_height, distort_data, cy + global.object_timer / 3)
	   
		draw_surface_part(global.pal_surf, -8, obj_water.y-cy, WINDOW_WIDTH + 32, cy, cx-8, obj_water.y);
	    shader_reset();
		
		draw_surface_part(global.pal_surf, 0, 0, WINDOW_WIDTH + 32, obj_water.y-cy,cx, cy);
	}
	