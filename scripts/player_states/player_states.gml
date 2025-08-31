

function player_states(){	
	
	//Default flags:
	if(flag_override)
	{
		direction_allow = true;
		movement_allow = true;
		collision_allow = true;
		attacking = false;
		gravity_allow = true;
		hitbox_allow = true;
	}
	
	//State allowing flags:
	can_jump = false;
	can_roll = false;
	
	script_execute(state);	
	player_state_conditions();
	//Tails object
	player_handle_tails();
}


function player_state_conditions(){
	
	if(state == player_state_normal){
		if (ground_speed != 0 || x_speed != 0 || y_speed != 0) {
			idle_timer = 0;	
		}
	} else {
		idle_timer = 0;	
	}
	
	//Reset the timer
	if(state != player_state_jump || state == player_state_dropdash || shield != S_NONE && shield != S_NORMAL)
	{
		dropdash_timer = 0;
	}
	
	//JUMP
	
	//List of states that allow for jumping
	var can_jump_states = [player_state_normal, player_state_roll, player_state_skid];
	
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
	if(state == player_state_lookup && !global.use_peelout|| state == player_state_lookdown && !global.use_spindash)
	{
		can_jump = true;
	}
	
	//Trigger jump
	if(press_action && ground && !touching_ceiling && !force_roll && can_jump)
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
	}
	
	
	//Do the air roll
	if(press_action && !ground && global.use_airroll)
	{
		if(state == player_state_normal || state == player_state_spring)
		{
			state = player_state_jump;
			jump_flag = false;
			ceiling_lock = 2;
			jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
		}
	}
	
	//Trigger look down:
	if(state == player_state_normal || state == player_state_knuxfall)
	{
		if(ground && abs(ground_speed) < 1 && mode = 0 && hold_down)
		{
			state = player_state_lookdown;
			idle_timer = 0;
		}
	}
	
	//List of states that allow for jumping
	var can_roll_states = [player_state_normal, player_state_jump, player_state_lookdown, player_state_skid];
	
	//Run the loop on array
	for (var i = 0; i < array_length(can_roll_states); ++i) 
	{
		//If states match the ones on the list, allow for jumping
	    if(state == can_roll_states[i])
		{
			can_roll = true;
		}
	}
	
	//Trigger rolling
	if(can_roll && hold_down && abs(ground_speed) > 1 && ground)
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
	}
	
	//Stop if not specific state
	if(state != player_state_tailsfly)
	{
		audio_stop_sound(sfx_tailsfly);
		audio_stop_sound(sfx_tailstired);
	}
	
}