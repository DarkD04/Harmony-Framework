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
		//when i steal from the physics guide (:exploding_head:)
		var ringacceleration = [0.75, 0.1875];
		
		//relative positions
		var signx = sign(obj_player.x - x);
		var signy = sign(obj_player.y - y);
		
		//check relative movement
		var arrayx = (sign(x_speed) == signx);
		var arrayy = (sign(y_speed) == signy);
		
		x += x_speed;
		y += y_speed;
		
		if(!ringloss)
		{
		//add to speed
		x_speed += (ringacceleration[arrayx] * signx)
		y_speed += (ringacceleration[arrayy] * signy)
		
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