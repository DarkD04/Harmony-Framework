function player_state_lookup(){
	
	//If global value for peelout is diabled don't execute
	if(global.use_peelout) 
	{
		//Trigger peel out
		if(press_action && ground && character == CHAR_SONIC)
		{
			play_sound(sfx_peelout_charge);
			state = player_state_peelout
			spindash_rev = 0;
			exit;
		}
	}
	
	if(press_action && ground && !touching_ceiling && !force_roll)
	{
		//Change animation
		animation_play(animator, ANIM.ROLL);
		
		//Jump off the terrain
		y_speed -= jump_strength * dcos(ground_angle);	
		x_speed -= jump_strength * dsin(ground_angle);
			
		//Trigger the jump flag
		jump_flag = true;
			
		//Detach player off the ground and change state
		ground = false;
		state = player_state_jump
		dropdash_timer = 0;
		idle_timer = 0;
		//Change jump animation duration
		jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
			
		//Reset angle and floor mode
		ground_angle = 0;
		player_reposition_mode(CMODE_FLOOR);
			
		//Play the sound
		play_sound(sfx_jump);
		exit;
	}
	
	//Change flags
	movement_allow = false;
	direction_allow = false; 
	
	//Change animation
	animation_play(animator, ANIM.LOOKUP);
	
	//Slow crouch
	ground_speed = approach(ground_speed, 0, friction_speed);
	
	//Release
	if(!hold_up) 
	{
		state = player_state_normal;
	}
}