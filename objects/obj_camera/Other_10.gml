	/// @description Normal scroll	
	//Apply the scrolling speeds
	x_speed = scroll_speed_x;
	y_speed = scroll_speed_y;
	
	//Debug scrolling speeds to prevent the camera lag
	if(target.debug)
	{
		x_speed = abs(target.x_speed) + 1;
		y_speed = abs(target.y_speed) + 1;
	}
	
	//Horizontal camera movement:
	if(h_lag = 0)
	{
		//Scroll camera left:
		if(target.x < target_x - 16) 
		{
			target_x = max(target_x - x_speed, target.x + 16);
		}
		
		//Scroll camera right:
		if(target.x > target_x) 
		{
			target_x = min(target_x + x_speed, target.x);
		}
	}
		
	//Vertical camera movement while player is airborn:
	if(v_lag = 0)
	{
		switch(global.camera_type)
		{
			case 0: //Mega drive games camera
				//Vertical scroll speed during ground movement:
				var y_scroll_speed;
	
				//Get vertical y speed:
				y_scroll_speed = 2 + max(abs(target.ground_speed * dsin(target.ground_angle)), 4)
		
				//Vertical scroll on the ground:
				if(instance_exists(obj_bubble_shield) && obj_bubble_shield.shield_state = 0 || !instance_exists(obj_bubble_shield))
				{
					//Scroll camera upwards:
					if(target.y < target_y && target.ground && target.state != ST_KNUXSLIDE) 
					{
						target_y = max(target_y - min(y_scroll_speed, y_speed), target.y - roll_offset);
					}
					
					//Scroll camera downwards:
					if(target.y > target_y && target.ground && target.state != ST_KNUXSLIDE) 
					{
						target_y = min(target_y + min(y_scroll_speed, y_speed), target.y - roll_offset);
					}
				}
		
				//Scroll camera upwards:
				if(target.y < target_y - 32)
				{
					if(!target.ground || target.state = ST_KNUXSLIDE)
					{
						target_y = max(target_y - y_speed, target.y + 32);
					}
				}
		
				//Scroll camera downwards:
				if(target.y > target_y + 32)
				{
					if(!target.ground || target.state = ST_KNUXSLIDE)
					{
						target_y = min(target_y + y_speed, target.y - 32);
					}
				}
			break;
			
			
			case 1: 
				//Sonic mania camera
				//That mania smooth focusing
				if(!target.ground || target.state = ST_KNUXSLIDE)
				{
					//Reset the ground offset
					ground_offset = 32;
					
					//Scroll camera upwards
					if(target.y < target_y-ground_offset) 
					{
						target_y = max(target_y - y_speed, target.y + ground_offset);
					}
		
					//Scroll camera downwards:
					if(target.y > target_y+ground_offset) 
					{
						target_y = min(target_y + y_speed, target.y - ground_offset);
					}
				}
				
				if(target.ground && target.state != ST_KNUXSLIDE)
				{
					//Ease down the camera offset
					ground_offset = ground_offset - ground_offset / 8;
					
					//Scroll camera upwards
					if(target.y < target_y - ground_offset+roll_offset) 
					{
						target_y = max(target_y - y_speed, target.y + ground_offset - roll_offset);
					}
					
					//Scroll camera downwards:
					if(target.y > target_y + ground_offset + roll_offset) 
					{
						target_y = min(target_y + y_speed, target.y - ground_offset - roll_offset);
					}
				}
			break;
		}
	}
	
	//Look up and down
	if(target.state == ST_LOOKUP)
	{
		look_timer -= 1;
	}
		
	if(target.state == ST_LOOKDOWN)
	{
		look_timer += 1;
	}
		
	//Restart looking timer
	if(target.state != ST_LOOKUP && look_timer < 0 || target.state != ST_LOOKDOWN && look_timer > 0)
	{
		look_timer = 0;
	}
		
	//Shifting time
	if(look_timer <= -120)
	{
		look_shift = approach(look_shift, -104, 2);
	}
	
	if(look_timer >= 120)
	{
		look_shift = approach(look_shift, 88, 2);
	}
	
	//Shift back
	if(look_timer = 0)
	{
		look_shift = approach(look_shift, 0, 2);
	}