/// @description Script
	//Update speed
	x += x_speed;
	y += y_speed;
	
	//Add gravity
	if(delay = 0)
	{
		if(collapse && y_speed <= 0.25)
		{
			for (var i = 0; i <= 1; ++i) 
			{		
				var tilelayer = layer_tilemap_get_id(global.col_tile[i]);
				var data = tilemap_get_at_pixel(tilelayer, 0, 0);
				tile_set_empty(data);
		        tilemap_set_at_pixel(tilelayer, data, x, y);
			}
		}
		y_speed += 0.25
		
		//Destroy off screen
		if(y > camera_get_view_y(view_camera[view_current]) + WINDOW_HEIGHT + 32) 
		{
			instance_destroy();
		}
	}
	
	//Subtract timer
	delay = max(delay - 1, 0);