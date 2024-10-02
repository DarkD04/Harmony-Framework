/// @description Script
	//Temp values
	var old_x, old_y;
	
	//Get previous position values
	old_x = floor(x);
	old_y = floor(y);
	

	//Position the platform
	x = floor(origin_x + range_x * dsin(angle_x));
	y = floor(origin_y + range_y * dcos(angle_y)) + sink_offset;
	
	//Add angle and modulate it
	angle_x = (angle_x + x_speed) mod 360;
	angle_y = (angle_y + y_speed) mod 360;
	var col = player_collide_object(C_BOTTOM_EXT);
	//Sink the platform
	if(sink && col && col.ground)
	{
		sink_offset = lerp(sink_offset, 8, 0.2);
	}else
	{
		sink_offset = lerp(sink_offset, 0, 0.2);	
	}
	
	//Move the player
	if(col && col.ground)
	{
		col.x += floor(x - old_x);
		col.y += floor(y - old_y);
	}
	
	//Move the objects

		for(var i = 0; i < ds_list_size(attached_list); i++)
		{
			with(attached_list[| i])
			{
					if(attached)
					{
						if object_get_parent(object_index) != par_moving_platform {
							x += floor(other.x - old_x);
							y += floor(other.y - old_y);
						} else {
							origin_x += floor(other.x - old_x);
							origin_y += floor(other.y - old_y);
						}
					}
			}
		}
	