/// @description Script	
	//Update the animator
	animator_update(animator);
	animator_update(animator_front);
	
	//Reset animation index
	if(animation_is_playing(animator, 2) && animation_has_finished(animator) && shield_state = 0)
	{
		animation_play(animator, 0);
	}
	
	//Double jump
	if(obj_player.press_action && !obj_player.ground && obj_player.state == ST_JUMP 
	&& shield_state == 0 && use_allow) 
	{
		//Player double jump
		obj_player.x_speed = 0;
		obj_player.y_speed = 8;
		
		//Switch shield state
		shield_state = 1;
		
		//Play sound
		play_sound(sfx_bubble_jump)
		
		//Change animation
		animation_play(animator, 1);
	}
	
	//Reset state flag
	if(shield_state == 1 && obj_player.ground || shield_state == 1 && obj_player.y_speed < 0)
	{
		//Player bounce
		if(obj_player.ground)
		{
			obj_player.x_speed = (dsin(obj_player.ground_speed) * dcos(obj_player.ground_angle) +  -7.5 / (1 + obj_player.underwater)) * dsin(obj_player.ground_angle);
            obj_player.y_speed = (dcos(obj_player.ground_speed) * dsin(obj_player.ground_angle) +  -7.5 / (1 + obj_player.underwater)) * dcos(obj_player.ground_angle);
			obj_player.ground = false;
			obj_player.state = ST_JUMP;
			obj_player.jump_flag = true;
			
			animation_play(obj_player.animator, ANIM_ROLL);
			
			//Play sound
			play_sound(sfx_bubble_jump)
		}
		
		//Reset shield state
		shield_state = 0;	
		
		//Change animation
		animation_play(animator, 2);
		
		//Reset frame
		image_index = 0;
	}
	
	//Reset players air
	obj_player.air = 0;