/// @description Destroy tiles
	//Temp values
	var tilelayer, tileset, data, size_x, size_y, obj, l_depth;
	
	//Get layer tilemap
	tilelayer = layer_tilemap_get_id(target_layer);
	
	//Get the used tileset
	tileset = tilemap_get_tileset(tilelayer);
	
	//Get sprite size
	size_x = sprite_width / 16;
	size_y = sprite_height / 16;
	
	//Play sound
	play_sound(sfx_break1);
	
	//Create collision
	var col = instance_create_depth(x, y, depth-300, obj_collision_area);
	col.image_xscale = size_x;
	col.image_yscale = size_y;
	col.start_right = bbox_right;
	col.start_left = bbox_left;
	col.facing = facing;
	
	//Now destroy
	for(var i = 0; i < size_x; i++)
	{
		for(var j = 0; j < size_y; j++)
		{
			//Get tile data
			data = tilemap_get_at_pixel(tilelayer, i, j);
			
			//Get layer depth
			l_depth = layer_get_depth(target_layer)
			
			//Create the obj
			if(facing = 1)
				obj = instance_create_depth(x+(sprite_width-16)-(16*i), y+(sprite_height-16)-(16*j), l_depth, obj_tilepiece);
			else
				obj = instance_create_depth(x+(16*i), y+(sprite_height-16)-(16*j), l_depth, obj_tilepiece);
			
			
			//Set object values
			obj.tileset = tileset;
			obj.tile_id = tilemap_get_at_pixel(tilelayer, obj.x, obj.y);
			obj.delay = ((size_x * i) +(size_y * j))/2
			obj.collapse = true;
			
			//Remove tiles from the area
			tile_set_empty(data);
			tilemap_set_at_pixel(tilelayer, data, obj.x, obj.y)
			
		}
		col.timer_end[i] = obj.delay;
	}
	
