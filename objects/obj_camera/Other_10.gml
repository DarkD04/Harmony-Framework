/// @description Normal scroll	
	//Horizontal camera movement:
	if(h_lag = 0)
	{
		//Scroll camera left:
		if(target.x < target_x-16) target_x = max(target_x - 16, target.x + 16);
		
		//Scroll camera right:
		if(target.x > target_x) target_x = min(target_x + 16, target.x);
	}
		
	//Vertical camera movement while player is airborn:
	if(v_lag = 0)
	{
		//Vertical scroll speed during ground movement:
		var y_scroll_speed;
	
		//Get vertical y speed:
		y_scroll_speed = (target.ground_speed * dsin(target.ground_angle))
		
		//Vertical scroll on the ground:
		if(instance_exists(obj_bubble_shield) && obj_bubble_shield.shield_state = 0 || !instance_exists(obj_bubble_shield)){
			if(target.y < target_y && target.ground && target.mode != 0) target_y = max(target_y - min(1+abs(y_scroll_speed), 16), target.y - roll_offset)
			if(target.y < target_y && target.ground && target.mode = 0) target_y = max(target_y - min(6+abs(y_scroll_speed), 16), target.y - roll_offset)
			if(target.y > target_y && target.ground) target_y = min(target_y + min(6+abs(y_scroll_speed), 16), target.y - roll_offset);
		}
		//Scroll camera upwards:
		if(target.y < target_y-32 && !target.ground) target_y = max(target_y - 16, target.y + 32);
		
		//Scroll camera downwards:
		if(target.y > target_y+32 && !target.ground) target_y = min(target_y + 16, target.y - 32 );
	}