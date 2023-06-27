function player_wall_stoppers(){
	var object = check_object(wall_w+1, hitbox_h, wall_w+1, hitbox_h);
	
	if(object && y + hitbox_h + yprevious - y >= object.bbox_top)
	{
		//Left Wall
		if(check_object(0, hitbox_h, wall_w+1, hitbox_h) && (x + wall_w) + xprevious - x <= object.bbox_left && ground_speed > 0 && ground
		|| check_object(0, hitbox_h, wall_w+1, hitbox_h) && (x + wall_w) + xprevious - x <= object.bbox_left && x_speed > 0 && !ground){
			if(ground)ground_speed = 0;
			x_speed = 0;
			glide_speed = 0;
		}
			
	
		//Right Wall
		if(check_object(wall_w+1, hitbox_h, 0, hitbox_h) && (x - wall_w) + xprevious - x >= object.bbox_right && ground_speed < 0 && ground
		|| check_object(wall_w+1, hitbox_h, 0, hitbox_h) && (x - wall_w) + xprevious - x >= object.bbox_right && x_speed < 0 && !ground){
			if(ground)ground_speed = 0;
			x_speed = 0;
			glide_speed = 0;
		}
	}
	
	if(check_object(wall_w, hitbox_h+1, wall_w, 0) && y_speed < 0){
		if(mode = 1 || mode = 3)
			ground_speed = 0;
	}
		
	if(check_object(wall_w, 0, wall_w, hitbox_h+1) && y_speed > 0){
		if(mode = 1 || mode = 3)
		{
			x_speed = 0;
			ground_speed = 0;
		}
				
	}
		
	//Left wall collision
	if(point_check(-wall_w-1, wall_h) && x_speed < 0 && control_lock == 0)
	{
		if(ground)ground_speed = 0;
		x_speed = 0;
			
	}
	
	//Right wall collision
	if(point_check(wall_w+1, wall_h)&& x_speed > 0 && control_lock == 0)
	{
		if(ground)ground_speed = 0;
		x_speed = 0;
	}
	

}