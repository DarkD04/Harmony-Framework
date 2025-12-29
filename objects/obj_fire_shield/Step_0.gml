/// @description Script
	//Update the animator
	animator_update(animator);
	
	//Get the frame
	var frame = animation_get_frame(animator) % 2;
	
	//Change depth
	if(frame == 0 && shield_state == 0)
	{
		depth = obj_player.depth + 10;
	}
	else
	{
		depth = obj_player.depth - 10;	
	}
	
	//When dashing
	if(shield_state == 1)
	{
		//Change animation
		animation_play(animator, 1);
		
		//Reset shield state
		if(obj_player.ground || obj_player.state != player_state_jump)
		{
			animation_play(animator, 0);
			shield_state = 0;	
		}
			
		//Change direction
		if(obj_player.x_speed != 0)
		{
			image_xscale = sign(obj_player.x_speed);
		}
			
		//Make back shield gone
		//visible = true;
		//back.visible = false;
	}

	
	//Begone when underwater
	if(obj_player.underwater) 
	{
		obj_player.shield = S_NONE;
	}
	