function player_angle_detection(){
	//Temp values
	var posx, posy;
	
	//Reset angle to the default
	static new_angle = 0;
	
	//Reset ramp flag to default
	on_edge = false;
	ground_push_flag = true;
	
	if(on_object)
	{
		ground_angle = 0;
		exit;	
	}
	
	//Ground angle detection
	if(mode == 0 && !landed && ground)
	{
		if(point_check(-wall_w-8, wall_h, false) && ground_angle == 0)
		{
			var temp_ang = get_angle(x - wall_w-8, y + wall_h, 3);
					
			//Calculate difference between current ground angle and temp angle
			var ang_diff = abs(ground_angle-temp_ang);
					
			//show_debug_message(ang_diff)
			if(ang_diff < 300 && ang_diff > 270)
			{
				//new_angle = 0;
				//on_edge = true;
				ground_push_flag = false;
			}
		}
					
		if(point_check(wall_w+8, wall_h, false) && ground_angle == 0)
		{
			var temp_ang = get_angle(x + wall_w+8, y + wall_h, 1);
					
			//Calculate difference between current ground angle and temp angle
			var ang_diff = abs(ground_angle-temp_ang);

			if(ang_diff > 60 && ang_diff < 90)
			{
				//new_angle = 0;
				//on_edge = true;
				ground_push_flag = false;
			}
		}
					
		//Left ramp edge
		if(!line_check(-wall_w, hitbox_h+16, true) && line_check(hitbox_w, hitbox_h+16, true))
		{
			//Get temporary ground angle
			var temp_ang = get_angle(x-hitbox_w, y+hitbox_h+1, 1, 32);

			//Calculate difference between current ground angle and temp angle
			var ang_diff = abs(ground_angle-temp_ang);
				
			//If difference is too steep disable force angle detection to 0 and disable slope push down
			if(ang_diff > 45 && ang_diff < 90)
			{
				on_edge = true;
			}
		}
			
		//Right ramp edge
		if(line_check(-hitbox_w, hitbox_h+16, true) && !line_check(wall_w, hitbox_h+16, true))
		{
			//Get temporary ground angle
			var temp_ang = get_angle(x+hitbox_w, y+hitbox_h+1, 3, 32);
						
			//Calculate difference between current ground angle and temp angle
			var ang_diff = abs(ground_angle-temp_ang);
			
			//If difference is too steep disable force angle detection to 0 and disable slope push down
			if(ang_diff > 270 && ang_diff < 315)
			{
				on_edge = true;
			}
		}
	}
		
	//Get ground angle
	if(ground)
	{
		//Get new ground angle
		if(!on_object && !on_edge)
		{
			//Get new angle from left ground sensor
			if(line_check(-hitbox_w, hitbox_h+1, true) && !line_check(hitbox_w, hitbox_h, true))
			{
					
				switch(mode)
				{
					case 0:
						posx = floor(x) - hitbox_w
						posy = floor(y) + hitbox_h
					break;
						
					case 1:
						posx = floor(x) + hitbox_h
						posy = floor(y) + hitbox_w
					break;
						
					case 2:
						posx = floor(x) - hitbox_w
						posy = floor(y) - hitbox_h
					break;
						
					case 3:
						posx = floor(x) - hitbox_h
						posy = floor(y) - hitbox_w
					break;
				}
					
				//Return new angle
				new_angle = get_angle(posx, posy, mode, reach_range);
			}
			
			//Get new angle from right ground sensor
			if(!line_check(-hitbox_w, hitbox_h, true) && line_check(hitbox_w, hitbox_h+1, true))
			{
				switch(mode)
				{
					case 0:
						posx = floor(x) + hitbox_w
						posy = floor(y) + hitbox_h
					break;
						
					case 1:
						posx = floor(x) + hitbox_h
						posy = floor(y) - hitbox_w
					break;
						
					case 2:
						posx = floor(x) + hitbox_w
						posy = floor(y) - hitbox_h
					break;
						
					case 3:
						posx = floor(x) - hitbox_h
						posy = floor(y) + hitbox_w
					break;
				}
				
				//Return new angle
				new_angle = get_angle(posx, posy, mode, reach_range);
			}
				
			//Get new angle from the middle ground sensor
			if(!line_check(-hitbox_w, hitbox_h+1, true) && !line_check(hitbox_w, hitbox_h+1, true) && line_check(0, hitbox_h+1, true))
			{
				posx = floor(x);
				posy = floor(y)-hitbox_w*(x_dir);
				
				//Return new angle
				new_angle = get_angle(posx, posy, mode);
			}
			
			//If player is on flat terrain force angle to the matching mode
			if(line_check(-hitbox_w, hitbox_h+1, true) && line_check(0, hitbox_h+1, true) && line_check(hitbox_w, hitbox_h+1, true))
			{
				new_angle = 90 * mode;
			}
		}
	}
	
	
	//Set ground angle to new angle
	ground_angle = new_angle;
	
}