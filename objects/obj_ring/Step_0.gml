/// @description Script
    //Set in front of the player
    depth = obj_player.depth - 1;
    
	if(!ringloss)
	{
	    //Sync the animation
	    image_index = global.object_timer / 5;
	}
	
    //Collect
    if(player_collide_object(C_MAIN) && obj_player.state != ST_KNOCKOUT)
    {
		//Play the sound
		play_sound(sfx_ring);
		
        //Add rings!
        global.rings += 1;    
        
        //Create the effect
        create_effect(x, y, spr_ring_sparkle, 0.45);
        
        //Destroy the ring
        instance_destroy();
    }
	
	//Ring physics
	if(magnet || ringloss)
	{
		//Speeds
		x += x_speed;
		y += y_speed;
		
		//Ring magnet
		if(!ringloss)
		{
			//Magnet physics
			if(x >= obj_player.x){
				if(x_speed < 0) x_speed -= 0.1875 else x_speed -= 0.75
			}
				
			if(x <= obj_player.x){
				if(x_speed > 0) x_speed += 0.1875 else x_speed += 0.75
			}
				
			if(y >= obj_player.y){
				if(x_speed < 0) y_speed -= 0.1875 else y_speed -= 0.75
			}
				
			if(y <= obj_player.y){
				if(y_speed > 0) y_speed += 0.1875 else y_speed += 0.75
			}
		}
		//Ring loss physics
		else
		{
			//Update sprite frame
			image_index += animation_speed;
			
			//Change ringloss animation speed
			if(timer > 32)animation_speed -= 0.0045;
			
			//Limit the speed
			animation_speed = max(animation_speed, 0.01);
			
			//Add timer
			timer += 1;
			
			//Destroy
			if(timer > 256) instance_destroy();
			
			//Gravity
			y_speed += 0.09375;
			
			//Collision offset
			var offx, offy;
			offx = (bbox_right - bbox_right)/2;
			offy = (bbox_bottom - bbox_top)/2;
			
			//Collision detection
			while(obj_check_point(x, floor(bbox_top), false) && y_speed < 0)
			{
				y_speed *= -1;
				y += 1;
			}
			while(obj_check_point(x, bbox_bottom, true) && y_speed > 0)
			{
				y_speed *= -1;
				y -= 1;
			}
			while(obj_check_point(bbox_left, y, false) && x_speed < 0)
			{
				x_speed *= -1;
				x += 1;
			}
			while(obj_check_point(bbox_right, y, false) && x_speed > 0)
			{
				x_speed *= -1;
				x -= 1;
			}

		}
	}