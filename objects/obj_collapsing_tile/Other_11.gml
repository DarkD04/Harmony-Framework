/// @description Generate Memory
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
			//store what it was before removing it
			if (!permanent) {
				var data_t = tilemap_get(tilelayer, i, j)
				ds_list_add(tile_memory,{
					_id:data_t,
					_x:i,
					_y:j,
				})
				for (var z = 0; z <= 1; ++z) 
				{		
					var tilelayer_c = layer_tilemap_get_id(global.col_tile[z]);
					var data_c = tilemap_get(tilelayer_c, i, j);
					ds_list_add(collision_memory[z],{
						_id:data_c,
						_x:i,
						_y:j,
					})
				}
			}
		}
		
	}