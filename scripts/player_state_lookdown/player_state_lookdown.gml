function player_state_lookdown(){
	
	//Change flags
	movement_allow = false;
	direction_allow = false; 
	
	//Change animation
	animation_play(animator, ANIM.LOOKDOWN);
	
	//Slow crouch
	ground_speed = approach(ground_speed, 0, friction_speed);
	
	//Slope influence
	if(ground_angle >= 40 && ground_angle <= 320) 
	{
		ground_speed -= 0.125 * dsin(ground_angle);
	}
	
	//Stop crouching when releasing the down key
	if(!hold_down) 
	{
		state = player_state_normal;
		exit;
	}
	
	//Trigger the spindash
	if(press_action && global.use_spindash)
	{
		//Reset the spindash pitch
		audio_sound_pitch(sfx_spindash, 1);
		
		//Change animation
		animation_play(animator, ANIM.SPINDASH);
	
		//Reset variables
		spindash_rev = 0;
		spindash_pitch = 0;
		spindash_dust_frames = 0;
		
		//Update the state
		state = player_state_spindash;
		play_sound(sfx_spindash);
		exit;
	}
	
	//Trigger rolling
	if(hold_down && abs(ground_speed) > 1 && ground)
	{

		//Play the rolling animation
		animation_play(animator, ANIM.ROLL);
		
		//Update the state
		if(!landed)
		{
			state = player_state_roll;
			idle_timer = 0;
			
			//Play the sound
			play_sound(sfx_roll);
		}
		exit;
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
}