/// @description Script
	//Update speed
	x += x_speed;
	y += y_speed;
	
	//Add gravity
	if(delay = 0)
	{
		if(y < camera_get_view_y(view_camera[view_current]) - 32 || y > camera_get_view_y(view_camera[view_current]) + WINDOW_HEIGHT + 32) 
		{
			instance_destroy();
		}
		
		if(collapse && y_speed <= 0.25)
		{
			if (on_screen() || permanent){
				for (var i = 0; i <= 1; ++i) 
				{		
					var tilelayer = layer_tilemap_get_id(global.col_tile[i]);
					var data = tilemap_get_at_pixel(tilelayer, 0, 0);
					data = tile_set_empty(data);
			        tilemap_set_at_pixel(tilelayer, data, x, y);
				}
			}
		}
		y_speed += 0.25
	}
	
	//Subtract timer
	delay = max(delay - 1, 0);