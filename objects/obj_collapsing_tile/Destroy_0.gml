/// @description Destroy tiles
	//Temp values
	var tilelayer, tileset, data, size_x, size_y, obj, l_depth, min_x, max_x, min_y, max_y;
	
	//Get layer tilemap
	tilelayer = layer_tilemap_get_id(target_layer);
	
	//Get the used tileset
	tileset = tilemap_get_tileset(tilelayer);
	
	//Get sprite size
	size_x = sprite_width / 16;
	size_y = sprite_height / 16;
	
	//Play sound
	play_sound(sfx_break1);

	//Collapsing platform's bounding box in 16x16 size
	min_x = floor(x / 16.0);
    max_x = min_x + size_x;
    min_y = floor(y / 16.0);
    max_y = min_y + size_y;
	
	 for (var i = min_x; i < max_x; i++) 
	{
        for (var j = min_y; j < max_y; j++) 
		{
			//Create piece object
            var piece = instance_create_depth((i * 16.0), (j * 16.0), 100, obj_tilepiece);
			
			//Add the general delay
			piece.delay += collapsing_delay;
				
			piece.tileset = tileset;
			piece.tile_id = tilemap_get_at_pixel(tilelayer, piece.x, piece.y);
			piece.collapse = true;
			
			//Remove tiles from the area
			tilemap_set_at_pixel(tilelayer, 0, piece.x, piece.y);
			
			//Different cases for collapsing delay
			switch(collapsing_type)
			{
				//From right to left
				case 0:
					piece.delay = collapsing_speed * (size_y + 2 * (max_x - 1 - i) - (j - min_y));
				break;
		
				//From left to right
				case 1:	
					piece.delay = collapsing_speed * (size_y + 2 * (i - min_x) - (j - min_y));
				break;
				
				//From the center
				case 2:
					var tx = i - min_x;
	                if (tx < size_x / 2)
					{
	                    tx = max_x - 1 - i;
					}
	                piece.delay = collapsing_speed * ((size_y + 2 * (tx) - (j - min_y))) - size_x * 3;
				break;
				
				//From both left and right
				case 3:
					var tx = i - min_x;
	                if (tx > size_x / 2)
					{
	                    tx = max_x - 1 - i;
					}
	                piece.delay = collapsing_speed * ((size_y + 2 * (tx) - (j - min_y)));
				break;
			}
        }
    }
