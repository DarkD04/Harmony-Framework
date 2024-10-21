function player_state_normal(){
	//Add the idle timer
	if(state == ST_NORMAL && ground_speed == 0 && !input_disable)
	{
		idle_timer++;
	}
	else
	{
		idle_timer = 0;	
	}
	
	//Stop executing if its not the specific state:
	if(state != ST_NORMAL) exit;
	
	//Value for the animation
	var anim = ANIM_STAND;
	
	//Default animation:
	if (ground)
	{
		anim = ANIM_STAND;
	}
	else
	{
		if(!animation_is_playing(animator, ANIM_BREATHE))
		{
			anim = ANIM_WALK;
		}
	}
		
	//Walking animation:
	if(abs(ground_speed) > 0 && abs(ground_speed) <= 6)
	{
		anim = ANIM_WALK;
		
		//Change animation duration when player is only on the ground:
		if(ground)
		{
			animation_set_duration(animator, (max(0, 8-abs(obj_player.ground_speed))));
		}
	}
		
	//Running animation:
	if(abs(ground_speed) >= 6)
	{
		//Update the animation
		anim = ANIM_RUN;
		
		//Change animation duration when player is only on the ground:
		if(ground)
		{
			switch(character)
			{
				//Tails has different running animation duration
				case CHAR_TAILS: 
					animation_set_duration(animator, 1); 
				break;
				
				//Animation duration for everyone expect tails
				default: 
					animation_set_duration(animator, (max(0, 8-abs(obj_player.ground_speed)))); 
				break;
			}
		}
	}
		
	//Running animation:
	if(abs(ground_speed) >= 12)
	{
		anim = ANIM_MAXRUN;
	}
	
	//Idle animations
	switch(character)
	{
		case CHAR_SONIC:
			if(idle_timer > 160)
			{
				anim = ANIM_WAIT;	
			}
		break;
		
		case CHAR_TAILS:
			if(idle_timer > 240)
			{
				anim = ANIM_WAIT;
			}
		break;
		
		case CHAR_KNUX:
			if(idle_timer > 160)
			{
				anim = ANIM_WAIT;	
			}
		break;
	}
	
	//Ledge animation
	if(!line_check(0, hitbox_h + 16, true) && !check_object(0, 0, 1, hitbox_h + 8, true) && ground && ground_speed == 0)
	{
		//Change animation
		if(!line_check(hitbox_w, hitbox_h + 16, true) && !check_object(-wall_w, 0, wall_w, hitbox_h + 8, true))
		{
			anim = facing = 1 ? ANIM_LEDGE2 : ANIM_LEDGE1;
		}
		if(!line_check(-hitbox_w, hitbox_h + 16, true) && !check_object(wall_w, 0, -wall_w, hitbox_h + 8, true))
		{
			anim = facing = -1 ? ANIM_LEDGE2 : ANIM_LEDGE1;
		}
	}
		
	//Get input presses
	var mov = hold_right - hold_left;
		
	//Pushing animation
	if(mov = facing && ground && abs(ground_speed) <= x_accel + 0.5)
	{
		if(point_check((wall_w + 1) * facing, wall_h)|| check_object(-(wall_w + 1) * facing, hitbox_h, (wall_w + 1) * facing, hitbox_h))
		{
			anim = ANIM_PUSH;
		}
	}
	
	//Play the animations
	if(!animation_is_playing(animator, ANIM_BREATHE) || animation_has_finished(animator) && animation_is_playing(animator, ANIM_BREATHE))
	{
		animation_play(animator, anim);
	}
}