/// @description Destroy tiles permanent

//Temp values
	var tilelayer, size_x, size_y, min_x, max_x, min_y, max_y;
	
	//Get sprite size
	size_x = sprite_width / 16;
	size_y = sprite_height / 16;
	
	//Get layer tilemap
	tilelayer = layer_tilemap_get_id(target_layer);

	//Collapsing platform's bounding box in 16x16 size
	min_x = floor(x / 16.0);
    max_x = min_x + size_x;
    min_y = floor(y / 16.0);
    max_y = min_y + size_y;
	
	for (var i = min_x; i < max_x; i++) 
	{
        for (var j = min_y; j < max_y; j++) 
		{	
			//Remove tiles from the area
			tilemap_set_at_pixel(tilelayer, 0, (i * 16.0), (i * 16.0));
			for (var z = 0; z <= 1; ++z) 
			{		
				var tilelayer_c = layer_tilemap_get_id(global.col_tile[z]);
				tilemap_set_at_pixel(tilelayer_c, 0, (i * 16.0), (i * 16.0));
			}
        }
    }