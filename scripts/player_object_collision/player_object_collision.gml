function player_object_collision(){
	var object = check_object(wall_w, hitbox_h, wall_w, hitbox_h)
	
	
	if(object && y + hitbox_h >= object.bbox_top)
	{
		//Left Wall
		while(check_object(0, hitbox_h, wall_w, hitbox_h) && (x + wall_w) + xprevious - x <= object.bbox_left){
			x -= 1;
		}
			
	
		//Right Wall
		while(check_object(wall_w, hitbox_h, 0, hitbox_h) && (x - wall_w) + xprevious - x >= object.bbox_right){
			x += 1;
		}	
		
	
		//Ceiling collision
		while(check_object(wall_w, hitbox_h, wall_w, 0) && y_speed <= 0 && !ground){
			y+=1;
			if(!ground)y_speed = 0;
		}
	}
	//Landing
	if(check_object(wall_w, 0, wall_w, hitbox_h, true) && !on_object && y_speed >= 0 && mode = 0){
		
		ground = true;
		landed = true;
		on_object = true;
	}
	
	//Switch on object flags fix
	if(line_check(-wall_w, hitbox_h+8) || line_check(wall_w, hitbox_h+8)) on_object = false;
	if(check_object(wall_w, 0, wall_w, hitbox_h+8, true) && mode = 0) 
	{
		if(!line_check(-wall_w, hitbox_h+8) || !line_check(wall_w, hitbox_h+8))
		on_object = true;
	}
	
	while(check_object(wall_w, 0, wall_w, hitbox_h, true) && mode != 0 && mode != 2){
			y -= 1;	
	}
	
	//Full ground collision POST
	if(ground && on_object && mode = 0){
		while(check_object(wall_w, 0, wall_w, hitbox_h+8, true) && !check_object(wall_w, 0, wall_w, hitbox_h, true)){
			y += 1;	
		}
		
		while(check_object(wall_w, 0, wall_w, hitbox_h, true)){
			y -= 1;	
		}
		
		if(!check_object(wall_w, 0, wall_w, hitbox_h+2, true)){
			on_object = false;
		}
	}
	
	//Disable on object collision in the air
	if(!ground) on_object = false;
}