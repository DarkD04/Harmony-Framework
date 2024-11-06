/// @description Destroy tiles
	//Controller rumble
	gamepad_rumble(10, 1);
	
	//Temp values
	var tilelayer, tileset, size_x, size_y, obj, dir;
	
	//Get layer tilemap
	tilelayer = layer_tilemap_get_id(target_layer);
	
	//Get the used tileset
	tileset = tilemap_get_tileset(tilelayer);
	
	//Get sprite size
	size_x = sprite_width / 16;
	size_y = sprite_height / 16;
		
	//Set the direction of the pieces
	dir = sign(obj_player.ground_speed);
	
	//Play sound
	play_sound(sfx_break1);

	//Get positions
	var startX	= dir == 1 ? bbox_right : x;
	var startY	= y + (sprite_height / 2);
	var endX	= x + 8;
	var endY	= y + 8;
		
	//Get position only for the breakable floor
	if(breakable_type >= 1)
	{
		var startX	= x + (sprite_width / 2);
		var startY	= bbox_bottom;
	}
		
	var curY = endY - startY;
	for (var j = 0; j < size_y; j++) 
	{
		var curX	= endX - startX;
		var angleX	= 2 * (endX - startX);
		
		for (var i = 0; i < size_x; i++) 
		{
			var tile =  instance_create_depth(curX + startX - 8, curY + startY - 8, 100, obj_tilepiece);

			//Apply tileset and tile ID before tile get's removed
			tile.tileset = tileset;
			tile.tile_id = tilemap_get_at_pixel(tilelayer, tile.x, tile.y);
			
			//Remove tiles from the area
			tilemap_set_at_pixel(tilelayer, 0, tile.x, tile.y)
				
			switch(breakable_type)
			{
				case 0:		//Breakable wall physics
				//Set the angle for the pieces
				var angle	= darctan2(angleX, curY);
				var angle2	= 0;
				if (abs(curX) > 8.0) {
					if (curX + startX >= startX)
						angle2 = darctan2(8, curY);
					else
						angle2 = darctan2(-8, curY);
				}
				else {
					angle2 = darctan2(curX, curY);
				}
				
				//Apply speed for the pieces
				tile.x_speed = -1.0 * dir;
				tile.y_speed = 1.0;
				tile.x_speed += 0.078125 * (((size_y * 8) + 3.0 * abs(curX) - abs(curY)) / 4.0) * dsin(angle);
				tile.y_speed += 0.0625 * ((abs(curY) + abs(curX) + 2.0 * abs(curY)) / 4.0) * dcos(angle2);
				break;
					
				case 1:
				case 2:
				case 3:
					var angle		= darctan2(angleX, curY);
					var velocity	= (abs(curX) + 2.0 * abs(curY)) / 4.0;
					
					// TODO: Check this
					tile.x_speed += 0.078125 * velocity * dsin(angle);
					tile.y_speed += 0.078125 * velocity * dcos(angle);
				break;
			}
				
			//Add for the loop
			curX += 16;
			angleX += 32;
		}
		curY += 16;
	}