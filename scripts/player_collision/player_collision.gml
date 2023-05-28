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
	
	if(!on_object)
	{
		//Check landing
		if(y_speed >= 0 && !ground)
		{
			if(line_check(hitbox_w, hitbox_h, true) || line_check(-hitbox_w, hitbox_h, true))
			{
				ground = true;
				landed = true;
				
				player_angle_detection()
			
				//Landing speed (From 24 to 90 degrees)
				if(ground_angle >= 24 && ground_angle <= 90)
				{
			        if (ground_angle >= 45)
					{
			            ground_speed = (abs(x_speed) <= abs(y_speed) ? y_speed * -1 : x_speed);
			        }
			        else{
			            ground_speed = (abs(x_speed) <= abs(y_speed / 2.0) ? (y_speed / 2.0) * -1 : x_speed);
			        }
			    }
				
				//Landing speed (From 24 to 90 degrees)
				if(ground_angle <= 336 && ground_angle >= 270)
				{
			        if (ground_angle <= 315)
					{
			            ground_speed = (abs(x_speed) <= abs(y_speed) ? y_speed : x_speed);
			        }
			        else{
			            ground_speed = (abs(x_speed) <= abs(y_speed / 2.0) ? (y_speed / 2.0) : x_speed);
			        }
			    }
			}	
		}
	
		//Handle slope collision
		if(ground){
			//Detach off the ground
			if(!line_check(hitbox_w, hitbox_h+14, true) && !line_check(-hitbox_w, hitbox_h+14, true) && !force_roll && detach_allow)
			{
				ground = false;	
			}
		
				//Move down slope
				if(line_check(hitbox_w, hitbox_h+14, true) && !ramp_fix || line_check(-hitbox_w, hitbox_h+14, true) && !ramp_fix)
				{
					while(!line_check(hitbox_w, hitbox_h, true) && !line_check(-hitbox_w, hitbox_h, true))
					{
						x += x_dir;
						y += y_dir;	
					}
				}
		
				//Move up the slope:
				while(line_check(hitbox_w, hitbox_h, true) || line_check(-hitbox_w, hitbox_h, true))
				{
					x -= x_dir;
					y -= y_dir;	
				}
			}
	
			//Handle ceiling collision
			if(!ground)
			{
				//Ceiling landing code
				if(point_check(-hitbox_w, -hitbox_h) && !point_check(hitbox_w, -hitbox_h) && y_speed < -2.5 && ceiling_allow && !ground || point_check(hitbox_w, -hitbox_h) && !point_check(-hitbox_w, -hitbox_h) && y_speed < -2.5 && ceiling_allow && !ground){
					ceiling_landing = 1;	
				}
	
				if(ceiling_landing = 1){
					var TempAngle = get_angle();	
					if(TempAngle <= 180 - 25 || TempAngle >= 180 + 25) {
						ground_angle = get_angle();
						ceiling_landing = 2
					} else ceiling_landing = 0;
				}
	
				if(ceiling_landing = 2){
					if(ground_angle < 180) ground_speed = -y_speed; else ground_speed = y_speed;
		
					ceiling_landing = 0;
					control_lock = 2;
					ceiling_lock = 16;
					state = ST_NORMAL;
					ground = true
				}
				
				if(mode = 0)
				{
					while(line_check(hitbox_w, -hitbox_h) || line_check(-hitbox_w, -hitbox_h))
					{
						y += 1;
			
						//Stop vectical movement
						if(y_speed < 0) y_speed = 0;
					}
				}
			}
	}
}
