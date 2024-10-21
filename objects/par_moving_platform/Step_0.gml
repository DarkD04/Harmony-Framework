/// @description Script
	//Temp values
	var old_x, old_y;
	
	var col = player_collide_object(C_BOTTOM);
	
	//Get previous position values
	old_x = round(x);
	old_y = round(y);
	

	//Position the platform
	x = round(origin_x + range_x * dsin(angle_x));
	y = round(origin_y + range_y * dcos(angle_y)) + sink_offset + (fall_offset);
	
	//Add angle and modulate it
	if fall_timer > 0 {
		angle_x = (angle_x + x_speed) mod 360;
		angle_y = (angle_y + y_speed) mod 360;
	}
	
	if fall_timer = 61 {
		for(var i = 0; i < ds_list_size(attached_list); i++){
			with(attached_list[| i])
			{
				if(attached) {
					x = other.xstart - attach_offset_x;
					y = other.ystart - attach_offset_y;
					show_debug_message("{0} : {1}",x , y)
					show_debug_message("{0} : {1}",other.x , other.y)
					show_debug_message("{0} : {1}",round(other.x - old_x) , round(other.y - old_y))
				}
			}
		}
		fall_timer = 60
	}
	
	//make the platform fall
	if (fall && fall_timer = 60 && col && col.ground) {
		fall_timer--	
	}
	if (fall && fall_timer < 60) {
		fall_timer--
		
		if fall_timer = 0 {
			last_x = x
			last_y = y
		}
		
		if fall_timer < 0 {
			fall_speed += 0.21875
			if (fall_timer < -30 && col && col.ground) {
				//eject player off after falling for too long
				col.ground = false
				col.y_speed = fall_speed
				collision_flag = false
			}
			fall_offset += fall_speed
			if (!on_screen() && !origin_on_screen(last_x, last_y, 32, 32)) {
				//reset to return back to normal
				collision_flag = true
				fall_timer = 61
				fall_speed = 0
				fall_offset = 0
				
			}
		}
	}
	
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
		col.x += round(x - old_x);
		col.y += round(y - old_y);
	}
	
	//Move the objects
	if !ds_list_empty(attached_list) {
		for(var i = 0; i < ds_list_size(attached_list); i++)
		{
			with(attached_list[| i])
			{

					if(attached && other.fall_timer > 0 && other.fall_timer != 61)
					{
						if object_get_parent(object_index) != par_moving_platform {
							x += round(other.x - old_x);
							y += round(other.y - old_y);
						} else {
							origin_x += round(other.x - old_x);
							origin_y += round(other.y - old_y);
						}
					}
					
					if (object_get_parent(object_index) = par_badnik && other.fall_timer = 0) {
							attached = false;
							ds_list_delete(other.attached_list, i);
					}
			}
		}
	}