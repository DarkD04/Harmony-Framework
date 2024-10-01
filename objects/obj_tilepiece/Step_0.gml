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
				var tile_x = tilemap_get_cell_x_at_pixel(tilelayer,x,y)
				var tile_y = tilemap_get_cell_y_at_pixel(tilelayer,x,y)
				var data = tilemap_get(tilelayer, tile_x, tile_y)
		        data = tile_set_empty(data)
				tilemap_set(tilelayer,data,tile_x,tile_y)
			}
		}
		y_speed += 0.25
		
		//Destroy off screen
		if(!on_screen(32, 32)) instance_destroy();
	}
	
	//Subtract timer
	delay = max(delay - 1, 0);