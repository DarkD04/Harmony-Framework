function player_state_jump(){
	//List of states that allow for jumping
	var can_jump_states = [ST_NORMAL, ST_ROLL, ST_SKID];
	
	//Run the loop on array
	for (var i = 0; i < array_length(can_jump_states); ++i) 
	{
		//If states match the ones on the list, allow for jumping
	    if(state == can_jump_states[i])
		{
			can_jump = true;
		}
	}
	
	//If some of these flags are disabled, make an exception for some of the states
	if(state == ST_LOOKUP && !global.use_peelout|| state == ST_LOOKDOWN && !global.use_spindash)
	{
		can_jump = true;
	}
	
	//Trigger jump
	if(press_action && ground && !touching_ceiling && !force_roll && can_jump)
	{
		//Change animation
		animation_play(animator, ANIM_ROLL);
		
		//Jump off the terrain
		y_speed -= jump_strength * dcos(ground_angle);	
		x_speed -= jump_strength * dsin(ground_angle);
			
		//Trigger the jump flag
		jump_flag = true;
			
		//Detach player off the ground and change state
		ground = false;
		state = ST_JUMP
			
		//Change jump animation duration
		jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
			
		//Reset angle and floor mode
		ground_angle = 0;
		player_reposition_mode(CMODE_FLOOR);
			
		//Play the sound
		play_sound(sfx_jump);
	}
	
	
	//Do the air roll
	if(press_action && !ground && global.use_airroll)
	{
		if(state == ST_NORMAL || state == ST_SPRING)
		{
			state = ST_JUMP;
			jump_flag = false;
			ceiling_lock = 2;
			jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
		}
	}
	
	//Stop if its not jump state
	if(state != ST_JUMP) 
	{
		exit;
	}
	
	//Change flags
	attacking = true;
	
	//Limit the jump when key is released
	if(!hold_action && y_speed < -jump_release && jump_flag)
	{
		jump_flag = false;
		y_speed = -jump_release;
	}

	//Change animation
	animation_play(animator, ANIM_ROLL);
	
	//Change animation speed
	if(character != CHAR_TAILS)
	{
		animation_set_duration(animator, jump_anim_speed);
	}
	
	//Reset when grounded
	if(ground) state = ST_NORMAL;
}