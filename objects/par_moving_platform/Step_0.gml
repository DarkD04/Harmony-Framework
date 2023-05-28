/// @description Script
	//Temp values
	var old_x, old_y;
	
	//Get previous position values
	old_x = round(x);
	old_y = round(y);
	

	//Position the platform
	x = round(xstart + range_x * dsin(angle_x));
	y = round(ystart + range_y * dcos(angle_y)) + sink_offset;
	
	//Add angle and modulate it
	angle_x = (angle_x + x_speed) mod 360;
	angle_y = (angle_y + y_speed) mod 360;
	
	//Sink the platform
	if(sink && player_collide_object(C_BOTTOM_EXT) && obj_player.ground)
	{
		sink_offset = lerp(sink_offset, 8, 0.2);
	}else
	{
		sink_offset = lerp(sink_offset, 0, 0.2);	
	}
	
	//Move the player
	if(player_collide_object(C_BOTTOM_EXT) && obj_player.ground)
	{
		obj_player.x += round(x - old_x);
		obj_player.y += round(y - old_y);
	}
	
	//Move the objects
	for(var i = 0; i < array_length(move_object); i++)
	{
		with(move_object[i])
		{
			if(x > other.bbox_left && x < other.bbox_right && y < other.bbox_bottom + 32 && y > other.bbox_top - other.object_range )
			{
				x += round(other.x - old_x);
				y += round(other.y - old_y);
			}
		}
	}