function player_angle_detection(){
	//Disable angle detection if ground collision is not allowed
	if(!ground_collision_allow) exit;
	
	//Temp values
	var posx, posy, new_angle;
	
	//Reset angle to the default
	new_angle = 0;
	
	//Reset ramp flag to default
	on_edge = false;
	
	//Ground angle detection
	if(ground)
	{
		//Get new ground angle
		if(!on_object && !on_edge)
		{
			//Get new angle from left ground sensor
			if(line_check(-hitbox_w, hitbox_h+1, true) && !line_check(hitbox_w, hitbox_h+1, true))
			{
				posx = floor(x)-hitbox_w*abs(y_dir);
				posy = floor(y)+hitbox_w*(x_dir);
				
				//Return new angle
				new_angle = get_angle(posx, posy, mode);
			}
			
			//Get new angle from right ground sensor
			if(!line_check(-hitbox_w, hitbox_h+1, true) && line_check(hitbox_w, hitbox_h+1, true))
			{
				posx = floor(x)+hitbox_w*abs(y_dir);
				posy = floor(y)-hitbox_w*(x_dir);
				
				//Return new angle
				new_angle = get_angle(posx, posy, mode);
			}
			
			//If player is on flat terrain force angle to the matching mode
			if(line_check(-hitbox_w, hitbox_h+1, true) && line_check(hitbox_w, hitbox_h+1, true))
			{
				new_angle = 90 * mode;
			}
		}
		
		//Floor ramp fixes
		if(mode == 0 && !landed && ground_angle == 0)
		{
			//Left ramp edge
			if(!line_check(-hitbox_w, hitbox_h+1, true) && line_check(hitbox_w, hitbox_h+1, true))
			{
				//Get temporary ground angle
				var temp_ang = get_angle(x-wall_w, y+hitbox_h, 0);
			
				//Calculate difference between current ground angle and temp angle
				var ang_diff = abs(ground_angle-temp_ang);
			
				//If difference is too steep disable force angle detection to 0 and disable slope push down
				if(ang_diff > 45 && ang_diff <= 270)
				{
					new_angle = 0;
					on_edge = true;
				}
			}
			
			//Right ramp edge
			if(line_check(-hitbox_w, hitbox_h+1, true) && !line_check(hitbox_w, hitbox_h+1, true))
			{
				//Get temporary ground angle
				var temp_ang = get_angle(x+wall_w, y+hitbox_h, 0);
			
				//Calculate difference between current ground angle and temp angle
				var ang_diff = abs(ground_angle-temp_ang);
			
				//If difference is too steep disable force angle detection to 0 and disable slope push down
				if(ang_diff < 315 && ang_diff >= 270)
				{
					on_edge = true;
				}
			}
		}
	}
	
	//Set ground angle to new angle
	ground_angle = new_angle;
}