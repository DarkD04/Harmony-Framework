function player_collision(){
	//Left wall collision
	while(point_check(-wall_w, wall_h))
	{
		x += y_dir;	
		y -= x_dir;
	}
	
	//Right wall collision
	while(point_check(wall_w, wall_h))
	{
		x -= y_dir;	
		y += x_dir;
	}
	
	//Reset ceiling flag
	touching_ceiling = false;
	
	//If player is inside ceiling
	if(line_check(-hitbox_w, -hitbox_h-8) || line_check(hitbox_w, -hitbox_h-8))
	{
		touching_ceiling = true
	}
	
	//Check if player is on the terrain
	if(line_check(hitbox_w, hitbox_h+16, true) || line_check(0, hitbox_h+16, true) || line_check(-hitbox_w, hitbox_h+16, true))
	{
		on_terrain = true;
	}
	else
	{
		on_terrain = false;	
	}
		

	//Check landing
	if(y_speed > 0 && !ground)
	{
		if(line_check(hitbox_w, hitbox_h, true) || line_check(-hitbox_w, hitbox_h, true))
		{
			//Ground the player and convert x speed to ground speed
			ground = true;
			landed = true;
			ground_speed = x_speed;
			reach_range = 48;
				
			//Call angle detection
			player_angle_detection();
				
			//Reposition floor mode
			player_reposition_mode();
				
			//Landing speed (From 24 to 90 degrees)
			if(ground_angle >= 24 && ground_angle <= 90)
			{
			    if (ground_angle >= 45)
				{
			        ground_speed = (abs(x_speed) <= abs(y_speed) ? y_speed * -1 : x_speed);
			    }
			    else{
			        ground_speed = (abs(x_speed) <= abs(y_speed/2) ? (y_speed / 2) * -1 : x_speed);
			    }
			}else
				
				
			//Landing speed (From 24 to 90 degrees)
			if(ground_angle <= 336 && ground_angle >= 270)
			{
			    if (ground_angle <= 315)
				{
			        ground_speed = (abs(x_speed) <= abs(y_speed) ? y_speed : x_speed);
			    }
			    else{
			        ground_speed = (abs(x_speed) <= abs(y_speed/2) ? (y_speed / 2) : x_speed);
			    }
			}
		}	
	}
			
	//Handle slope collision
	if(ground)
	{
		//Get the detach offset
		var detach_distance = on_edge ? 1 : 16;
			
		//Move down slope
		if(line_check(hitbox_w, hitbox_h+16, true) && !on_edge || line_check(0, hitbox_h+16, true) && !on_edge || line_check(-hitbox_w, hitbox_h+16, true) && !on_edge)
		{
			on_terrain = true
			while(!line_check(hitbox_w, hitbox_h, true) && !line_check(-hitbox_w, hitbox_h, true) && !line_check(0, hitbox_h, true) && ground_push_flag && !on_object)
			{
				x += x_dir;
				y += y_dir;	
			}
		}
		
		//Move up the slope:
		while(line_check(hitbox_w, hitbox_h, true) && ground_push_flag || line_check(0, hitbox_h, true) && ground_push_flag || line_check(-hitbox_w, hitbox_h, true) && ground_push_flag)
		{
			x -= x_dir;
			y -= y_dir;	
		}
			
		//Detach off the ground
		if(!line_check(hitbox_w, hitbox_h+detach_distance, true) && !line_check(0, hitbox_h+detach_distance, true) && !line_check(-hitbox_w, hitbox_h+detach_distance, true) &&
		!check_object(wall_w, 0, wall_w, hitbox_h+8, true) && !force_roll && detach_allow)
		{
			ground = false;	
			ground_angle = 0;
			player_reposition_mode();
		}
			
	}
		
	//Handle player's angle detection
	player_angle_detection();
		
	//Handle ceiling collision
	if(!ground)
	{
		//Initialize ceiling landing
		if(point_check(-hitbox_w, -hitbox_h) && y_speed < -2.5 && ceiling_allow && !ground || point_check(hitbox_w, -hitbox_h) && y_speed < -2.5 && ceiling_allow && !ground)
		{
			ceiling_landing = 1;	
		}
				
		//Change the angle
		if(ceiling_landing = 1)
		{
			var temp_angle;
					
			//Get the angle from the ceiling
			if(point_check(-hitbox_w, -hitbox_h))
			{
				temp_angle = get_angle(floor(x)-hitbox_w, floor(y)-hitbox_h, 2, 32);	
			}
			else 
			{
				temp_angle = get_angle(floor(x)+hitbox_w, floor(y)-hitbox_h, 2, 32);	
			}
					
			//Check if angle is in the range, if not cancel ceiling landing
			if(temp_angle >= 90 && temp_angle <= 180 - 45 || temp_angle >= 180 + 45 && temp_angle <= 270) {
				ground_angle = temp_angle;
				ceiling_landing = 2
				player_reposition_mode();
			} 
			else
			{
				ground_angle = 0;
				ceiling_landing = 0;
			}
		}
				
				
		//Land the player on the ceiling
		if(ceiling_landing = 2)
		{
			ground_speed = ground_angle < 180 ? -y_speed : y_speed;
			ceiling_landing = 0;
			control_lock = 2;
			ceiling_lock = 16;
			state = ST_NORMAL;
			ground = true;
		}

			
		//Ceiling solid collision
		if(mode = 0)
		{
			while(line_check(hitbox_w, -hitbox_h) || line_check(-hitbox_w, -hitbox_h))
			{
				y += 1;
			
				//Stop vectical movement
				if(y_speed < 0) 
				{
					y_speed = 0;
				}
			}
		}
	}
		
	//Reset angle when airborn
	if(!ground)
	{
		ground_angle = 0;	
		player_reposition_mode();
	}
	
}