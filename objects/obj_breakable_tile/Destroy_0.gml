/// @description Destroy tiles
	//Temp values
	var tilelayer, tileset, data, size_x, size_y, obj, dir;
	
	//Get layer tilemap
	tilelayer = layer_tilemap_get_id(target_layer);
	
	//Get the used tileset
	tileset = tilemap_get_tileset(tilelayer);
	
	//Get sprite size
	size_x = sprite_width / 16;
	size_y = sprite_height / 16;
	
	//Set the direction of the pieces
	dir = -sign(obj_player.ground_speed);
	
	//Play sound
	play_sound(sfx_break1);
	
	//Now destroy
	for(var i = 0; i < size_x; i++)
	{
		for(var j = 0; j < size_y; j++)
		{
			//Get tile data
			data = tilemap_get_at_pixel(tilelayer, i, j);
			
			//Create the obj
			obj = instance_create_depth(x+(16*i), y+(16*j), depth-300, obj_tilepiece);
			
			//Set object values
			obj.tileset = tileset;
			obj.tile_id = tilemap_get_at_pixel(tilelayer, x+16*i, y+16*j);
			obj.x_speed = dir*(size_x+2)+i;
			obj.y_speed = -((size_y/2)+3)+j;
			
			//Remove tiles from the area
			tile_set_empty(data);
			tilemap_set_at_pixel(tilelayer, data, x+16*i, y+16*j)
		}
	}
	