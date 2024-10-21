function player_object_collision(){
	var object = check_object(wall_w, hitbox_h, wall_w, hitbox_h)
	 
	if(object && yprevious + hitbox_h >= object.bbox_top)
	{
		//This is for rare cases, for example if there's a full moving solid object and you want player to be pushed out
		var wall_collision_bottom = false;
		if(variable_instance_exists(object, "wall_bottom"))
		{
			wall_collision_bottom = object.wall_bottom;
		}
		
		//Check flag for if player is below a solid
		var on_the_bottom = yprevious + hitbox_h >= object.bbox_bottom && ground && wall_collision_bottom;
		
		//Difference between current and previous x position of the player
		var previous_diff_x = xprevious - x;
		
		//Wall collision check cases
		var can_left = x + wall_w + previous_diff_x <= object.bbox_left || on_the_bottom;
		var can_right = x - wall_w + previous_diff_x >= object.bbox_right || on_the_bottom;
		
		//Left Wall
		while(check_object(0, hitbox_h, wall_w, hitbox_h) && can_left)
		{
			x -= 1;
		}
			
	
		//Right Wall
		while(check_object(wall_w, hitbox_h, 0, hitbox_h) && can_right)
		{
			x += 1;
		}	

		//Ceiling collision
		while(check_object(wall_w, hitbox_h, wall_w, 0) && y_speed <= 0){
			y+=1;
			if(!ground)
			{
				y_speed = 0;
			}
		}
	}
	//Landing
	if(check_object(wall_w, 0, wall_w, hitbox_h, true) && !on_object && y_speed >= 0 && mode = 0){
		ground_speed = x_speed;
		ground = true;
		landed = true;
		on_object = true;
	}
	
	//FIX: Extending bottom
	var bottom_ext = 8+max(y-yprevious, 0)

	//Switch on object flags fix
	if(check_object(wall_w, 0, wall_w, hitbox_h+2, true) && mode = 0) 
	{
		on_object = true;
	}
	
	while(check_object(wall_w, 0, wall_w, hitbox_h, true) && mode != 0 && mode != 2)
	{
			y -= 1;	
	}
	
	if(on_object)
	{
		ground_angle = 0;
	}
		
	//Full ground collision POST
	if(ground && mode = 0){
		while(check_object(wall_w, 0, wall_w, hitbox_h+bottom_ext, true) && !check_object(wall_w, 0, wall_w, hitbox_h, true)){
			y += 1;	
		}
		
		while(check_object(wall_w, 0, wall_w, hitbox_h, true))
		{
			y -= 1;	
		}
		
		if(!check_object(wall_w, 0, wall_w, hitbox_h+bottom_ext, true))
		{
			on_object = false;
		}
	}
	
	//Disable on object collision in the air
	if(!ground) 
	{
		on_object = false;
	}
}