function player_state_normal(){
	//Add the idle timer
	if(ground_speed == 0 && !input_disable)
	{
		idle_timer++;
	}
	else
	{
		idle_timer = 0;	
	}
	
	//Trigger look down:
	if(ground && abs(ground_speed) < 0.5 && mode = 0 && hold_up)
	{
		state = player_state_lookup;
		idle_timer = 0
		exit;
	}
	
	//Value for the animation
	var anim = ANIM.STAND;
	
	//Default animation:
	if (ground)
	{
		anim = ANIM.STAND;
	}
	else
	{
		if(!animation_is_playing(animator, ANIM.BREATHE))
		{
			anim = ANIM.WALK;
		}
	}
		
	//Walking animation:
	if(abs(ground_speed) > 0 && abs(ground_speed) <= 6)
	{
		anim = ANIM.WALK;
		
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
		anim = ANIM.RUN;
		
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
		anim = ANIM.MAXRUN;
	}
	
	//Idle animations
	switch(character)
	{
		case CHAR_SONIC:
			if(idle_timer > 160)
			{
				anim = ANIM.WAIT;	
			}
		break;
		
		case CHAR_TAILS:
			if(idle_timer > 240)
			{
				anim = ANIM.WAIT;
			}
		break;
		
		case CHAR_KNUX:
			if(idle_timer > 160)
			{
				anim = ANIM.WAIT;	
			}
		break;
	}
	
	//Ledge animation
	if(!line_check(0, hitbox_h + 16, true) && !check_object(0, 0, 1, hitbox_h + 8, true) && ground && ground_speed == 0)
	{
		//Change animation
		if(!line_check(hitbox_w, hitbox_h + 16, true) && !check_object(-wall_w, 0, wall_w, hitbox_h + 8, true))
		{
			anim = facing = 1 ? ANIM.LEDGE2 : ANIM.LEDGE1;
		}
		if(!line_check(-hitbox_w, hitbox_h + 16, true) && !check_object(wall_w, 0, -wall_w, hitbox_h + 8, true))
		{
			anim = facing = -1 ? ANIM.LEDGE2 : ANIM.LEDGE1;
		}
	}
		
	//Get input presses
	var mov = hold_right - hold_left;
		
	//Pushing animation
	if(mov = facing && ground && abs(ground_speed) <= x_accel + 0.5)
	{
		if(point_check((wall_w + 1) * facing, wall_h)|| check_object(-(wall_w + 1) * facing, hitbox_h, (wall_w + 1) * facing, hitbox_h))
		{
			anim = ANIM.PUSH;
		}
	}
	
	//Play the animations
	if(!animation_is_playing(animator, ANIM.BREATHE) || animation_has_finished(animator) && animation_is_playing(animator, ANIM.BREATHE))
	{
		animation_play(animator, anim);
	}
	
	mov = hold_right - hold_left;
	
	//Trigger the state
	if(mov = -sign(ground_speed) && ground && abs(ground_speed) > 4 && sign(ground_speed) == facing && mode == 0 && control_lock == 0)
	{
		//Play animation
		animation_play(animator, ANIM.SKID);
		
		//Play the skid sound
		play_sound(sfx_skid);
		
		//Reset the skid timer and update the state
		skid_timer = 0;
		state = player_state_skid;
		exit;
	}
}